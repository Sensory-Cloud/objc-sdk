//
//  AudioService.h
//  Pods
//
//  Created by Niles Hacking on 2/20/23.
//

#ifndef AudioService_h
#define AudioService_h

#import <ProtoRPC/ProtoRPC.h>

@class SENTokenManager;
@class GRPCStreamingProtoCall;
@class SENGAAudioConfig;
@class SENGAGetModelsResponse;
@class SENGACreateEnrollmentConfig;
@class SENGAAuthenticateConfig;
@class SENGAValidateEventConfig;
@class SENGACreateEnrollmentEventConfig;
@class SENGAValidateEnrolledEventConfig;
@class SENGATranscribeConfig;
@class SENGAVoiceSynthesisConfig;

/// A collection of GRPC service calls for using audio models through Sensory Cloud
@interface SENAudioService : NSObject

/// Audio configuration that will be used for server calls if one was not supplied in the config object
@property SENGAAudioConfig *audioConfig;

/// Initializes a new instance of `SENAudioService`
///
/// - Parameter tokenManager: Token manager instance to get OAuth credentials from
- (id)init: (SENTokenManager*)tokenManager;

/// Fetches a list of the current audio models supported by the cloud host
///
/// - Parameter handler: Handler callback that will be called with the server's response
- (void)getModels: (void (^)(SENGAGetModelsResponse*, NSError*))handler;

/// Opens a bidirectional stream to the server for the purpose of creating an audio enrollment
///
/// This will automatically send the initial `AudioConfig` message to the server.
/// The config object has the following fields (\* indicates required fields):
/// * modelName\*: Name of the model to enroll against
/// * userId\*: Unique user identifier
/// * deviceId: Device identifier
///   * This should be left empty as this function will automatically the device ID the SDK has been initialized with
/// * audio: Audio configuration object that tells how the audio stream will be formatted
///   * If empty, `self.audioConfig` will be used automatically
/// * description_p: User supplied description of the enrollment
/// * isLivenessEnabled: indicates if liveness is enabled for this request
/// * disableServerEnrollmentStorage: If true, this will prevent the server from storing enrollment tokens locally and aways
/// force it to return a token upon successful enrollment regardless of server configuration
/// - Parameters:
///   - enrollmentConfig: Enrollment configuration object
///   - handler: Handler callback that will be called with the server's responses
/// - Returns: Call object that can be used to send requests to the server and to close the stream once the request is finished
- (GRPCStreamingProtoCall*)createEnrollmentWithConfig: (SENGACreateEnrollmentConfig*) enrollmentConfig
                                              handler: (id<GRPCProtoResponseHandler>) handler;

/// Opens a bidirectional stream for the purpose of authentication against audio enrollments
///
/// This call will automatically send the initial `AudioConfig` message to the server.
/// The config object has the following fields (\* indicates required fields):
///  * enrollmentId\*: The enrollment ID to authenticate against
///    * Only one of `enrollmentId` and `enrollmentGroupId` should be supplied
///  * enrollmentGroupId\*: The enrollment group ID to authenticate against
///    * Only one of `enrollmentId` and `enrollmentGroupId` should be supplied
///  * audio: Audio configuration object that tells how the audio stream will be formatted
///    * If empty, `self.audioConfig` will be used automatically
///  * isLivenessEnabled: Determines if a liveness check should be conducted during authentication
///  * enrollmentToken: Encrypted enrollment token that was provided on enrollment
///    * If no token was provided, leave this field empty
/// - Parameters:
///   - authConfig: Authentication configuration object
///   - handler: Handler callback that will be called with the server's responses
/// - Returns: Call object that can be used to send requests to the server and to close the stream once the request is finished
- (GRPCStreamingProtoCall*)authenticateWithConfig: (SENGAAuthenticateConfig*) authConfig
                                          handler: (id<GRPCProtoResponseHandler>) handler;

/// Opens a bidirectional stream for the purpose of audio event validation
///
/// This call will automatically send the initial `AudioConfig` message to the server.
/// The config object has the following fields (\* indicates required fields):
///  * modelName\*: Name of the model to validate against
///  * userId\*: Unique user identifier
///  * sensitivity\*: How sensitive the model should be to false accepts
///  * audio: Audio configuration object that tells how the audio stream will be formatted
///    * If empty, `self.audioConfig` will be used automatically
/// - Parameters:
///   - config: Stream configuration object
///   - handler: Handler callback that will be called with the server's responses
/// - Returns: Call object that can be used to send requests to the server and to close the stream once the request is finished
- (GRPCStreamingProtoCall*)validateTriggerWithConfig: (SENGAValidateEventConfig*) config
                                             handler: (id<GRPCProtoResponseHandler>) handler;

/// Opens a bidirectional stream for the purpose of creating an enrolled audio event
///
/// This call will automatically send the initial `AudioConfig` message to the server.
/// The config object has the following fields (\* indicates required fields):
/// * modelName\*: Name of the model to enroll against
/// * userId\*: Unique user Identifier
/// * audio: Audio configuration object that tells how the audio stream will be formatted
///   * If empty, `self.audioConfig` will be used automatically
/// * description_p: User supplied description of the enrollment
/// - Parameters:
///   - config: Enrollment configuration object
///   - handler: Handler callback that will be called with the server's responses
/// - Returns: Call object that can be used to send requests to the server and to close the stream once the request is finished
- (GRPCStreamingProtoCall*)createEnrolledEventWithConfig: (SENGACreateEnrollmentEventConfig*) config
                                                 handler: (id<GRPCProtoResponseHandler>) handler;

/// Opens a bidirectional stream for the purpose of authentication agains an enrolled audio event
///
/// This call will automatically send the initial `AudioConfig` message to the server.
/// The config object has the following fields (\* indicates required fields):
///  * enrollmentId\*: The enrollment ID to authenticate against
///    * Only one of `enrollmentId` and `enrollmentGroupId` should be supplied
///  * enrollmentGroupId\*: The enrollment group ID to authenticate against
///    * Only one of `enrollmentId` and `enrollmentGroupId` should be supplied
///  * sensitivity\*: How sensitive the model should be to false accepts
///  * audio: Audio configuration object that tells how the audio stream will be formatted
///    * If empty, `self.audioConfig` will be used automatically
///  * enrollmentToken: Encrypted enrollment token that was provided on enrollment
///    * If no token was provided, leave this field empty
/// - Parameters:
///   - config: Authentication configuration object
///   - handler: Handler callback that will be called with the server's responses
/// - Returns: Call object that can be used to send requests to the server and to close the stream once the request is finished
- (GRPCStreamingProtoCall*)validateEnrolledEventWithConfig: (SENGAValidateEnrolledEventConfig*) config
                                                   handler: (id<GRPCProtoResponseHandler>) handler;

/// Opens a bidirectional stream to the server that provides a transcription of the provided audio data
///
/// This call will automatically send the initial `AudioConfig` message to the server.
/// The final message sent on the returned call object *must* include a post-processing action of FINAL.
/// The config object has the following fields (\* indicates required fields):
/// * modelName\*: Name of the model to use
/// * userId\*: Unique user identifier
/// * audio: Audio configuration object that tells how the audio stream will be formatted
///   * If empty, `self.audioConfig` will be used automatically
/// * enablePunctuationCapitalization: If enabled, the resulting transcript will include punctuation and capitalization
/// * doSingleUtterance: If true, the server will automatically end the stream once the user stops talking
/// * vadSensitivity: The sensitivity of the voice activity detection. `Low` should be used in most cases
/// * vadDuration: The duration of silence to detect before automatically closing the stream as a number of seconds
/// - Parameters:
///   - config: Stream configuration object
///   - handler: Handler callback that will be called with the server's responses
/// - Returns: Call object that can be used to send requests to the server and to close the stream once the request is finished
- (GRPCStreamingProtoCall*)transcribeAudioWithConfig: (SENGATranscribeConfig*) config
                                             handler: (id<GRPCProtoResponseHandler>) handler;

/// Sends a request to Sensory Cloud to synthesize speech
///
/// Concatenating all of the `audioContent` responses passed to the handler will result in a complete WAV file of the audio.
/// The config object has the following fields (\* indicates required fields):
/// * modelName\*: Name of the synthesis model to use
/// * sampleRateHertz\*: The desired sample rate of the synthesized audio, 16000Hz should be used in most cases
/// - Parameters:
///   - phrase: The text phrase to synthesize speech for
///   - config: The synthesis config object
///   - handler: Handler callback that will be called with the server's responses
- (void)synthesizeSpeech: (NSString*) phrase
                  config: (SENGAVoiceSynthesisConfig*) config
                 handler: (id<GRPCProtoResponseHandler>) handler;

@end

#endif /* AudioService_h */
