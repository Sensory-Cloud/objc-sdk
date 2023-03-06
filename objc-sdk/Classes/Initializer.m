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

static struct SENInitConfig _sharedConfig;

+ (struct SENInitConfig)sharedConfig {
    return _sharedConfig;
}

+ (void)setSharedConfig:(struct SENInitConfig)newSharedConfig {
    _sharedConfig = newSharedConfig;
}

+ (void) initializeWithConfig: (struct SENInitConfig)config
                 oAuthService: (SENOAuthService*)service
                    jwtSigner: (id<SENJWTSigner>)jwtSigner
                      handler: (void (^)(SENGDeviceResponse*, NSError*))handler {
    [self setSharedConfig: config];

    struct SENInitConfig emptyConfig;
    emptyConfig.fullyQualifiedDomainName = @"";

    NSError* clientError, *secretError;
    id<SENSecureCredentialStore> credentialStore = [service credentialStore];
    [credentialStore getClientId:&clientError];
    [credentialStore getClientSecret:&secretError];
    if (clientError == nil && secretError == nil) {
        // SDK has been previously enrolled
        handler(nil, nil);
        return;
    }

    NSError* generationError;
    NSString* clientId = [service generateClientId];
    NSString* clientSecret = [service generateClientSecret: &generationError];
    if (generationError != nil) {
        [self setSharedConfig: emptyConfig];
        handler(nil, generationError);
        return;
    }

    NSString* credential = @"";
    switch(config.enrollmentType) {
    case kNone:
        break;
    case kSharedSecret:
        credential = config.credential;
        break;
    case kJWT:
        if (jwtSigner == nil) {
            NSString* description = @"JWT signer must not be nil for the jwt enrollment type";
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description};
            NSError* error = [NSError errorWithDomain:kErrorDomain code:GRPCErrorCodeUnimplemented userInfo:userInfo];
            [self setSharedConfig: emptyConfig];
            handler(nil, error);
            return;
        }

        NSError* signError;
        credential = [jwtSigner signJWTWithKey:credential
                                    deviceName:config.deviceName
                                      tenantId:config.tenantId
                                      clientId:clientId
                                      errorPtr:&signError];
        if (signError != nil) {
            handler(nil, signError);
            return;
        }
    }

    void (^rspHandler)(SENGDeviceResponse*, NSError*) = ^void (SENGDeviceResponse* response, NSError* error) {
        if (error != nil) {
            [self setSharedConfig: emptyConfig];
        } else {
            NSError* saveError;
            if (![credentialStore saveCredentials:clientId secret:clientSecret errorPtr:&saveError]) {
                [self setSharedConfig: emptyConfig];
                error = saveError;
            }
        }
        handler(response, error);
    };

    [service enrollDevice: config.deviceName
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
