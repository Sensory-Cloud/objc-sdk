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

// TODO: rm
static NSString * const kHostAddress = @"localhost:50050";

@implementation SENHealthService

- (void)getHealth: (GRPCUnaryResponseHandler<SENGServerHealthResponse*>*)handler {
    SENGHealthService *service = [self getHealthService];

    SENGHealthRequest *request = [SENGHealthRequest message];

    [[service getHealthWithMessage:request responseHandler:handler callOptions:nil] start];
}

- (SENGHealthService*)getHealthService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGHealthService *service = [[SENGHealthService alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}

@end
