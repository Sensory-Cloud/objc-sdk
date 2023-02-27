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
#import "Initializer.h"

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
    SENGVVideoModels* service = [self getVideoModelsService: &error];
    if (service == nil) {
        handler(nil, error);
        return;
    }
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
    SENGVVideoBiometrics* service = [self getVideoBiometricsService: &error];
    if (service == nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (headers == nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    if (enrollmentConfig.deviceId == nil) {
        struct SENInitConfig* config = SENInitializer.sharedConfig;
        if (config == nil) {
            if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
                [handler didCloseWithTrailingMetadata:nil error:error];
            }
            return nil;
        }
        enrollmentConfig.deviceId = config->deviceId;
    }
    GRPCStreamingProtoCall* call = [service createEnrollmentWithResponseHandler:handler callOptions:headers];
    [call start];

    SENGVCreateEnrollmentRequest* request = [SENGVCreateEnrollmentRequest message];
    request.config = enrollmentConfig;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)authenticateWithConfig: (SENGVAuthenticateConfig*) authConfig
                                          handler: (id<GRPCProtoResponseHandler>) handler
{
    NSError* error;
    SENGVVideoBiometrics *service = [self getVideoBiometricsService: &error];
    if (service == nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
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
    SENGVVideoRecognition* service = [self getVideoRecognitionService: &error];
    if (service == nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
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

- (SENGVVideoModels*)getVideoModelsService: (out NSError**)error {
    struct SENInitConfig* config = SENInitializer.sharedConfig;
    if (config == nil) {
        if (error != nil) {
            *error = [SENInitializer getNotInitializedError];
        }
        return nil;
    }

    GRPCMutableCallOptions* options = [[GRPCMutableCallOptions alloc] init];
    if (config->isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    }

    SENGVVideoModels* service = [[SENGVVideoModels alloc] initWithHost:config->fullyQualifiedDomainName callOptions:options];
    return service;
}

- (SENGVVideoBiometrics*)getVideoBiometricsService: (out NSError**)error {
    struct SENInitConfig* config = SENInitializer.sharedConfig;
    if (config == nil) {
        if (error != nil) {
            *error = [SENInitializer getNotInitializedError];
        }
        return nil;
    }

    GRPCMutableCallOptions* options = [[GRPCMutableCallOptions alloc] init];
    if (config->isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    }

    SENGVVideoBiometrics* service = [[SENGVVideoBiometrics alloc] initWithHost:config->fullyQualifiedDomainName callOptions:options];
    return service;
}

- (SENGVVideoRecognition*)getVideoRecognitionService: (out NSError**)error {
    struct SENInitConfig* config = SENInitializer.sharedConfig;
    if (config == nil) {
        if (error != nil) {
            *error = [SENInitializer getNotInitializedError];
        }
        return nil;
    }

    GRPCMutableCallOptions* options = [[GRPCMutableCallOptions alloc] init];
    if (config->isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    }

    SENGVVideoRecognition* service = [[SENGVVideoRecognition alloc] initWithHost:config->fullyQualifiedDomainName callOptions:options];
    return service;
}

@end
