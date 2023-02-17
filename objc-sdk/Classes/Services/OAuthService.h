//
//  OAuthService.h
//  Pods
//
//  Created by Niles Hacking on 2/17/23.
//

#ifndef OAuthService_h
#define OAuthService_h

@class GRPCUnaryResponseHandler<ResponseType>;
@class SENGDeviceResponse;
@class SENGTokenResponse;

@interface SENOAuthService : NSObject

- (void)enrollDevice: (NSString*)name
          credential: (NSString*)credential
            clientId: (NSString*)clientId
        clientSecret: (NSString*)clientSecret
             handler: (GRPCUnaryResponseHandler<SENGDeviceResponse*>*)handler;

- (void)getToken: (NSString*)clientId
          secret: (NSString*)secret
         handler: (GRPCUnaryResponseHandler<SENGTokenResponse*>*)handler;

- (void)renewDeviceCredential: (NSString*)clientId
                   credential: (NSString*)credential
                      handler: (GRPCUnaryResponseHandler<SENGDeviceResponse*>*)handler;

@end

#endif /* OAuthService_h */
