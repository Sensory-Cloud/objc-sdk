//
//  OAuthService.h
//  Pods
//
//  Created by Niles Hacking on 2/17/23.
//

#ifndef OAuthService_h
#define OAuthService_h

#import "SecureCredentialStore.h"

@class GRPCUnaryResponseHandler<ResponseType>;
@class SENKeychainManager;
@class SENGDeviceResponse;
@class SENGTokenResponse;

@interface SENOAuthService : NSObject

@property (readonly, weak) id<SENSecureCredentialStore> credentialStore;

-(id)init: (id<SENSecureCredentialStore>)credentialStore;

- (NSString*) generateClientId;

- (NSString*) generateClientSecret: (out NSError**)error;

- (void)enrollDevice: (NSString*)name
          credential: (NSString*)credential
            clientId: (NSString*)clientId
        clientSecret: (NSString*)clientSecret
             handler: (void (^)(SENGDeviceResponse*, NSError*))handler;

- (void)getToken: (void (^)(SENGTokenResponse*, NSError*))handler;

- (void)renewDeviceCredential: (NSString*)clientId
                   credential: (NSString*)credential
                      handler: (void (^)(SENGDeviceResponse*, NSError*))handler;

- (void)getWhoAmI: (void (^)(SENGDeviceResponse*, NSError*))handler;

@end

#endif /* OAuthService_h */
