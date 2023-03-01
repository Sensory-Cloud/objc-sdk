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

/// A collection of GRPC calls for enrolling and requesting OAuth tokens
@interface SENOAuthService : NSObject

/// Credential store where the OAuth credentials are stored
@property (readonly, weak) id<SENSecureCredentialStore> credentialStore;

/// Initializes a new instance of `SENSecureCredentialStore`
///
/// - Parameter credentialStore: The credential store to use when storing credentials. `SENKeychainManager` should be used in most cases
-(id)init: (id<SENSecureCredentialStore>)credentialStore;

/// Generates a new client ID that may be used for enrolling the device
- (NSString*) generateClientId;

/// Generates a cryptographically secure client secret that may be used for enrolling the device
///
/// - Parameter error: error pointer, set if an error occurs
- (NSString*) generateClientSecret: (out NSError**)error;

/// Creates a device enrollment for the current device
///
/// This should not be directly called, instead device enrollment occurs when making a call to `SENInitializer`
/// - Parameters:
///   - name: Name of the enrolling device
///   - credential: Credential string to authenticate that this device is allowed to enroll
///   - clientId: ClientID to use for OAuth token generation
///   - clientSecret: Client secret to use for OAuth token generation
///   - handler: Handler callback that will be called with the server's response
- (void)enrollDevice: (NSString*)name
          credential: (NSString*)credential
            clientId: (NSString*)clientId
        clientSecret: (NSString*)clientSecret
             handler: (void (^)(SENGDeviceResponse*, NSError*))handler;

/// Requests a new OAuth token from the server
///
/// - Parameter handler: Handler callback that will be called with the server's response
- (void)getToken: (void (^)(SENGTokenResponse*, NSError*))handler;

/// Renews the credentials stored in the attached `SENSecureCredentialStore`. This should be called once the device key has expired
///
/// - Parameters:
///   - credential: The credential configured on the Sensory Cloud Server
///   - handler: Handler callback that will be called with the server's response
- (void)renewDeviceCredential: (NSString*)credential
                      handler: (void (^)(SENGDeviceResponse*, NSError*))handler;

/// Gets information about the current registered device inferred from the credentials supplied by the secure credential store
///
/// A new token is requested every time this is called, so use sparingly
/// - Parameter handler: Handler callback that will be called with the server's response
- (void)getWhoAmI: (void (^)(SENGDeviceResponse*, NSError*))handler;

@end

#endif /* OAuthService_h */
