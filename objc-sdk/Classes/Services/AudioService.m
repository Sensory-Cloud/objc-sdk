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

// TODO: rm
static NSString * const kHostAddress = @"localhost:50050";

@implementation SENAudioService

@synthesize audioConfig;

-(id)init {
    if (self = [super init]) {
        SENGAAudioConfig *config = [SENGAAudioConfig message];
        config.encoding = SENGAAudioConfig_AudioEncoding_Linear16;
        config.sampleRateHertz = 16000;
        config.audioChannelCount = 1;
        config.languageCode = [[NSLocale preferredLanguages] objectAtIndex:0];
        self.audioConfig = config;
    }
    return self;
}

- (void)getModels: (GRPCUnaryResponseHandler<SENGAGetModelsResponse*>*)handler {
    SENGAAudioModels *service = [self getAudioModelsService];

    SENGAGetModelsRequest *request = [SENGAGetModelsRequest message];

    [[service getModelsWithMessage:request responseHandler:handler callOptions:nil] start];
}

- (GRPCStreamingProtoCall*)createEnrollmentWithConfig: (SENGACreateEnrollmentConfig*) enrollmentConfig
                                              handler: (id<GRPCProtoResponseHandler>) handler
{
    SENGAAudioBiometrics *service = [self getAudioBiometricsService];
    GRPCStreamingProtoCall *call = [service createEnrollmentWithResponseHandler:handler callOptions:nil];
    [call start];

    // TODO: override the device ID set in the passed in config
    if (!enrollmentConfig.hasAudio) {
        enrollmentConfig.audio = self.audioConfig;
    }

    SENGACreateEnrollmentRequest *request = [SENGACreateEnrollmentRequest message];
    request.config = enrollmentConfig;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)authenticateWithConfig: (SENGAAuthenticateConfig*) authConfig
                                           handler: (id<GRPCProtoResponseHandler>) handler
{
    SENGAAudioBiometrics *service = [self getAudioBiometricsService];
    GRPCStreamingProtoCall *call = [service authenticateWithResponseHandler:handler callOptions:nil];
    [call start];

    if (!authConfig.hasAudio) {
        authConfig.audio = self.audioConfig;
    }

    SENGAAuthenticateRequest *request = [SENGAAuthenticateRequest message];
    request.config = authConfig;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)validateTriggerWithConfig: (SENGAValidateEventConfig*) config
                                             handler: (id<GRPCProtoResponseHandler>) handler
{
    SENGAAudioEvents *service = [self getAudioEventsService];
    GRPCStreamingProtoCall *call = [service validateEventWithResponseHandler:handler callOptions:nil];
    [call start];

    if (!config.hasAudio) {
        config.audio = self.audioConfig;
    }

    SENGAValidateEventRequest *request = [SENGAValidateEventRequest message];
    request.config = config;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)createEnrolledEventWithConfig: (SENGACreateEnrollmentEventConfig*) config
                                                 handler: (id<GRPCProtoResponseHandler>) handler
{
    SENGAAudioEvents *service = [self getAudioEventsService];
    GRPCStreamingProtoCall *call = [service createEnrolledEventWithResponseHandler:handler callOptions:nil];
    [call start];

    if (!config.hasAudio) {
        config.audio = self.audioConfig;
    }

    SENGACreateEnrolledEventRequest *request = [SENGACreateEnrolledEventRequest message];
    request.config = config;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)validateEnrolledEventWithConfig: (SENGAValidateEnrolledEventConfig*) config
                                                   handler: (id<GRPCProtoResponseHandler>) handler
{
    SENGAAudioEvents *service = [self getAudioEventsService];
    GRPCStreamingProtoCall *call = [service validateEventWithResponseHandler:handler callOptions:nil];
    [call start];

    if (!config.hasAudio) {
        config.audio = self.audioConfig;
    }

    SENGAValidateEnrolledEventRequest *request = [SENGAValidateEnrolledEventRequest message];
    request.config = config;
    [call writeMessage:request];

    return call;
}

- (GRPCStreamingProtoCall*)transcribeAudioWithConfig: (SENGATranscribeConfig*) config
                                             handler: (id<GRPCProtoResponseHandler>) handler
{
    SENGAAudioTranscriptions *service = [self getAudioTranscriptionsService];
    GRPCStreamingProtoCall *call = [service transcribeWithResponseHandler:handler callOptions:nil];
    [call start];

    if (!config.hasAudio) {
        config.audio = self.audioConfig;
    }

    SENGATranscribeRequest *request = [SENGATranscribeRequest message];
    request.config = config;
    [call writeMessage:request];

    return call;
}

- (void)synthesizeSpeech: (NSString*) phrase
                  config: (SENGAVoiceSynthesisConfig*) config
                 handler: (id<GRPCProtoResponseHandler>) handler
{
    SENGAAudioSynthesis *service = [self getAudioSynthesisService];

    SENGASynthesizeSpeechRequest *request = [SENGASynthesizeSpeechRequest message];
    request.phrase = phrase;
    request.config = config;

    [[service synthesizeSpeechWithMessage:request responseHandler:handler callOptions:nil] start];
}

- (SENGAAudioModels*)getAudioModelsService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGAAudioModels *service = [[SENGAAudioModels alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}

- (SENGAAudioBiometrics*)getAudioBiometricsService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGAAudioBiometrics *service = [[SENGAAudioBiometrics alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}

- (SENGAAudioEvents*)getAudioEventsService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGAAudioEvents *service = [[SENGAAudioEvents alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}

- (SENGAAudioTranscriptions*)getAudioTranscriptionsService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGAAudioTranscriptions *service = [[SENGAAudioTranscriptions alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}

- (SENGAAudioSynthesis*)getAudioSynthesisService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGAAudioSynthesis *service = [[SENGAAudioSynthesis alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}
@end
