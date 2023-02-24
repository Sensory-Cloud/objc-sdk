//
//  VideoService.h
//  Pods
//
//  Created by Niles Hacking on 2/20/23.
//

#ifndef VideoService_h
#define VideoService_h

@class SENTokenManager;
@class GRPCStreamingProtoCall;
@class GRPCProtoResponseHandler;
@class SENGVGetModelsResponse;
@class SENGVCreateEnrollmentConfig;
@class SENGVAuthenticateConfig;
@class SENGVValidateRecognitionConfig;

@interface SENVideoService : NSObject

- (id)init: (SENTokenManager*)tokenManager;

- (void)getModels: (void (^)(SENGVGetModelsResponse*, NSError*))handler;

- (GRPCStreamingProtoCall*)createEnrollmentWithConfig: (SENGVCreateEnrollmentConfig*) enrollmentConfig
                                              handler: (GRPCProtoResponseHandler*) handler;

- (GRPCStreamingProtoCall*)authenticateWithConfig: (SENGVAuthenticateConfig*) authConfig
                                          handler: (GRPCProtoResponseHandler*) handler;

- (GRPCStreamingProtoCall*)validateLivenessWithConfig: (SENGVValidateRecognitionConfig*) config
                                              handler: (GRPCProtoResponseHandler*) handler;

@end

#endif /* VideoService_h */
