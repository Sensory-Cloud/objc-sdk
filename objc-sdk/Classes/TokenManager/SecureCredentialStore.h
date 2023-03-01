//
//  SecureCredentialStore.h
//  objc-sdk
//
//  Created by Niles Hacking on 2/22/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Generic protocol for a secure credential store that the OAuth service may use to store sensitive info
///
/// `SENKeychainManager` implements this protocol using the Apple Keychain
@protocol SENSecureCredentialStore <NSObject>

/// Saves credentials to the credential store
///
/// - Parameters:
///   - clientId: Client ID to save
///   - secret: Client Secret to save
///   - error: error pointer, set if an error occurs while saving
- (bool)saveCredentials: (NSString*)clientId
                 secret: (NSString*)secret
               errorPtr: (out NSError **)error;

/// Fetches the saved client ID from secure storage
///
/// - Parameter error: Error pointer, set if an error occurs during loading (i.e. Client ID not found)
/// - Returns: The saved client ID
- (NSString*)getClientId: (out NSError **)error;

/// Fetches the saved client secret from secure storage
///
/// - Parameter error: Error pointer, set if an error occurs during loading (i.e. Client Secret not found)
/// - Returns: The saved client secret
- (NSString*)getClientSecret: (out NSError **)error;

@end

NS_ASSUME_NONNULL_END
