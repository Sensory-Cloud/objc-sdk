//
//  JWTSigner.h
//  objc-sdk
//
//  Created by Niles Hacking on 2/28/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Protocol to create a signed JWT for device enrollment
@protocol SENJWTSigner <NSObject>

/// Creates a signed JWT used for device enrollment
/// This is only called if the enrollment type is `kJWT`
///
/// - Parameters:
///   - key: Private signing key. This will be a hex string of the raw private key
///   - deviceName: Device name to use in the JWT
///   - tenantId: Tenant ID to use in the JWT
///   - clientId: Client ID to use in the JWT
///   - error: Error pointer, set if an error occurs during JWT creation
/// - Returns: The final signed JWT that may be used for device enrollment
- (NSString*)signJWTWithKey: (NSString*)key
                 deviceName: (NSString*)deviceName
                   tenantId: (NSString*)tenantId
                   clientId: (NSString*)clientId
                   errorPtr: (out NSError **)error;

@end

NS_ASSUME_NONNULL_END
