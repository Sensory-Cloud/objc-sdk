//
//  KeychainManager.m
//  objc-sdk
//
//  Created by Niles Hacking on 2/21/23.
//

#import <Foundation/Foundation.h>
#import "KeychainManager.h"

static NSString * const kErrorDomain = @"ai.SensoryCloud.KeychainManager";
static NSString * const kClientIdTag = @"Sensory_Client_ID";
static NSString * const kClientSecretTag = @"Sensory_Client_Secret";

@implementation SENKeychainManager

- (bool)saveCredentials: (NSString*) clientId secret:(NSString*) secret errorPtr:(out NSError**)error {
    if (![self saveStringWithTag:kClientIdTag value:clientId errorPtr:error]) {
        return FALSE;
    }
    if (![self saveStringWithTag:kClientSecretTag value:secret errorPtr:error]) {
        return FALSE;
    }
    return TRUE;
}

- (nonnull NSString *)getClientId:(out NSError**)error {
    return [self getStringWithTag:kClientIdTag errorPtr:error];
}

- (nonnull NSString *)getClientSecret:(out NSError**)error {
    return [self getStringWithTag:kClientSecretTag errorPtr:error];
}

- (bool)deleteSavedCredentials: (out NSError**)error {
    if (![self deleteEntryWithTag:kClientIdTag errorPtr:error]) {
        return FALSE;
    }
    if (![self deleteEntryWithTag:kClientSecretTag errorPtr:error]) {
        return FALSE;
    }
    return TRUE;
}

- (bool)saveStringWithTag: (NSString*)tag value: (NSString*)value errorPtr:(out NSError**)error {
    NSData* data = [value dataUsingEncoding:NSUTF8StringEncoding];
    return [self saveDataWithTag:tag data:data errorPtr:error];
}

- (bool)saveDataWithTag: (NSString*)tag data: (NSData*)data errorPtr:(out NSError**)error {
    if (![self deleteEntryWithTag:tag errorPtr:error]) {
        return FALSE;
    }

    NSDictionary *query = @{ (id)kSecClass: (id)kSecClassKey,
                             (id)kSecAttrAccessible: (id)kSecAttrAccessibleWhenUnlockedThisDeviceOnly,
                             (id)kSecAttrApplicationTag: tag,
                             (id)kSecValueData: data,
    };

    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)query, nil);
    if (status != errSecSuccess) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Unable to save value to keychain" status:status];
        }
        return FALSE;
    }
    return TRUE;
}

- (NSString*)getStringWithTag: (NSString*)tag errorPtr:(out NSError**)error {
    NSData* resultData = [self getDataWithTag:tag errorPtr:error];
    if (resultData == nil) {
        return nil;
    }

    NSString *result = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    return result;
}

- (NSData*)getDataWithTag: (NSString*)tag errorPtr:(out NSError**)error {
    NSDictionary *query = @{ (id)kSecClass: (id)kSecClassKey,
                             (id)kSecAttrApplicationTag: tag,
                             (id)kSecReturnData: @YES,
    };

    CFTypeRef result = nil;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    if (status != errSecSuccess) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Unable to load value from keychain" status:status];
        }
        return nil;
    }
    return (__bridge NSData *)result;
}

- (bool)deleteEntryWithTag: (NSString*)tag errorPtr:(out NSError**)error {
    NSDictionary *query = @{ (id)kSecClass: (id)kSecClassKey,
                             (id)kSecAttrApplicationTag: tag,
    };

    OSStatus status = SecItemDelete((__bridge CFDictionaryRef) query);
    if (status != errSecSuccess && status != errSecItemNotFound) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Unable to delete item from keychain" status:status];
        }
        return FALSE;
    }
    return TRUE;
}

- (NSError*)generateErrorWithDescription: (NSString*)description status:(OSStatus)status {
    NSString *statusStr = [NSString stringWithFormat:@"%d", status];
    NSString *statusMsg = (__bridge_transfer NSString*) SecCopyErrorMessageString(status, nil);
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description, @"osStatus": statusStr, @"statusMsg": statusMsg};
    return [NSError errorWithDomain: kErrorDomain code:status userInfo:userInfo];
}

@end
