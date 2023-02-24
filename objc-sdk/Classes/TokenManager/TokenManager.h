//
//  TokenManager.h
//  objc-sdk
//
//  Created by Niles Hacking on 2/22/23.
//

#ifndef TokenManager_h
#define TokenManager_h

@class SENOAuthService;
@class GRPCMutableCallOptions;

@interface SENTokenManager : NSObject

@property (readonly) SENOAuthService* service;

-(id)init: (SENOAuthService*)oauthService;

-(NSString*)getAccessToken: (out NSError**)error;

-(GRPCMutableCallOptions*)getAuthorizationMetadata: (out NSError**)error;

-(void)deleteCachedToken;

@end

#endif /* TokenManager_h */
