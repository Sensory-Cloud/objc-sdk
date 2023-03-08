//
//  HealthService.m
//  objc-sdk
//
//  Created by Niles Hacking on 2/16/23.
//

#import <Foundation/Foundation.h>
#import "HealthService.h"
#import "GRPCClient/GRPCTransport.h"
#import "Health.pbrpc.h"
#import "Initializer.h"

@implementation SENHealthService

- (void)getHealth: (void (^)(SENGServerHealthResponse*, NSError*))handler {
    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        handler(nil, [SENInitializer getNotInitializedError]);
        return;
    }

    [self getHealthForFQDN:config.fullyQualifiedDomainName isSecure:config.isSecure handler:handler];
}

- (void)getHealthForFQDN: (NSString*)fqdn
                isSecure: (bool)isSecure
                 handler: (void (^)(SENGServerHealthResponse*, NSError*))handler
{
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    if (isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    }
    SENGHealthService *service = [[SENGHealthService alloc] initWithHost:fqdn callOptions:options];

    SENGHealthRequest *request = [SENGHealthRequest message];

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:nil];
    [[service getHealthWithMessage:request responseHandler:rspHandler callOptions:nil] start];
}

@end
