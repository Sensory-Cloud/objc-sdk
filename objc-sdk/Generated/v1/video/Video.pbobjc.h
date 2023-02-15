// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: v1/video/video.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30004
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30004 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class SENCompressionConfiguration;
@class SENEnrollmentToken;
@class SENTokenResponse;
@class SENVAuthenticateConfig;
@class SENVCreateEnrollmentConfig;
@class SENVValidateRecognitionConfig;
@class SENVVideoModel;
GPB_ENUM_FWD_DECLARE(SENModelType);
GPB_ENUM_FWD_DECLARE(SENTechnologyType);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum SENVRecognitionThreshold

/** Specifies how sensitive the recognition threshold of the model should be */
typedef GPB_ENUM(SENVRecognitionThreshold) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENVRecognitionThreshold_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  SENVRecognitionThreshold_Low = 0,
  SENVRecognitionThreshold_Medium = 1,
  SENVRecognitionThreshold_High = 2,
  SENVRecognitionThreshold_Highest = 3,
};

GPBEnumDescriptor *SENVRecognitionThreshold_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENVRecognitionThreshold_IsValidValue(int32_t value);

#pragma mark - SENVVideoRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
GPB_FINAL @interface SENVVideoRoot : GPBRootObject
@end

#pragma mark - SENVVideoModel

typedef GPB_ENUM(SENVVideoModel_FieldNumber) {
  SENVVideoModel_FieldNumber_Name = 1,
  SENVVideoModel_FieldNumber_IsEnrollable = 2,
  SENVVideoModel_FieldNumber_ModelType = 3,
  SENVVideoModel_FieldNumber_FixedObject = 4,
  SENVVideoModel_FieldNumber_VersionsArray = 5,
  SENVVideoModel_FieldNumber_Technology = 6,
  SENVVideoModel_FieldNumber_IsLivenessSupported = 7,
};

/**
 * A model that is available for use
 **/
GPB_FINAL @interface SENVVideoModel : GPBMessage

/** The name of the model */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** Boolean representing if a model can be used in enrollment */
@property(nonatomic, readwrite) BOOL isEnrollable;

/** Model type string */
@property(nonatomic, readwrite) enum SENModelType modelType;

/** Specific object for which this model is made */
@property(nonatomic, readwrite, copy, null_resettable) NSString *fixedObject;

/** List of versions available for this model */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<NSString*> *versionsArray;
/** The number of items in @c versionsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger versionsArray_Count;

/** The technology backing this model */
@property(nonatomic, readwrite) enum SENTechnologyType technology;

/** Indicates if liveness is supported by this model */
@property(nonatomic, readwrite) BOOL isLivenessSupported;

@end

/**
 * Fetches the raw value of a @c SENVVideoModel's @c modelType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENVVideoModel_ModelType_RawValue(SENVVideoModel *message);
/**
 * Sets the raw value of an @c SENVVideoModel's @c modelType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENVVideoModel_ModelType_RawValue(SENVVideoModel *message, int32_t value);

/**
 * Fetches the raw value of a @c SENVVideoModel's @c technology property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENVVideoModel_Technology_RawValue(SENVVideoModel *message);
/**
 * Sets the raw value of an @c SENVVideoModel's @c technology property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENVVideoModel_Technology_RawValue(SENVVideoModel *message, int32_t value);

#pragma mark - SENVGetModelsRequest

/**
 * Request to get a list of the available models
 **/
GPB_FINAL @interface SENVGetModelsRequest : GPBMessage

@end

#pragma mark - SENVGetModelsResponse

typedef GPB_ENUM(SENVGetModelsResponse_FieldNumber) {
  SENVGetModelsResponse_FieldNumber_ModelsArray = 1,
};

/**
 * Response containing the models currently available
 **/
GPB_FINAL @interface SENVGetModelsResponse : GPBMessage

/** List of supported models */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<SENVVideoModel*> *modelsArray;
/** The number of items in @c modelsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger modelsArray_Count;

@end

#pragma mark - SENVCreateEnrollmentRequest

typedef GPB_ENUM(SENVCreateEnrollmentRequest_FieldNumber) {
  SENVCreateEnrollmentRequest_FieldNumber_Config = 1,
  SENVCreateEnrollmentRequest_FieldNumber_ImageContent = 2,
};

typedef GPB_ENUM(SENVCreateEnrollmentRequest_StreamingRequest_OneOfCase) {
  SENVCreateEnrollmentRequest_StreamingRequest_OneOfCase_GPBUnsetOneOfCase = 0,
  SENVCreateEnrollmentRequest_StreamingRequest_OneOfCase_Config = 1,
  SENVCreateEnrollmentRequest_StreamingRequest_OneOfCase_ImageContent = 2,
};

/**
 * The top-level message sent by the client for the `CreateEnrollment` method.
 * Multiple `CreateEnrollmentRequest` messages are sent in a stream. The first message
 * must contain a `config` message and must not contain `imageContent`.
 * All subsequent messages must contain `imageContent` and
 * must not contain a `config` message.
 **/
GPB_FINAL @interface SENVCreateEnrollmentRequest : GPBMessage

/** The streaming request, which is either a config or image content. */
@property(nonatomic, readonly) SENVCreateEnrollmentRequest_StreamingRequest_OneOfCase streamingRequestOneOfCase;

/**
 * Provides information that specifies how to process the
 * request. The first `CreateEnrollmentRequest` message must contain a
 * `config`  message.
 **/
@property(nonatomic, readwrite, strong, null_resettable) SENVCreateEnrollmentConfig *config;

/** The image content to be recognized sent as bytes. */
@property(nonatomic, readwrite, copy, null_resettable) NSData *imageContent;

@end

/**
 * Clears whatever value was set for the oneof 'streamingRequest'.
 **/
void SENVCreateEnrollmentRequest_ClearStreamingRequestOneOfCase(SENVCreateEnrollmentRequest *message);

#pragma mark - SENVAuthenticateRequest

typedef GPB_ENUM(SENVAuthenticateRequest_FieldNumber) {
  SENVAuthenticateRequest_FieldNumber_Config = 1,
  SENVAuthenticateRequest_FieldNumber_ImageContent = 2,
};

typedef GPB_ENUM(SENVAuthenticateRequest_StreamingRequest_OneOfCase) {
  SENVAuthenticateRequest_StreamingRequest_OneOfCase_GPBUnsetOneOfCase = 0,
  SENVAuthenticateRequest_StreamingRequest_OneOfCase_Config = 1,
  SENVAuthenticateRequest_StreamingRequest_OneOfCase_ImageContent = 2,
};

/**
 * The top-level message sent by the client for the `Authenticate` method.
 * Multiple `AuthenticateRequest` messages are sent in a stream. The first message
 * must contain a `config` message and must not contain `imageContent`.
 * All subsequent messages must contain `imageContent` and
 * must not contain a `config` message.
 **/
GPB_FINAL @interface SENVAuthenticateRequest : GPBMessage

/** The streaming request, which is either a config or image content. */
@property(nonatomic, readonly) SENVAuthenticateRequest_StreamingRequest_OneOfCase streamingRequestOneOfCase;

/**
 * Provides information that specifies how to process the
 * request. The first `AuthenticateRequest` message must contain a
 * `config`  message.
 **/
@property(nonatomic, readwrite, strong, null_resettable) SENVAuthenticateConfig *config;

/** The image content to be recognized sent as bytes. */
@property(nonatomic, readwrite, copy, null_resettable) NSData *imageContent;

@end

/**
 * Clears whatever value was set for the oneof 'streamingRequest'.
 **/
void SENVAuthenticateRequest_ClearStreamingRequestOneOfCase(SENVAuthenticateRequest *message);

#pragma mark - SENVValidateRecognitionRequest

typedef GPB_ENUM(SENVValidateRecognitionRequest_FieldNumber) {
  SENVValidateRecognitionRequest_FieldNumber_Config = 1,
  SENVValidateRecognitionRequest_FieldNumber_ImageContent = 2,
};

typedef GPB_ENUM(SENVValidateRecognitionRequest_StreamingRequest_OneOfCase) {
  SENVValidateRecognitionRequest_StreamingRequest_OneOfCase_GPBUnsetOneOfCase = 0,
  SENVValidateRecognitionRequest_StreamingRequest_OneOfCase_Config = 1,
  SENVValidateRecognitionRequest_StreamingRequest_OneOfCase_ImageContent = 2,
};

/**
 * The top-level message sent by the client for the `ValidateLiveness` method.
 * Multiple `ValidateRecognitionRequest` messages are sent in a stream. The first message
 * must contain a `config` message and must not contain `imageContent`.
 * All subsequent messages must contain `imageContent` and
 * must not contain a `config` message.
 **/
GPB_FINAL @interface SENVValidateRecognitionRequest : GPBMessage

/** The streaming request, which is either a config or image content. */
@property(nonatomic, readonly) SENVValidateRecognitionRequest_StreamingRequest_OneOfCase streamingRequestOneOfCase;

/**
 * Provides information that specifies how to process the
 * request. The first `ValidateRecognitionRequest` message must contain a
 * `config`  message.
 **/
@property(nonatomic, readwrite, strong, null_resettable) SENVValidateRecognitionConfig *config;

/** The image content to be recognized sent as bytes. */
@property(nonatomic, readwrite, copy, null_resettable) NSData *imageContent;

@end

/**
 * Clears whatever value was set for the oneof 'streamingRequest'.
 **/
void SENVValidateRecognitionRequest_ClearStreamingRequestOneOfCase(SENVValidateRecognitionRequest *message);

#pragma mark - SENVCreateEnrollmentResponse

typedef GPB_ENUM(SENVCreateEnrollmentResponse_FieldNumber) {
  SENVCreateEnrollmentResponse_FieldNumber_PercentComplete = 1,
  SENVCreateEnrollmentResponse_FieldNumber_IsAlive = 2,
  SENVCreateEnrollmentResponse_FieldNumber_EnrollmentId = 3,
  SENVCreateEnrollmentResponse_FieldNumber_ModelName = 4,
  SENVCreateEnrollmentResponse_FieldNumber_ModelVersion = 5,
  SENVCreateEnrollmentResponse_FieldNumber_Score = 6,
  SENVCreateEnrollmentResponse_FieldNumber_EnrollmentToken = 7,
};

/**
 * Response to an enrollment request
 **/
GPB_FINAL @interface SENVCreateEnrollmentResponse : GPBMessage

/** Percent Complete as values between 0 and 100 */
@property(nonatomic, readwrite) int64_t percentComplete;

/** Liveness check bit. This value with always be false if 'isLivenessEnabled' is set to false in the CreateEnrollmentConfig */
@property(nonatomic, readwrite) BOOL isAlive;

/** If enrollment is successful, this value will be the unique Enrollment ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *enrollmentId;

/** Model used for enrollment */
@property(nonatomic, readwrite, copy, null_resettable) NSString *modelName;

/** Model version used for enrollment */
@property(nonatomic, readwrite, copy, null_resettable) NSString *modelVersion;

/** Score of the enrollment. Currently only used for error messages. */
@property(nonatomic, readwrite) float score;

/**
 * Encrypted enrollment token, this token should be included in authentication requests
 * If the server is configured to store enrollments server side, this will be left empty
 **/
@property(nonatomic, readwrite, strong, null_resettable) SENEnrollmentToken *enrollmentToken;
/** Test to see if @c enrollmentToken has been set. */
@property(nonatomic, readwrite) BOOL hasEnrollmentToken;

@end

#pragma mark - SENVAuthenticateResponse

typedef GPB_ENUM(SENVAuthenticateResponse_FieldNumber) {
  SENVAuthenticateResponse_FieldNumber_Success = 1,
  SENVAuthenticateResponse_FieldNumber_Score = 2,
  SENVAuthenticateResponse_FieldNumber_IsAlive = 3,
  SENVAuthenticateResponse_FieldNumber_Token = 4,
  SENVAuthenticateResponse_FieldNumber_UserId = 5,
  SENVAuthenticateResponse_FieldNumber_EnrollmentId = 6,
};

/**
 * Response to an authentication request
 **/
GPB_FINAL @interface SENVAuthenticateResponse : GPBMessage

/** Success / Failure bit */
@property(nonatomic, readwrite) BOOL success;

/** Score of the authentication (lower is better) */
@property(nonatomic, readwrite) float score;

/** Liveness check bit. This value with always be false if 'isLivenessEnabled' is set to false in the AuthenticateConfig */
@property(nonatomic, readwrite) BOOL isAlive;

/** Optional token that will be returned upon a successful authentication if doIncludeToken is set to true in the AuthenticateConfig */
@property(nonatomic, readwrite, strong, null_resettable) SENTokenResponse *token;
/** Test to see if @c token has been set. */
@property(nonatomic, readwrite) BOOL hasToken;

/**
 * The userID of the authenticated user
 * Useful when evaluating enrollment groups
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSString *userId;

/**
 * The enrollment ID of the authenticated enrollment
 * Useful when evaluating enrollment groups
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSString *enrollmentId;

@end

#pragma mark - SENVLivenessRecognitionResponse

typedef GPB_ENUM(SENVLivenessRecognitionResponse_FieldNumber) {
  SENVLivenessRecognitionResponse_FieldNumber_IsAlive = 1,
  SENVLivenessRecognitionResponse_FieldNumber_Score = 2,
};

/**
 * Response to a liveness recognition request
 **/
GPB_FINAL @interface SENVLivenessRecognitionResponse : GPBMessage

/** Success / Failure bit */
@property(nonatomic, readwrite) BOOL isAlive;

/** Score of the liveness (lower is better) */
@property(nonatomic, readwrite) float score;

@end

#pragma mark - SENVCreateEnrollmentConfig

typedef GPB_ENUM(SENVCreateEnrollmentConfig_FieldNumber) {
  SENVCreateEnrollmentConfig_FieldNumber_UserId = 1,
  SENVCreateEnrollmentConfig_FieldNumber_DeviceId = 2,
  SENVCreateEnrollmentConfig_FieldNumber_ModelName = 3,
  SENVCreateEnrollmentConfig_FieldNumber_Description_p = 4,
  SENVCreateEnrollmentConfig_FieldNumber_IsLivenessEnabled = 5,
  SENVCreateEnrollmentConfig_FieldNumber_LivenessThreshold = 6,
  SENVCreateEnrollmentConfig_FieldNumber_Compression = 7,
  SENVCreateEnrollmentConfig_FieldNumber_ReferenceId = 8,
  SENVCreateEnrollmentConfig_FieldNumber_NumLivenessFramesRequired = 9,
  SENVCreateEnrollmentConfig_FieldNumber_DisableServerEnrollmentTemplateStorage = 10,
};

/**
 * Provides information for an enrollment
 **/
GPB_FINAL @interface SENVCreateEnrollmentConfig : GPBMessage

/** The unique user Identifer. This value should be a unique email address or username known by the user. */
@property(nonatomic, readwrite, copy, null_resettable) NSString *userId;

/**
 * The unique device Identifer. This value should be something retrieved by the devie prior to enrollment (like MAC Address)
 * this value is used to identify a device uniquely across multiple enrollments
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSString *deviceId;

/**
 * Name of background model to be enrolled in
 * Background models can be retrieved from the GetModels() gRPC call
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSString *modelName;

/**
 * Description of the enrollment as entered by the user.
 * Max length is 1023 characters
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSString *description_p;

/** Enable a liveness check on the image, which will further improve the security of enrollment at the expense of a slightly slower response. */
@property(nonatomic, readwrite) BOOL isLivenessEnabled;

/** The liveness threshold */
@property(nonatomic, readwrite) SENVRecognitionThreshold livenessThreshold;

/** Information about how the video data will be compressed. */
@property(nonatomic, readwrite, strong, null_resettable) SENCompressionConfiguration *compression;
/** Test to see if @c compression has been set. */
@property(nonatomic, readwrite) BOOL hasCompression;

/**
 * Reference Id allows clients to assign their own identifier to enrollments for various purposes
 * such as tying an audio and video enrollment together.
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSString *referenceId;

/**
 * If isLivenessEnabled is true, this determines how many frames need to pass the liveness check before the enrollment can be successful
 * A value of 0 means that all enrollment frames must pass the liveness check.
 **/
@property(nonatomic, readwrite) int32_t numLivenessFramesRequired;

/** Prevent the server from storing the enrollment template. The template will be returned to the client for storage. */
@property(nonatomic, readwrite) BOOL disableServerEnrollmentTemplateStorage;

@end

/**
 * Fetches the raw value of a @c SENVCreateEnrollmentConfig's @c livenessThreshold property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENVCreateEnrollmentConfig_LivenessThreshold_RawValue(SENVCreateEnrollmentConfig *message);
/**
 * Sets the raw value of an @c SENVCreateEnrollmentConfig's @c livenessThreshold property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENVCreateEnrollmentConfig_LivenessThreshold_RawValue(SENVCreateEnrollmentConfig *message, int32_t value);

#pragma mark - SENVAuthenticateConfig

typedef GPB_ENUM(SENVAuthenticateConfig_FieldNumber) {
  SENVAuthenticateConfig_FieldNumber_EnrollmentId = 1,
  SENVAuthenticateConfig_FieldNumber_EnrollmentGroupId = 2,
  SENVAuthenticateConfig_FieldNumber_IsLivenessEnabled = 3,
  SENVAuthenticateConfig_FieldNumber_LivenessThreshold = 4,
  SENVAuthenticateConfig_FieldNumber_Compression = 5,
  SENVAuthenticateConfig_FieldNumber_DoIncludeToken = 6,
  SENVAuthenticateConfig_FieldNumber_EnrollmentToken = 7,
};

typedef GPB_ENUM(SENVAuthenticateConfig_AuthId_OneOfCase) {
  SENVAuthenticateConfig_AuthId_OneOfCase_GPBUnsetOneOfCase = 0,
  SENVAuthenticateConfig_AuthId_OneOfCase_EnrollmentId = 1,
  SENVAuthenticateConfig_AuthId_OneOfCase_EnrollmentGroupId = 2,
};

/**
 * Provides information for an image-based authentication
 **/
GPB_FINAL @interface SENVAuthenticateConfig : GPBMessage

/** An identifier for what to authenticate against, either an individual enrollment or a group of enrollments */
@property(nonatomic, readonly) SENVAuthenticateConfig_AuthId_OneOfCase authIdOneOfCase;

/** Unique identifier created at enrollment */
@property(nonatomic, readwrite, copy, null_resettable) NSString *enrollmentId;

/** Unique identifier for an enrollment group */
@property(nonatomic, readwrite, copy, null_resettable) NSString *enrollmentGroupId;

/** Enable a liveness check on the image, which will further improve the security of authentication at the expense of a slightly slower response. */
@property(nonatomic, readwrite) BOOL isLivenessEnabled;

/** The liveness threshold */
@property(nonatomic, readwrite) SENVRecognitionThreshold livenessThreshold;

/** Information aobut how the video data will be compressed. */
@property(nonatomic, readwrite, strong, null_resettable) SENCompressionConfiguration *compression;
/** Test to see if @c compression has been set. */
@property(nonatomic, readwrite) BOOL hasCompression;

/**
 * A boolean indicating if the response should include an OAuth token for the user associated with the enrollmentId
 * The OAuth token will only be returned if the authentication is successful.
 * It's important to note there will be a minor performance hit to authentication, as OAuth token generation is a semi-expensive operation.
 **/
@property(nonatomic, readwrite) BOOL doIncludeToken;

/**
 * Encrypted enrollment token that was provided on enrollment creation
 * If the server is configured to store enrollments server side, this may be left blank
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSData *enrollmentToken;

@end

/**
 * Fetches the raw value of a @c SENVAuthenticateConfig's @c livenessThreshold property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENVAuthenticateConfig_LivenessThreshold_RawValue(SENVAuthenticateConfig *message);
/**
 * Sets the raw value of an @c SENVAuthenticateConfig's @c livenessThreshold property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENVAuthenticateConfig_LivenessThreshold_RawValue(SENVAuthenticateConfig *message, int32_t value);

/**
 * Clears whatever value was set for the oneof 'authId'.
 **/
void SENVAuthenticateConfig_ClearAuthIdOneOfCase(SENVAuthenticateConfig *message);

#pragma mark - SENVValidateRecognitionConfig

typedef GPB_ENUM(SENVValidateRecognitionConfig_FieldNumber) {
  SENVValidateRecognitionConfig_FieldNumber_ModelName = 1,
  SENVValidateRecognitionConfig_FieldNumber_UserId = 2,
  SENVValidateRecognitionConfig_FieldNumber_Threshold = 3,
};

/**
 * Provides information for a video-based event recognition
 **/
GPB_FINAL @interface SENVValidateRecognitionConfig : GPBMessage

/**
 * Name of model to validate against
 * Models can be retrieved from the GetModels() gRPC call
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSString *modelName;

/** The unique user Identifer */
@property(nonatomic, readwrite, copy, null_resettable) NSString *userId;

/** The model threshold */
@property(nonatomic, readwrite) SENVRecognitionThreshold threshold;

@end

/**
 * Fetches the raw value of a @c SENVValidateRecognitionConfig's @c threshold property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENVValidateRecognitionConfig_Threshold_RawValue(SENVValidateRecognitionConfig *message);
/**
 * Sets the raw value of an @c SENVValidateRecognitionConfig's @c threshold property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENVValidateRecognitionConfig_Threshold_RawValue(SENVValidateRecognitionConfig *message, int32_t value);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
