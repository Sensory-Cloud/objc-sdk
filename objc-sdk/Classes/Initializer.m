//
//  Initializer.m
//  objc-sdk
//
//  Created by Niles Hacking on 2/27/23.
//

#import <Foundation/Foundation.h>
#import "Initializer.h"
#import "OAuthService.h"
#import "GRPCClient/GRPCTransport.h"
#import "Oauth.pbrpc.h"

static NSString * const kErrorDomain = @"ai.sensoryCloud.Initializer";

@implementation SENInitializer

static struct SENInitConfig* _sharedConfig;

+ (struct SENInitConfig*)sharedConfig {
    return _sharedConfig;
}

+ (void)setSharedConfig:(struct SENInitConfig*)newSharedConfig {
    _sharedConfig = newSharedConfig;
}

+ (void) initializeWithConfig: (struct SENInitConfig*)config
                 oAuthService: (SENOAuthService*)service
                      handler: (void (^)(SENGDeviceResponse*, NSError*))handler {
    [SENInitializer setSharedConfig: config];

    NSError* clientError, *secretError;
    [service.credentialStore getClientId:&clientError];
    [service.credentialStore getClientSecret:&secretError];
    if (clientError != nil && secretError != nil) {
        // SDK has been previously enrolled
        handler(nil, nil);
        return;
    }

    NSString* credential = @"";
    switch(config->enrollmentType) {
    case kNone:
        break;
    case kSharedSecret:
        credential = config->credential;
        break;
    case kJWT: {
        NSString* description = @"JWT enrollment is currently not supported by the SDK";
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description};
        NSError* error = [NSError errorWithDomain:kErrorDomain code:GRPCErrorCodeUnimplemented userInfo:userInfo];
        [SENInitializer setSharedConfig: nil];
        handler(nil, error);
        return;
        }
    }

    NSError* generationError;
    NSString* clientId = [service generateClientId];
    NSString* clientSecret = [service generateClientSecret: &generationError];
    if (generationError != nil) {
        [SENInitializer setSharedConfig: nil];
        handler(nil, generationError);
        return;
    }

    void (^rspHandler)(SENGDeviceResponse*, NSError*) = ^void (SENGDeviceResponse* response, NSError* error) {
        if (error != nil) {
            [SENInitializer setSharedConfig: nil];
        }
        handler(response, error);
    };

    [service enrollDevice: config->deviceName
               credential: credential
                 clientId: clientId
             clientSecret: clientSecret
                  handler: rspHandler];
}

+ (NSError*)getNotInitializedError {
    NSString* description = @"SDK not initialized, call SENInitializer.initializeWithConfig to fix";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: description};
    return [NSError errorWithDomain:kErrorDomain code:GRPCErrorCodeFailedPrecondition userInfo:userInfo];
}

@end
