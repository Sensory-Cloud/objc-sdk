//
//  FileParser.m
//  objc-sdk
//
//  Created by Niles Hacking on 2/28/23.
//

#import <Foundation/Foundation.h>
#import "FileParser.h"
#import "GRPCClient/GRPCTransport.h"
#import "Initializer.h"

static NSString * const kErrorDomain = @"ai.SensoryCloud.FileParser";

static NSString * const kConfigKeyFQDN = @"fullyQualifiedDomainName";
static NSString * const kConfigKeyIsSecure = @"isSecure";
static NSString * const kConfigKeyTenantID = @"tenantID";
static NSString * const kConfigKeyEnrollmentType = @"enrollmentType";
static NSString * const kConfigKeyCredential = @"credential";
static NSString * const kConfigKeyDeviceID = @"deviceID";
static NSString * const kConfigKeyDeviceName = @"deviceName";

static NSString * const kEnrollmentTypeNone = @"none";
static NSString * const kEnrollmentTypeSharedSecret = @"sharedSecret";
static NSString * const kEnrollmentTypeJWT = @"jwt";

@implementation SENFileParser

+ (struct SENInitConfig) parseConfigFile: (NSURL*)fileURL errorPtr: (out NSError**)error {
    NSString* fileContents = [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:error];
    if ([fileContents length] == 0) {
        if (error != nil) {
            NSString* description = [NSString stringWithFormat:@"Could not find file with URL: %@", fileURL];
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description};
            *error = [NSError errorWithDomain:kErrorDomain code:GRPCErrorCodeNotFound userInfo:userInfo];
        }
        struct SENInitConfig emptyConfig;
        emptyConfig.fullyQualifiedDomainName = @"";
        return emptyConfig;
    }
    NSMutableDictionary* contents = [[NSMutableDictionary alloc] init];
    NSArray* lines = [fileContents componentsSeparatedByString:@"\n"];
    for (NSString* line in lines) {
        NSString* processed = [SENFileParser stripCommentsFromString:line];
        if (![processed containsString:@"="]) {
            continue;
        }

        NSArray* parts = [processed componentsSeparatedByString:@"="];
        if ([parts count] == 2) {
            NSString* key = [SENFileParser trimString:parts[0]];
            NSString* value = [SENFileParser trimString:parts[1]];
            contents[key] = value;
        }
    }

    return [SENFileParser parseContentsToConfig:contents errorPtr:error];
}

+ (NSString*) stripCommentsFromString: (NSString*)line {
    NSArray* parts = [line componentsSeparatedByString:@"#"];
    if ([parts count] > 0) {
        return parts[0];
    }
    return @"";
}

+ (NSString*) trimString: (NSString*)str {
    NSCharacterSet* whitespaces = [NSCharacterSet characterSetWithCharactersInString:@" \n\r\t\""];
    return [str stringByTrimmingCharactersInSet:whitespaces];
}

+ (struct SENInitConfig) parseContentsToConfig: (NSDictionary*)contents errorPtr: (out NSError**)error {
    NSError* readError;
    struct SENInitConfig config;
    config.fullyQualifiedDomainName = [SENFileParser getValueForKey:kConfigKeyFQDN contents:contents errorPtr:&readError];
    NSString* isSecureStr = [SENFileParser getValueForKey:kConfigKeyIsSecure contents:contents errorPtr:&readError];
    config.tenantId = [SENFileParser getValueForKey:kConfigKeyTenantID contents:contents errorPtr:&readError];
    NSString* enrollmentTypeStr = [SENFileParser getValueForKey:kConfigKeyEnrollmentType contents:contents errorPtr:&readError];
    config.credential = [SENFileParser getValueForKey:kConfigKeyCredential contents:contents errorPtr:&readError];
    config.deviceId = contents[kConfigKeyDeviceID];
    config.deviceName = contents[kConfigKeyDeviceName];

    config.isSecure = [[SENFileParser truthyVals] containsObject:isSecureStr];
    if ([enrollmentTypeStr isEqualToString:kEnrollmentTypeNone]) {
        config.enrollmentType = kNone;
    } else if ([enrollmentTypeStr isEqualToString:kEnrollmentTypeSharedSecret]) {
        config.enrollmentType = kSharedSecret;
    } else if ([enrollmentTypeStr isEqualToString:kEnrollmentTypeJWT]) {
        config.enrollmentType = kJWT;
    } else {
        NSString* description = [NSString stringWithFormat:@"Invalid config enrollment type: %@", enrollmentTypeStr];
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description};
        readError = [NSError errorWithDomain:kErrorDomain code:GRPCErrorCodeInvalidArgument userInfo:userInfo];
    }

    if (readError != nil) {
        if (error != nil) {
            *error = readError;
        }
        struct SENInitConfig emptyConfig;
        emptyConfig.fullyQualifiedDomainName = @"";
        return emptyConfig;
    }

    return config;
}

+ (NSString*) getValueForKey: (NSString*)key contents:(NSDictionary*)contents errorPtr: (out NSError**)error {
    NSString* value = contents[key];
    if (value == nil) {
        if (error != nil) {
            NSString* description = [NSString stringWithFormat:@"Missing config value for key %@", key];
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description};
            *error = [NSError errorWithDomain:kErrorDomain code:GRPCErrorCodeInvalidArgument userInfo:userInfo];
        }
        return nil;
    }
    return value;
}

+ (NSArray*) truthyVals {
    return @[@"true", @"True", @"TRUE", @"T", @"t", @"yes", @"Yes", @"YES", @"y", @"Y", @"1"];
}

@end
