//
//  HealthService.h
//  objc-sdk
//
//  Created by Niles Hacking on 2/16/23.
//

#ifndef HealthService_h
#define HealthService_h

@class SENGServerHealthResponse;

/// A collection of GRPC calls for getting the health of the cloud host
@interface SENHealthService : NSObject

/// Fetches the current health status of the cloud host
///
/// This uses the cloud host configured when `SENInitializer` was called
/// - Parameter handler: Handler callback that will be called with the server's response
- (void)getHealth: (void (^)(SENGServerHealthResponse*, NSError*))handler;

/// Fetches the current health status of an arbitrary cloud host
///
/// - Parameters:
///   - fqdn: Fully qualified domain name for the cloud host to request health for
///   - isSecure: Tells if a secure connection should be made when requesting server health
///   - handler: Handler callback that will be called with the server's response
- (void)getHealthForFQDN: (NSString*)fqdn
                isSecure: (bool)isSecure
                 handler: (void (^)(SENGServerHealthResponse*, NSError*))handler;

@end

#endif /* SENHealthService_h */
