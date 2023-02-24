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
#import "TokenManager.h"

// TODO: rm
static NSString * const kHostAddress = @"localhost:50050";

@interface SENVideoService ()
@property SENTokenManager* tokenManager;
@end

@implementation SENVideoService

- (id)init: (SENTokenManager*)tokenManager {
    if (self = [super init]) {
        self.tokenManager = tokenManager;
    }
    return self;
}

- (void)getModels: (void (^)(SENGVGetModelsResponse*, NSError*))handler {
    NSError* error;
    SENGVVideoModels* service = [self getVideoModelsService];
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (headers == nil) {
        handler(nil, error);
        return;
    }

    SENGVGetModelsRequest* request = [SENGVGetModelsRequest message];

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:nil];
    [[service getModelsWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (GRPCStreamingProtoCall*)createEnrollmentWithConfig: (SENGVCreateEnrollmentConfig*) enrollmentConfig
                                              handler: (id<GRPCProtoResponseHandler>) handler
{
    NSError* error;
    SENGVVideoBiometrics* service = [self getVideoBiometricsService];
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (headers == nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCStreamingProtoCall* call = [service createEnrollmentWithResponseHandler:handler callOptions:headers];
    [call start];

    // TODO: override the device ID set in the passed in config
    SENGVCreateEnrollmentRequest* request = [SENGVCreateEnrollmentRequest message];
    request.config = enrollmentConfig;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)authenticateWithConfig: (SENGVAuthenticateConfig*) authConfig
                                          handler: (id<GRPCProtoResponseHandler>) handler
{
    NSError* error;
    SENGVVideoBiometrics *service = [self getVideoBiometricsService];
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (headers == nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCStreamingProtoCall* call = [service authenticateWithResponseHandler:handler callOptions:headers];
    [call start];

    SENGVAuthenticateRequest* request = [SENGVAuthenticateRequest message];
    request.config = authConfig;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)validateLivenessWithConfig: (SENGVValidateRecognitionConfig*) config
                                              handler: (id<GRPCProtoResponseHandler>) handler
{
    NSError* error;
    SENGVVideoRecognition* service = [self getVideoRecognitionService];
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (headers == nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCStreamingProtoCall* call = [service validateLivenessWithResponseHandler:handler callOptions:headers];
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
