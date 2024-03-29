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

@class SENGCompressionConfiguration;
@class SENGEnrollmentToken;
@class SENGTokenResponse;
@class SENGVAuthenticateConfig;
@class SENGVCreateEnrollmentConfig;
@class SENGVValidateRecognitionConfig;
@class SENGVVideoModel;
GPB_ENUM_FWD_DECLARE(SENGModelType);
GPB_ENUM_FWD_DECLARE(SENGTechnologyType);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum SENGVRecognitionThreshold

/** Specifies how sensitive the recognition threshold of the model should be */
typedef GPB_ENUM(SENGVRecognitionThreshold) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENGVRecognitionThreshold_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  SENGVRecognitionThreshold_Low = 0,
  SENGVRecognitionThreshold_Medium = 1,
  SENGVRecognitionThreshold_High = 2,
  SENGVRecognitionThreshold_Highest = 3,
};

GPBEnumDescriptor *SENGVRecognitionThreshold_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENGVRecognitionThreshold_IsValidValue(int32_t value);

#pragma mark - SENGVVideoRoot

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
GPB_FINAL @interface SENGVVideoRoot : GPBRootObject
@end

#pragma mark - SENGVVideoModel

typedef GPB_ENUM(SENGVVideoModel_FieldNumber) {
  SENGVVideoModel_FieldNumber_Name = 1,
  SENGVVideoModel_FieldNumber_IsEnrollable = 2,
  SENGVVideoModel_FieldNumber_ModelType = 3,
  SENGVVideoModel_FieldNumber_FixedObject = 4,
  SENGVVideoModel_FieldNumber_VersionsArray = 5,
  SENGVVideoModel_FieldNumber_Technology = 6,
  SENGVVideoModel_FieldNumber_IsLivenessSupported = 7,
};

/**
 * A model that is available for use
 **/
GPB_FINAL @interface SENGVVideoModel : GPBMessage

/** The name of the model */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** Boolean representing if a model can be used in enrollment */
@property(nonatomic, readwrite) BOOL isEnrollable;

/** Model type string */
@property(nonatomic, readwrite) enum SENGModelType modelType;

/** Specific object for which this model is made */
@property(nonatomic, readwrite, copy, null_resettable) NSString *fixedObject;

/** List of versions available for this model */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<NSString*> *versionsArray;
/** The number of items in @c versionsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger versionsArray_Count;

/** The technology backing this model */
@property(nonatomic, readwrite) enum SENGTechnologyType technology;

/** Indicates if liveness is supported by this model */
@property(nonatomic, readwrite) BOOL isLivenessSupported;

@end

/**
 * Fetches the raw value of a @c SENGVVideoModel's @c modelType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENGVVideoModel_ModelType_RawValue(SENGVVideoModel *message);
/**
 * Sets the raw value of an @c SENGVVideoModel's @c modelType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENGVVideoModel_ModelType_RawValue(SENGVVideoModel *message, int32_t value);

/**
 * Fetches the raw value of a @c SENGVVideoModel's @c technology property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENGVVideoModel_Technology_RawValue(SENGVVideoModel *message);
/**
 * Sets the raw value of an @c SENGVVideoModel's @c technology property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENGVVideoModel_Technology_RawValue(SENGVVideoModel *message, int32_t value);

#pragma mark - SENGVGetModelsRequest

/**
 * Request to get a list of the available models
 **/
GPB_FINAL @interface SENGVGetModelsRequest : GPBMessage

@end

#pragma mark - SENGVGetModelsResponse

typedef GPB_ENUM(SENGVGetModelsResponse_FieldNumber) {
  SENGVGetModelsResponse_FieldNumber_ModelsArray = 1,
};

/**
 * Response containing the models currently available
 **/
GPB_FINAL @interface SENGVGetModelsResponse : GPBMessage

/** List of supported models */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<SENGVVideoModel*> *modelsArray;
/** The number of items in @c modelsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger modelsArray_Count;

@end

#pragma mark - SENGVCreateEnrollmentRequest

typedef GPB_ENUM(SENGVCreateEnrollmentRequest_FieldNumber) {
  SENGVCreateEnrollmentRequest_FieldNumber_Config = 1,
  SENGVCreateEnrollmentRequest_FieldNumber_ImageContent = 2,
};

typedef GPB_ENUM(SENGVCreateEnrollmentRequest_StreamingRequest_OneOfCase) {
  SENGVCreateEnrollmentRequest_StreamingRequest_OneOfCase_GPBUnsetOneOfCase = 0,
  SENGVCreateEnrollmentRequest_StreamingRequest_OneOfCase_Config = 1,
  SENGVCreateEnrollmentRequest_StreamingRequest_OneOfCase_ImageContent = 2,
};

/**
 * The top-level message sent by the client for the `CreateEnrollment` method.
 * Multiple `CreateEnrollmentRequest` messages are sent in a stream. The first message
 * must contain a `config` message and must not contain `imageContent`.
 * All subsequent messages must contain `imageContent` and
 * must not contain a `config` message.
 **/
GPB_FINAL @interface SENGVCreateEnrollmentRequest : GPBMessage

/** The streaming request, which is either a config or image content. */
@property(nonatomic, readonly) SENGVCreateEnrollmentRequest_StreamingRequest_OneOfCase streamingRequestOneOfCase;

/**
 * Provides information that specifies how to process the
 * request. The first `CreateEnrollmentRequest` message must contain a
 * `config`  message.
 **/
@property(nonatomic, readwrite, strong, null_resettable) SENGVCreateEnrollmentConfig *config;

/** The image content to be recognized sent as bytes. */
@property(nonatomic, readwrite, copy, null_resettable) NSData *imageContent;

@end

/**
 * Clears whatever value was set for the oneof 'streamingRequest'.
 **/
void SENGVCreateEnrollmentRequest_ClearStreamingRequestOneOfCase(SENGVCreateEnrollmentRequest *message);

#pragma mark - SENGVAuthenticateRequest

typedef GPB_ENUM(SENGVAuthenticateRequest_FieldNumber) {
  SENGVAuthenticateRequest_FieldNumber_Config = 1,
  SENGVAuthenticateRequest_FieldNumber_ImageContent = 2,
};

typedef GPB_ENUM(SENGVAuthenticateRequest_StreamingRequest_OneOfCase) {
  SENGVAuthenticateRequest_StreamingRequest_OneOfCase_GPBUnsetOneOfCase = 0,
  SENGVAuthenticateRequest_StreamingRequest_OneOfCase_Config = 1,
  SENGVAuthenticateRequest_StreamingRequest_OneOfCase_ImageContent = 2,
};

/**
 * The top-level message sent by the client for the `Authenticate` method.
 * Multiple `AuthenticateRequest` messages are sent in a stream. The first message
 * must contain a `config` message and must not contain `imageContent`.
 * All subsequent messages must contain `imageContent` and
 * must not contain a `config` message.
 **/
GPB_FINAL @interface SENGVAuthenticateRequest : GPBMessage

/** The streaming request, which is either a config or image content. */
@property(nonatomic, readonly) SENGVAuthenticateRequest_StreamingRequest_OneOfCase streamingRequestOneOfCase;

/**
 * Provides information that specifies how to process the
 * request. The first `AuthenticateRequest` message must contain a
 * `config`  message.
 **/
@property(nonatomic, readwrite, strong, null_resettable) SENGVAuthenticateConfig *config;

/** The image content to be recognized sent as bytes. */
@property(nonatomic, readwrite, copy, null_resettable) NSData *imageContent;

@end

/**
 * Clears whatever value was set for the oneof 'streamingRequest'.
 **/
void SENGVAuthenticateRequest_ClearStreamingRequestOneOfCase(SENGVAuthenticateRequest *message);

#pragma mark - SENGVValidateRecognitionRequest

typedef GPB_ENUM(SENGVValidateRecognitionRequest_FieldNumber) {
  SENGVValidateRecognitionRequest_FieldNumber_Config = 1,
  SENGVValidateRecognitionRequest_FieldNumber_ImageContent = 2,
};

typedef GPB_ENUM(SENGVValidateRecognitionRequest_StreamingRequest_OneOfCase) {
  SENGVValidateRecognitionRequest_StreamingRequest_OneOfCase_GPBUnsetOneOfCase = 0,
  SENGVValidateRecognitionRequest_StreamingRequest_OneOfCase_Config = 1,
  SENGVValidateRecognitionRequest_StreamingRequest_OneOfCase_ImageContent = 2,
};

/**
 * The top-level message sent by the client for the `ValidateLiveness` method.
 * Multiple `ValidateRecognitionRequest` messages are sent in a stream. The first message
 * must contain a `config` message and must not contain `imageContent`.
 * All subsequent messages must contain `imageContent` and
 * must not contain a `config` message.
 **/
GPB_FINAL @interface SENGVValidateRecognitionRequest : GPBMessage

/** The streaming request, which is either a config or image content. */
@property(nonatomic, readonly) SENGVValidateRecognitionRequest_StreamingRequest_OneOfCase streamingRequestOneOfCase;

/**
 * Provides information that specifies how to process the
 * request. The first `ValidateRecognitionRequest` message must contain a
 * `config`  message.
 **/
@property(nonatomic, readwrite, strong, null_resettable) SENGVValidateRecognitionConfig *config;

/** The image content to be recognized sent as bytes. */
@property(nonatomic, readwrite, copy, null_resettable) NSData *imageContent;

@end

/**
 * Clears whatever value was set for the oneof 'streamingRequest'.
 **/
void SENGVValidateRecognitionRequest_ClearStreamingRequestOneOfCase(SENGVValidateRecognitionRequest *message);

#pragma mark - SENGVCreateEnrollmentResponse

typedef GPB_ENUM(SENGVCreateEnrollmentResponse_FieldNumber) {
  SENGVCreateEnrollmentResponse_FieldNumber_PercentComplete = 1,
  SENGVCreateEnrollmentResponse_FieldNumber_IsAlive = 2,
  SENGVCreateEnrollmentResponse_FieldNumber_EnrollmentId = 3,
  SENGVCreateEnrollmentResponse_FieldNumber_ModelName = 4,
  SENGVCreateEnrollmentResponse_FieldNumber_ModelVersion = 5,
  SENGVCreateEnrollmentResponse_FieldNumber_Score = 6,
  SENGVCreateEnrollmentResponse_FieldNumber_EnrollmentToken = 7,
  SENGVCreateEnrollmentResponse_FieldNumber_DidFindFace = 8,
  SENGVCreateEnrollmentResponse_FieldNumber_BoundingBoxArray = 9,
  SENGVCreateEnrollmentResponse_FieldNumber_ProbabilityFace = 10,
};

/**
 * Response to an enrollment request
 **/
GPB_FINAL @interface SENGVCreateEnrollmentResponse : GPBMessage

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
@property(nonatomic, readwrite, strong, null_resettable) SENGEnrollmentToken *enrollmentToken;
/** Test to see if @c enrollmentToken has been set. */
@property(nonatomic, readwrite) BOOL hasEnrollmentToken;

/** Indicates if a face was found in the uploaded image */
@property(nonatomic, readwrite) BOOL didFindFace;

/** The bounding box of the face */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt64Array *boundingBoxArray;
/** The number of items in @c boundingBoxArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger boundingBoxArray_Count;

/** The model's confidence in its face detection */
@property(nonatomic, readwrite) float probabilityFace;

@end

#pragma mark - SENGVAuthenticateResponse

typedef GPB_ENUM(SENGVAuthenticateResponse_FieldNumber) {
  SENGVAuthenticateResponse_FieldNumber_Success = 1,
  SENGVAuthenticateResponse_FieldNumber_Score = 2,
  SENGVAuthenticateResponse_FieldNumber_IsAlive = 3,
  SENGVAuthenticateResponse_FieldNumber_Token = 4,
  SENGVAuthenticateResponse_FieldNumber_UserId = 5,
  SENGVAuthenticateResponse_FieldNumber_EnrollmentId = 6,
  SENGVAuthenticateResponse_FieldNumber_DidFindFace = 7,
  SENGVAuthenticateResponse_FieldNumber_BoundingBoxArray = 8,
  SENGVAuthenticateResponse_FieldNumber_ProbabilityFace = 9,
};

/**
 * Response to an authentication request
 **/
GPB_FINAL @interface SENGVAuthenticateResponse : GPBMessage

/** Success / Failure bit */
@property(nonatomic, readwrite) BOOL success;

/** Score of the authentication (lower is better) */
@property(nonatomic, readwrite) float score;

/** Liveness check bit. This value with always be false if 'isLivenessEnabled' is set to false in the AuthenticateConfig */
@property(nonatomic, readwrite) BOOL isAlive;

/** Optional token that will be returned upon a successful authentication if doIncludeToken is set to true in the AuthenticateConfig */
@property(nonatomic, readwrite, strong, null_resettable) SENGTokenResponse *token;
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

/** Indicates if a face was found in the uploaded image */
@property(nonatomic, readwrite) BOOL didFindFace;

/** The bounding box of the face */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt64Array *boundingBoxArray;
/** The number of items in @c boundingBoxArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger boundingBoxArray_Count;

/** The model's confidence in its face detection */
@property(nonatomic, readwrite) float probabilityFace;

@end

#pragma mark - SENGVLivenessRecognitionResponse

typedef GPB_ENUM(SENGVLivenessRecognitionResponse_FieldNumber) {
  SENGVLivenessRecognitionResponse_FieldNumber_IsAlive = 1,
  SENGVLivenessRecognitionResponse_FieldNumber_Score = 2,
  SENGVLivenessRecognitionResponse_FieldNumber_DidFindFace = 3,
  SENGVLivenessRecognitionResponse_FieldNumber_BoundingBoxArray = 4,
  SENGVLivenessRecognitionResponse_FieldNumber_ProbabilityFace = 5,
};

/**
 * Response to a liveness recognition request
 **/
GPB_FINAL @interface SENGVLivenessRecognitionResponse : GPBMessage

/** Success / Failure bit */
@property(nonatomic, readwrite) BOOL isAlive;

/** Score of the liveness (lower is better) */
@property(nonatomic, readwrite) float score;

/** Indicates if a face was found in the uploaded image */
@property(nonatomic, readwrite) BOOL didFindFace;

/** The bounding box of the face */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt64Array *boundingBoxArray;
/** The number of items in @c boundingBoxArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger boundingBoxArray_Count;

/** The model's confidence in its face detection */
@property(nonatomic, readwrite) float probabilityFace;

@end

#pragma mark - SENGVCreateEnrollmentConfig

typedef GPB_ENUM(SENGVCreateEnrollmentConfig_FieldNumber) {
  SENGVCreateEnrollmentConfig_FieldNumber_UserId = 1,
  SENGVCreateEnrollmentConfig_FieldNumber_DeviceId = 2,
  SENGVCreateEnrollmentConfig_FieldNumber_ModelName = 3,
  SENGVCreateEnrollmentConfig_FieldNumber_Description_p = 4,
  SENGVCreateEnrollmentConfig_FieldNumber_IsLivenessEnabled = 5,
  SENGVCreateEnrollmentConfig_FieldNumber_LivenessThreshold = 6,
  SENGVCreateEnrollmentConfig_FieldNumber_Compression = 7,
  SENGVCreateEnrollmentConfig_FieldNumber_ReferenceId = 8,
  SENGVCreateEnrollmentConfig_FieldNumber_NumLivenessFramesRequired = 9,
  SENGVCreateEnrollmentConfig_FieldNumber_DisableServerEnrollmentTemplateStorage = 10,
};

/**
 * Provides information for an enrollment
 **/
GPB_FINAL @interface SENGVCreateEnrollmentConfig : GPBMessage

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
@property(nonatomic, readwrite) SENGVRecognitionThreshold livenessThreshold;

/** Information about how the video data will be compressed. */
@property(nonatomic, readwrite, strong, null_resettable) SENGCompressionConfiguration *compression;
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
 * Fetches the raw value of a @c SENGVCreateEnrollmentConfig's @c livenessThreshold property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENGVCreateEnrollmentConfig_LivenessThreshold_RawValue(SENGVCreateEnrollmentConfig *message);
/**
 * Sets the raw value of an @c SENGVCreateEnrollmentConfig's @c livenessThreshold property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENGVCreateEnrollmentConfig_LivenessThreshold_RawValue(SENGVCreateEnrollmentConfig *message, int32_t value);

#pragma mark - SENGVAuthenticateConfig

typedef GPB_ENUM(SENGVAuthenticateConfig_FieldNumber) {
  SENGVAuthenticateConfig_FieldNumber_EnrollmentId = 1,
  SENGVAuthenticateConfig_FieldNumber_EnrollmentGroupId = 2,
  SENGVAuthenticateConfig_FieldNumber_IsLivenessEnabled = 3,
  SENGVAuthenticateConfig_FieldNumber_LivenessThreshold = 4,
  SENGVAuthenticateConfig_FieldNumber_Compression = 5,
  SENGVAuthenticateConfig_FieldNumber_DoIncludeToken = 6,
  SENGVAuthenticateConfig_FieldNumber_EnrollmentToken = 7,
};

typedef GPB_ENUM(SENGVAuthenticateConfig_AuthId_OneOfCase) {
  SENGVAuthenticateConfig_AuthId_OneOfCase_GPBUnsetOneOfCase = 0,
  SENGVAuthenticateConfig_AuthId_OneOfCase_EnrollmentId = 1,
  SENGVAuthenticateConfig_AuthId_OneOfCase_EnrollmentGroupId = 2,
};

/**
 * Provides information for an image-based authentication
 **/
GPB_FINAL @interface SENGVAuthenticateConfig : GPBMessage

/** An identifier for what to authenticate against, either an individual enrollment or a group of enrollments */
@property(nonatomic, readonly) SENGVAuthenticateConfig_AuthId_OneOfCase authIdOneOfCase;

/** Unique identifier created at enrollment */
@property(nonatomic, readwrite, copy, null_resettable) NSString *enrollmentId;

/** Unique identifier for an enrollment group */
@property(nonatomic, readwrite, copy, null_resettable) NSString *enrollmentGroupId;

/** Enable a liveness check on the image, which will further improve the security of authentication at the expense of a slightly slower response. */
@property(nonatomic, readwrite) BOOL isLivenessEnabled;

/** The liveness threshold */
@property(nonatomic, readwrite) SENGVRecognitionThreshold livenessThreshold;

/** Information aobut how the video data will be compressed. */
@property(nonatomic, readwrite, strong, null_resettable) SENGCompressionConfiguration *compression;
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
 * Fetches the raw value of a @c SENGVAuthenticateConfig's @c livenessThreshold property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENGVAuthenticateConfig_LivenessThreshold_RawValue(SENGVAuthenticateConfig *message);
/**
 * Sets the raw value of an @c SENGVAuthenticateConfig's @c livenessThreshold property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENGVAuthenticateConfig_LivenessThreshold_RawValue(SENGVAuthenticateConfig *message, int32_t value);

/**
 * Clears whatever value was set for the oneof 'authId'.
 **/
void SENGVAuthenticateConfig_ClearAuthIdOneOfCase(SENGVAuthenticateConfig *message);

#pragma mark - SENGVValidateRecognitionConfig

typedef GPB_ENUM(SENGVValidateRecognitionConfig_FieldNumber) {
  SENGVValidateRecognitionConfig_FieldNumber_ModelName = 1,
  SENGVValidateRecognitionConfig_FieldNumber_UserId = 2,
  SENGVValidateRecognitionConfig_FieldNumber_Threshold = 3,
};

/**
 * Provides information for a video-based event recognition
 **/
GPB_FINAL @interface SENGVValidateRecognitionConfig : GPBMessage

/**
 * Name of model to validate against
 * Models can be retrieved from the GetModels() gRPC call
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSString *modelName;

/** The unique user Identifer */
@property(nonatomic, readwrite, copy, null_resettable) NSString *userId;

/** The model threshold */
@property(nonatomic, readwrite) SENGVRecognitionThreshold threshold;

@end

/**
 * Fetches the raw value of a @c SENGVValidateRecognitionConfig's @c threshold property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENGVValidateRecognitionConfig_Threshold_RawValue(SENGVValidateRecognitionConfig *message);
/**
 * Sets the raw value of an @c SENGVValidateRecognitionConfig's @c threshold property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENGVValidateRecognitionConfig_Threshold_RawValue(SENGVValidateRecognitionConfig *message, int32_t value);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
