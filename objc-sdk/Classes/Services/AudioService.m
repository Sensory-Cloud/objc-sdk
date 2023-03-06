//
//  AudioService.m
//  objc-sdk
//
//  Created by Niles Hacking on 2/20/23.
//

#import <Foundation/Foundation.h>
#import "AudioService.h"
#import "GRPCClient/GRPCTransport.h"
#import "Audio.pbrpc.h"
#import "TokenManager.h"
#import "Initializer.h"

@interface SENAudioService ()
@property SENTokenManager* tokenManager;
@property dispatch_queue_t responseQueue;
@end

@implementation SENAudioService

@synthesize audioConfig;

-(id)init: (SENTokenManager*)tokenManager {
    if (self = [super init]) {
        SENGAAudioConfig *config = [SENGAAudioConfig message];
        config.encoding = SENGAAudioConfig_AudioEncoding_Linear16;
        config.sampleRateHertz = 16000;
        config.audioChannelCount = 1;
        config.languageCode = [[NSLocale preferredLanguages] objectAtIndex:0];
        self.audioConfig = config;
        self.tokenManager = tokenManager;
        dispatch_queue_attr_t qos = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_USER_INITIATED, -1);
        self.responseQueue = dispatch_queue_create("audioServiceQueue", qos);
    }
    return self;
}

- (void)getModels: (void (^)(SENGAGetModelsResponse*, NSError*))handler {
    NSError* error;
    SENGAAudioModels* service = [self getAudioModelsService: &error];
    if (error != nil) {
        handler(nil, error);
        return;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        handler(nil, error);
        return;
    }

    SENGAGetModelsRequest* request = [SENGAGetModelsRequest message];

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:self.responseQueue];
    [[service getModelsWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (GRPCStreamingProtoCall*)createEnrollmentWithConfig: (SENGACreateEnrollmentConfig*) enrollmentConfig
                                              handler: (id<GRPCProtoResponseHandler>) handler
{
    NSError* error;
    SENGAAudioBiometrics* service = [self getAudioBiometricsService: &error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    if (enrollmentConfig.deviceId == nil || [enrollmentConfig.deviceId isEqual:@""]) {
        struct SENInitConfig config = SENInitializer.sharedConfig;
        if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
            if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
                [handler didCloseWithTrailingMetadata:nil error:error];
            }
            return nil;
        }
        enrollmentConfig.deviceId = config.deviceId;
    }
    GRPCStreamingProtoCall* call = [service createEnrollmentWithResponseHandler:handler callOptions:headers];
    [call start];

    if (!enrollmentConfig.hasAudio) {
        enrollmentConfig.audio = self.audioConfig;
    }

    SENGACreateEnrollmentRequest* request = [SENGACreateEnrollmentRequest message];
    request.config = enrollmentConfig;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)authenticateWithConfig: (SENGAAuthenticateConfig*) authConfig
                                           handler: (id<GRPCProtoResponseHandler>) handler
{
    NSError* error;
    SENGAAudioBiometrics* service = [self getAudioBiometricsService: &error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCStreamingProtoCall* call = [service authenticateWithResponseHandler:handler callOptions:headers];
    [call start];

    if (!authConfig.hasAudio) {
        authConfig.audio = self.audioConfig;
    }

    SENGAAuthenticateRequest* request = [SENGAAuthenticateRequest message];
    request.config = authConfig;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*) validateTriggerWithConfig: (SENGAValidateEventConfig*) config
                                             handler: (id<GRPCProtoResponseHandler>) handler
{
    NSError* error;
    SENGAAudioEvents* service = [self getAudioEventsService: &error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCStreamingProtoCall* call = [service validateEventWithResponseHandler:handler callOptions:headers];
    [call start];

    if (!config.hasAudio) {
        config.audio = self.audioConfig;
    }

    SENGAValidateEventRequest* request = [SENGAValidateEventRequest message];
    request.config = config;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)createEnrolledEventWithConfig: (SENGACreateEnrollmentEventConfig*) config
                                                 handler: (id<GRPCProtoResponseHandler>) handler
{
    NSError* error;
    SENGAAudioEvents* service = [self getAudioEventsService: &error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCStreamingProtoCall* call = [service createEnrolledEventWithResponseHandler:handler callOptions:headers];
    [call start];

    if (!config.hasAudio) {
        config.audio = self.audioConfig;
    }

    SENGACreateEnrolledEventRequest* request = [SENGACreateEnrolledEventRequest message];
    request.config = config;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)validateEnrolledEventWithConfig: (SENGAValidateEnrolledEventConfig*) config
                                                   handler: (id<GRPCProtoResponseHandler>) handler
{
    NSError* error;
    SENGAAudioEvents* service = [self getAudioEventsService: &error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCStreamingProtoCall* call = [service validateEventWithResponseHandler:handler callOptions:headers];
    [call start];

    if (!config.hasAudio) {
        config.audio = self.audioConfig;
    }

    SENGAValidateEnrolledEventRequest* request = [SENGAValidateEnrolledEventRequest message];
    request.config = config;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)transcribeAudioWithConfig: (SENGATranscribeConfig*) config
                                             handler: (id<GRPCProtoResponseHandler>) handler
{
    NSError* error;
    SENGAAudioTranscriptions* service = [self getAudioTranscriptionsService: &error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return nil;
    }
    GRPCStreamingProtoCall* call = [service transcribeWithResponseHandler:handler callOptions:headers];
    [call start];

    if (!config.hasAudio) {
        config.audio = self.audioConfig;
    }

    SENGATranscribeRequest* request = [SENGATranscribeRequest message];
    request.config = config;
    [call writeMessage:request];

    return call;
}

- (void)synthesizeSpeech: (NSString*) phrase
                  config: (SENGAVoiceSynthesisConfig*) config
                 handler: (id<GRPCProtoResponseHandler>) handler
{
    NSError* error;
    SENGAAudioSynthesis *service = [self getAudioSynthesisService: &error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        if ([handler respondsToSelector:@selector(didCloseWithTrailingMetadata:error:)]) {
            [handler didCloseWithTrailingMetadata:nil error:error];
        }
        return;
    }

    SENGASynthesizeSpeechRequest* request = [SENGASynthesizeSpeechRequest message];
    request.phrase = phrase;
    request.config = config;

    [[service synthesizeSpeechWithMessage:request responseHandler:handler callOptions:headers] start];
}

- (SENGAAudioModels*)getAudioModelsService: (out NSError**)error {
    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        if (error != nil) {
            *error = [SENInitializer getNotInitializedError];
        }
        return nil;
    }

    GRPCMutableCallOptions* options = [[GRPCMutableCallOptions alloc] init];
    if (config.isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    }

    SENGAAudioModels* service = [[SENGAAudioModels alloc] initWithHost:config.fullyQualifiedDomainName callOptions:options];
    return service;
}

- (SENGAAudioBiometrics*)getAudioBiometricsService: (out NSError**)error {
    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        if (error != nil) {
            *error = [SENInitializer getNotInitializedError];
        }
        return nil;
    }

    GRPCMutableCallOptions* options = [[GRPCMutableCallOptions alloc] init];
    if (config.isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    }

    SENGAAudioBiometrics* service = [[SENGAAudioBiometrics alloc] initWithHost:config.fullyQualifiedDomainName callOptions:options];
    return service;
}

- (SENGAAudioEvents*)getAudioEventsService: (out NSError**)error {
    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        if (error != nil) {
            *error = [SENInitializer getNotInitializedError];
        }
        return nil;
    }

    GRPCMutableCallOptions* options = [[GRPCMutableCallOptions alloc] init];
    if (config.isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    }

    SENGAAudioEvents* service = [[SENGAAudioEvents alloc] initWithHost:config.fullyQualifiedDomainName callOptions:options];
    return service;
}

- (SENGAAudioTranscriptions*)getAudioTranscriptionsService: (out NSError**)error {
    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        if (error != nil) {
            *error = [SENInitializer getNotInitializedError];
        }
        return nil;
    }

    GRPCMutableCallOptions* options = [[GRPCMutableCallOptions alloc] init];
    if (config.isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    }

    SENGAAudioTranscriptions* service = [[SENGAAudioTranscriptions alloc] initWithHost:config.fullyQualifiedDomainName callOptions:options];
    return service;
}

- (SENGAAudioSynthesis*)getAudioSynthesisService: (out NSError**)error {
    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        if (error != nil) {
            *error = [SENInitializer getNotInitializedError];
        }
        return nil;
    }

    GRPCMutableCallOptions* options = [[GRPCMutableCallOptions alloc] init];
    if (config.isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    }

    SENGAAudioSynthesis* service = [[SENGAAudioSynthesis alloc] initWithHost:config.fullyQualifiedDomainName callOptions:options];
    return service;
}
@end
