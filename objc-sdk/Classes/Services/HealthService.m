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

static NSString * const kHostAddress = @"localhost:50050";

@implementation SENHealthService

- (void)getHealth: (GRPCUnaryResponseHandler<SENGServerHealthResponse*>*)handler {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGHealthService *service = [[SENGHealthService alloc] initWithHost:kHostAddress callOptions:options];

    SENGHealthRequest *request = [SENGHealthRequest message];

    [[service getHealthWithMessage:request responseHandler:handler callOptions:nil] start];
}

@end
