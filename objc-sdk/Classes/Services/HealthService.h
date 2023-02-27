//
//  HealthService.h
//  objc-sdk
//
//  Created by Niles Hacking on 2/16/23.
//

#ifndef HealthService_h
#define HealthService_h

@class SENGServerHealthResponse;

@interface SENHealthService : NSObject

- (void)getHealth: (void (^)(SENGServerHealthResponse*, NSError*))handler;

- (void)getHealthForFQDN: (NSString*)fqdn
                isSecure: (bool)isSecure
                 handler: (void (^)(SENGServerHealthResponse*, NSError*))handler;

@end

#endif /* SENHealthService_h */
