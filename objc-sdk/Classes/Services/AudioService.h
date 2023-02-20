//
//  AudioService.h
//  Pods
//
//  Created by Niles Hacking on 2/20/23.
//

#ifndef AudioService_h
#define AudioService_h

@class GRPCUnaryResponseHandler<ResponseType>;
@class GRPCStreamingProtoCall;
@class GRPCProtoResponseHandler;
@class SENGAAudioConfig;
@class SENGAGetModelsResponse;
@class SENGACreateEnrollmentConfig;
@class SENGAAuthenticateConfig;
@class SENGAValidateEventConfig;
@class SENGACreateEnrollmentEventConfig;
@class SENGAValidateEnrolledEventConfig;
@class SENGATranscribeConfig;
@class SENGAVoiceSynthesisConfig;

@interface SENAudioService : NSObject

@property SENGAAudioConfig *audioConfig;

- (id)init;

- (void)getModels: (GRPCUnaryResponseHandler<SENGAGetModelsResponse*>*)handler;

- (GRPCStreamingProtoCall*)createEnrollmentWithConfig: (SENGACreateEnrollmentConfig*) enrollmentConfig
                                              handler: (GRPCProtoResponseHandler*) handler;

- (GRPCStreamingProtoCall*)authenticateWithConfig: (SENGAAuthenticateConfig*) authConfig
                                          handler: (GRPCProtoResponseHandler*) handler;

- (GRPCStreamingProtoCall*)validateTriggerWithConfig: (SENGAValidateEventConfig*) config
                                             handler: (GRPCProtoResponseHandler*) handler;

- (GRPCStreamingProtoCall*)createEnrolledEventWithConfig: (SENGACreateEnrollmentEventConfig*) config
                                                 handler: (GRPCProtoResponseHandler*) handler;

- (GRPCStreamingProtoCall*)validateEnrolledEventWithConfig: (SENGAValidateEnrolledEventConfig*) config
                                                   handler: (GRPCProtoResponseHandler*) handler;

- (GRPCStreamingProtoCall*)transcribeAudioWithConfig: (SENGATranscribeConfig*) config
                                             handler: (GRPCProtoResponseHandler*) handler;

- (void)synthesizeSpeech: (NSString*) phrase
                  config: (SENGAVoiceSynthesisConfig*) config
                 handler: (GRPCProtoResponseHandler*) handler;

@end

#endif /* AudioService_h */
