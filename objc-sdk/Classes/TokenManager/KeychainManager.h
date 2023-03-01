//
//  KeychainManager.h
//  Pods
//
//  Created by Niles Hacking on 2/21/23.
//

#ifndef KeychainManager_h
#define KeychainManager_h

#import "SecureCredentialStore.h"

/// Manager that uses Apple Keychain to securely store sensitive information
///
/// This should be used as the `SENSecureCredentialStore` when initializing `SENOAuthService`
@interface SENKeychainManager : NSObject <SENSecureCredentialStore>

/// Saves a string to Apple Keychain
///
/// - Parameters:
///   - tag: Keychain tag to save under
///   - value: The string value to save
///   - error: Error pointer, set if an error occurs
/// - Returns: Success boolean, true if no error occurred
- (bool)saveStringWithTag: (NSString*) tag
                    value: (NSString*)value
                 errorPtr: (out NSError **)error;

/// Saves NSData to Apple Keychain
///
/// - Parameters:
///   - tag: Keychain tag to save under
///   - data: The data to save
///   - error: Error pointer, set if an error occurs
/// - Returns: Success boolean, true if no error occurred
- (bool)saveDataWithTag: (NSString*)tag
                   data: (NSData*)data
               errorPtr: (out NSError**)error;

/// Fetches data from Apple Keychain and attempts to convert to a string using `NSUTF8StringEncoding`
///
/// - Parameters:
///   - tag: Keychain tag to load
///   - error: Error pointer, set if an error occurs
/// - Returns: The saved string
- (NSString*)getStringWithTag: (NSString*)tag
                     errorPtr: (out NSError**)error;

/// Fetches data from Apple Keychain
///
/// - Parameters:
///   - tag: Keychain tag to load
///   - error: Error pointer, set if an error occurs
/// - Returns: The saved data
- (NSData*)getDataWithTag: (NSString*)tag
                 errorPtr: (out NSError**)error;

/// Deletes an item from Apple Keychain
///
/// No error is generated if the specified tag could not be found in Apple Keychain
/// - Parameters:
///   - tag: Keychain tag to delete
///   - error: Error pointer, set if an error occurs
/// - Returns: Success boolean, true if no error occurred
- (bool)deleteEntryWithTag: (NSString*)tag
                  errorPtr: (out NSError**)error;

@end

#endif /* KeychainManager_h */
