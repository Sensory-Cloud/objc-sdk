//
//  VideoService.m
//  objc-sdk
//
//  Created by Niles Hacking on 2/20/23.
//

#import <Foundation/Foundation.h>
#import "VideoService.h"
#import "GRPCClient/GRPCTransport.h"
#import "Video.pbrpc.h"

// TODO: rm
static NSString * const kHostAddress = @"localhost:50050";

@implementation SENVideoService

- (void)getModels: (GRPCUnaryResponseHandler<SENGVGetModelsResponse*>*)handler {
    SENGVVideoModels *service = [self getVideoModelsService];

    SENGVGetModelsRequest *request = [SENGVGetModelsRequest message];

    [[service getModelsWithMessage:request responseHandler:handler callOptions:nil] start];
}

- (GRPCStreamingProtoCall*)createEnrollmentWithConfig: (SENGVCreateEnrollmentConfig*) enrollmentConfig
                                              handler: (id<GRPCProtoResponseHandler>) handler
{
    SENGVVideoBiometrics *service = [self getVideoBiometricsService];
    GRPCStreamingProtoCall *call = [service createEnrollmentWithResponseHandler:handler callOptions:nil];
    [call start];

    // TODO: override the device ID set in the passed in config
    SENGVCreateEnrollmentRequest *request = [SENGVCreateEnrollmentRequest message];
    request.config = enrollmentConfig;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)authenticateWithConfig: (SENGVAuthenticateConfig*) authConfig
                                          handler: (id<GRPCProtoResponseHandler>) handler
{
    SENGVVideoBiometrics *service = [self getVideoBiometricsService];
    GRPCStreamingProtoCall *call = [service authenticateWithResponseHandler:handler callOptions:nil];
    [call start];

    SENGVAuthenticateRequest *request = [SENGVAuthenticateRequest message];
    request.config = authConfig;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)validateLivenessWithConfig: (SENGVValidateRecognitionConfig*) config
                                              handler: (id<GRPCProtoResponseHandler>) handler
{
    SENGVVideoRecognition *service = [self getVideoRecognitionService];
    GRPCStreamingProtoCall *call = [service validateLivenessWithResponseHandler:handler callOptions:nil];
    [call start];

    SENGVValidateRecognitionRequest *request = [SENGVValidateRecognitionRequest message];
    request.config = config;
    [call writeMessage:request];

    return call;
}

- (SENGVVideoModels*)getVideoModelsService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGVVideoModels *service = [[SENGVVideoModels alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}

- (SENGVVideoBiometrics*)getVideoBiometricsService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGVVideoBiometrics *service = [[SENGVVideoBiometrics alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}

- (SENGVVideoRecognition*)getVideoRecognitionService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGVVideoRecognition *service = [[SENGVVideoRecognition alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}

@end
