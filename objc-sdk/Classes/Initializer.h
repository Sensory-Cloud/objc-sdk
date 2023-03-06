//
//  Initializer.h
//  objc-sdk
//
//  Created by Niles Hacking on 2/27/23.
//

#ifndef Initializer_h
#define Initializer_h

#import "JWTSigner.h"

@class SENOAuthService;
@class SENGDeviceResponse;

/// The authentication method required for device enrollment by the Sensory Cloud Server
typedef NS_ENUM(NSUInteger, SENEnrollmentType) {
    /// No authentication required to enroll new devices
    kNone,
    /// Devices are enrolled via shared secretes (i.e. passwords)
    kSharedSecret,
    /// Devices are enrolled via signed JWTs
    kJWT
};

/// All configurations required to initialize the Sensory Cloud SDK
struct SENInitConfig {
    /// The fully qualified domain name of the Sensory Cloud Server to communicate with
    NSString* fullyQualifiedDomainName;
    /// Tells the SDK if it should use a secure connection to the server
    bool isSecure;
    /// The tenant ID to use during device enrollment
    NSString* tenantId;
    /// The level of authentication required to enroll new devices into the Sensory Cloud Server
    ///  - Note: If the device has been enrolled during a previous app session, this field is ignored
    SENEnrollmentType enrollmentType;
    /// Credential to use for device enrollment
    ///
    /// Depending on the `enrollmentType` this may be blank, the shared secret, of the private key to create a JWT with
    /// - Note: If the device has been enrolled during a previous app session, this field is ignored
    NSString* credential;
    /// Unique identifier for the current device
    ///
    /// Even if your `config.ini` file includes this configuration, it is recommended to override this with a device generated ID so that no two devices share an ID
    NSString* deviceId;
    /// Name of the enrolling device
    ///
    /// Even if your `config.ini` file includes this configuration, it is recommended to override this with a different name so that no two devices share the same name
    NSString* deviceName;
};

/// Static initialization class. The Sensory Cloud SDK *must* be initialized every time the app is launched
@interface SENInitializer : NSObject

/// Configuration object that the SDK has been initialized with
///
/// This should not be directly set, and instead is set when `initializeWithConfig` is called
+ (struct SENInitConfig)sharedConfig;

/// Initializes the SDK from an initialization object
///
/// - Parameters:
///   - config: Configuration object to use to configure the Sensory Cloud SDK
///   - service: OAuth service to register the device with
///   - jwtSigner: Signer to be used for creating an enrollment JWT, may be `nil` if enrollment type is not `kJWT`
///   - handler: Handler that will be called once initialization has been completed. The response will be `nil` if the device has been previously enrolled
+ (void) initializeWithConfig: (struct SENInitConfig)config
                 oAuthService: (SENOAuthService*)service
                    jwtSigner: (id<SENJWTSigner>) jwtSigner
                      handler: (void (^)(SENGDeviceResponse*, NSError*))handler;

/// Returns an "SDK not initialized" error. This is meant for internal use only.
+ (NSError*)getNotInitializedError;

@end

#endif /* Initializer_h */
