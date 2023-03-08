//
//  VideoService.h
//  Pods
//
//  Created by Niles Hacking on 2/20/23.
//

#ifndef VideoService_h
#define VideoService_h

#import <ProtoRPC/ProtoRPC.h>

@class SENTokenManager;
@class GRPCStreamingProtoCall;
@class GRPCProtoResponseHandler;
@class SENGVGetModelsResponse;
@class SENGVCreateEnrollmentConfig;
@class SENGVAuthenticateConfig;
@class SENGVValidateRecognitionConfig;

/// A collection of GRPC service calls for using vision models through Sensory Cloud
@interface SENVideoService : NSObject

/// Initializes a new instance of `SENVideoService`
///
/// - Parameter tokenManager: Token manager instance to get OAuth credentials from
- (id)init: (SENTokenManager*)tokenManager;

/// Fetches a list of the current vision models supported by the cloud host
///
/// - Parameter handler: Handler callback that will be called with the server's response
- (void)getModels: (void (^)(SENGVGetModelsResponse*, NSError*))handler;

/// Opens a bidirectional stream to the server for the purpose of creating a video enrollment
///
/// This call will automatically send the initial `VideoConfig` message to the server.
/// The config object has the following fields (\* indicates required fields):
///  * modelName\*: Name of the model to create an enrollment for
///  * userId\*: Unique user identifier
///  * deviceId: Device identifier
///    * This should be left empty as this function will automatically the device ID the SDK has been initialized with
///  * description_p: User supplied description of the enrollment
///  * isLivenessEnabled: Determines if a liveness check should be conducted during enrollment
///  * livenessThreshold: Liveness threshold for the potential liveness check
///  * numLivenessFramesRequired: The number of frames that need to pass the liveness check for a successful enrollment
///    * A value of 0 means *all* frames need to pass the liveness check
///  * disableServerEnrollmentStorage: If true, this will prevent the server from storing enrollment tokens locally and aways
///  force it to return a token upon successful enrollment regardless of server configuration
/// - Parameters:
///   - enrollmentConfig: Enrollment configuration object
///   - handler: Handler callback that will be called with the server's responses
/// - Returns: Call object that can be used to send requests to the server and to close the stream once the request is finished
- (GRPCStreamingProtoCall*)createEnrollmentWithConfig: (SENGVCreateEnrollmentConfig*) enrollmentConfig
                                              handler: (id<GRPCProtoResponseHandler>) handler;

/// Opens a bidirectional stream for the purpose of video authentication
///
/// This call will automatically send the initial `VideoConfig` message to the server.
/// The config object has the following fields (\* indicates required fields):
///  * enrollmentId\*: The enrollment ID to authenticate against
///    * Only one of `enrollmentID` and `enrollmentGroupID` should be supplied
///  * enrollmentGroupId\*: The enrollment group ID to authenticate against
///    * Only one of `enrollmentID` and `enrollmentGroupID` should be supplied
///  * isLivenessEnabled: Determines if a liveness check should be conducted during authentication
///  * livenessThreshold: Liveness threshold for the potential liveness check
///  * enrollmentToken: Encrypted enrollment token that was provided on enrollment
///    * If no token was provided, leave this field empty
/// - Parameters:
///   - authConfig: Authentication configuration object
///   - handler: Handler callback that will be called with the server's responses
/// - Returns: Call object that can be used to send requests to the server and to close the stream once the request is finished
- (GRPCStreamingProtoCall*)authenticateWithConfig: (SENGVAuthenticateConfig*) authConfig
                                          handler: (id<GRPCProtoResponseHandler>) handler;

/// Opens a bidirectional stream for the purpose of validating liveness
///
/// This call will automatically send the initial `VideoConfig` message to the server.
/// The config object has the following fields (\* indicates required fields):
///  * modelName\*: Name of the liveness model to use
///  * userId\*: Unique user identifier
///  * threshold\*: Liveness threshold to use for the liveness check
/// - Parameters:
///   - config: Liveness configuration object
///   - handler: Handler callback that will be called with the server's responses
/// - Returns: Call object that can be used to send requests to the server and close the stream once the request is finished
- (GRPCStreamingProtoCall*)validateLivenessWithConfig: (SENGVValidateRecognitionConfig*) config
                                              handler: (id<GRPCProtoResponseHandler>) handler;

@end

#endif /* VideoService_h */
