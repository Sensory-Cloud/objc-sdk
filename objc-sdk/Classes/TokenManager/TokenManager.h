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

/// TokenManager manages requesting and securely storing OAuth credentials for Sensory Cloud
@interface SENTokenManager : NSObject

/// OAuth service used to request new OAuth tokens
@property (readonly) SENOAuthService* service;

/// Initializes a new instance of `SENTokenManager`
///
/// - Parameter oauthService: The OAuth service to use when requesting new OAuth tokens
-(id)init: (SENOAuthService*)oauthService;

/// Returns a valid OAuth access Token
///
/// This call will block on the current thread if a new token needs to be requested from the server
/// - Parameter error: Error pointer, set if an error occurs
/// - Returns: A valid OAuth token
-(NSString*)getAccessToken: (out NSError**)error;

/// Returns the authorization headers to use when making a GRPC call to Sensory Cloud
///
/// This call will block on the current thread if a new token needs to be requested from the server
/// - Parameter error: Error pointer, set if an error occurs
/// - Returns: Valid OAuth authorization headers
-(GRPCMutableCallOptions*)getAuthorizationMetadata: (out NSError**)error;

/// Deletes the currently cached OAuth token
-(void)deleteCachedToken;

@end

#endif /* TokenManager_h */
