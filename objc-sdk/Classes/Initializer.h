//
//  Initializer.h
//  objc-sdk
//
//  Created by Niles Hacking on 2/27/23.
//

#ifndef Initializer_h
#define Initializer_h

@class SENOAuthService;
@class SENGDeviceResponse;

typedef NS_ENUM(NSUInteger, SENEnrollmentType) {
    kNone,
    kSharedSecret,
    kJWT
};

struct SENInitConfig {
    NSString* fullyQualifiedDomainName;
    bool isSecure;
    NSString* tenantId;
    SENEnrollmentType enrollmentType;
    NSString* credential;
    NSString* deviceId;
    NSString* deviceName;
};

@interface SENInitializer : NSObject

+ (struct SENInitConfig*)sharedConfig;

+ (void) initializeWithConfig: (struct SENInitConfig*)config
                 oAuthService: (SENOAuthService*)service
                      handler: (void (^)(SENGDeviceResponse*, NSError*))handler;

+ (NSError*)getNotInitializedError;

@end

#endif /* Initializer_h */
