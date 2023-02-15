// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: common/common.proto

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

@class SENCpuSummary;
@class SENMemorySummary;
@class SENServiceHealth;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum SENVoid

/** Generic NULL value */
typedef GPB_ENUM(SENVoid) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENVoid_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  SENVoid_VoidValue = 0,
};

GPBEnumDescriptor *SENVoid_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENVoid_IsValidValue(int32_t value);

#pragma mark - Enum SENKeyType

/**
 * A type of key supported by the API
 * Note: if you change this enum, ensure to update schema.prisma KeyType
 **/
typedef GPB_ENUM(SENKeyType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENKeyType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** General Public key - kept for backwards compatability */
  SENKeyType_PublicKey = 0,

  /** ED25519 Public key used for asymmetric cryptographic operations */
  SENKeyType_PublicKeyEd25519 = 1,

  /** Shared secret string */
  SENKeyType_SharedSecret = 3,

  /** AES-256 32 byte string */
  SENKeyType_Aes256 = 4,
};

GPBEnumDescriptor *SENKeyType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENKeyType_IsValidValue(int32_t value);

#pragma mark - Enum SENFeatureFlag

/**
 * Example ideas of possible FFs
 * Voice
 * VoiceBiometricTextDependent   FeatureFlag = iota // Voice Auth Text Dependent (Enrollable)
 * VoiceBiometricTextIndependent                    // Voice Auth Text Independent (Enrollable)
 * VoiceBiometricWakeword                           // Voice Wakeword (Enrollable)
 * VoiceEventWakeword                               // Voice Wakeword
 **/
typedef GPB_ENUM(SENFeatureFlag) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENFeatureFlag_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** TssvAll feature set */
  SENFeatureFlag_TssvAll = 0,

  /** TsAll feature set */
  SENFeatureFlag_TsAll = 1,

  /** TnlAll feature set */
  SENFeatureFlag_TnlAll = 2,
};

GPBEnumDescriptor *SENFeatureFlag_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENFeatureFlag_IsValidValue(int32_t value);

#pragma mark - Enum SENModelType

/**
 * A type of model supported by this API
 * Note: if you change this enum, ensure to update schema.prisma ModelType
 **/
typedef GPB_ENUM(SENModelType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENModelType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** Unknown Model Type */
  SENModelType_Unknown = 0,

  /** Voice Auth Text Independent (Enrollable) */
  SENModelType_VoiceBiometricTextIndependent = 1,

  /** Voice Wakeword (Enrollable) */
  SENModelType_VoiceBiometricWakeword = 2,

  /** Voice Wakeword */
  SENModelType_VoiceEventWakeword = 3,

  /** Voice Grammar Recognition such as LVCSR */
  SENModelType_VoiceTranscribeGrammar = 4,

  /** Voice Commands and Search recognition */
  SENModelType_VoiceTranscribeCommandAndSearch = 5,

  /** Voice activity detection */
  SENModelType_VoiceRecognitionActivityDetection = 6,

  /** Voice feature extractor */
  SENModelType_VoiceFeatureExtractor = 7,

  /** Voice digit recognizer for liveness */
  SENModelType_VoiceBiometricLivenessDigit = 8,

  /** Voice Auth Text Dependent (Enrollable) */
  SENModelType_VoiceBiometricTextDependent = 9,

  /** Voice Synthesis */
  SENModelType_VoiceSynthesis = 10,

  /** Sound Event Auth (Enrollable) */
  SENModelType_SoundEventEnrollable = 100,

  /** Sound Event Revalidation */
  SENModelType_SoundEventRevalidation = 101,

  /** Sound Event Recognition */
  SENModelType_SoundEventFixed = 102,

  /** Sound Scene Recognition */
  SENModelType_SoundSceneFixed = 103,

  /** Face Auth (Enrollable) */
  SENModelType_FaceBiometric = 201,

  /** Face Recognition */
  SENModelType_FaceRecognition = 202,

  /** Object Recognition */
  SENModelType_ObjectRecognition = 203,

  /** Image Transformation */
  SENModelType_ImageTransform = 204,
};

GPBEnumDescriptor *SENModelType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENModelType_IsValidValue(int32_t value);

#pragma mark - Enum SENTechnologyType

/** An enum denoting the type of Sensory technology employed */
typedef GPB_ENUM(SENTechnologyType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENTechnologyType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** Not Set type - used internally */
  SENTechnologyType_NotSet = 0,

  /** Truly Secure Speaker Verification, an audio authentication and wakeword tool */
  SENTechnologyType_Tssv = 1,

  /** Truly Secure, a face identification and liveness suite */
  SENTechnologyType_Ts = 2,

  /** Truly Natural, a wakeword and speech recognition tool */
  SENTechnologyType_Tnl = 3,

  /** Speech to Text, a large scale neural speech recognition tool */
  SENTechnologyType_Stt = 4,

  /** Text to Speech, a voice synthesis tool */
  SENTechnologyType_Tts = 5,
};

GPBEnumDescriptor *SENTechnologyType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENTechnologyType_IsValidValue(int32_t value);

#pragma mark - Enum SENCompressionType

/**
 * Every type of compression that is supported
 * Note: if you change this enum, ensure to update schema.prisma CompressionType
 **/
typedef GPB_ENUM(SENCompressionType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENCompressionType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** Image data is in grayscale instead of full color */
  SENCompressionType_ImageGrayscale = 0,
};

GPBEnumDescriptor *SENCompressionType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENCompressionType_IsValidValue(int32_t value);

#pragma mark - Enum SENClientType

/** Possible client types */
typedef GPB_ENUM(SENClientType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENClientType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** Invalid, not set role */
  SENClientType_Invalid = 0,

  /** User End Device       (E.G. Sensory SDK on Smartphone) */
  SENClientType_Device = 1,

  /** Remote Cluster        (E.G. Customer-Deployed Io Cluster) */
  SENClientType_Cluster = 2,

  /** User Account          (E.G. Customer-Portal) */
  SENClientType_User = 3,

  /** Super User Account    (E.G. Admin) */
  SENClientType_SuperUser = 4,

  /** Billing User Account   (E.G. CFO) */
  SENClientType_BillingUser = 5,

  /** Read-Only Account */
  SENClientType_ReadOnlyUser = 6,

  /** Sensory Root Token */
  SENClientType_Root = 100,
};

GPBEnumDescriptor *SENClientType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENClientType_IsValidValue(int32_t value);

#pragma mark - Enum SENUsageEventType

/**
 * Possible usage event type
 * Note: if you change this enum, ensure to update schema.prisma EventType
 **/
typedef GPB_ENUM(SENUsageEventType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENUsageEventType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** Authentication usage event */
  SENUsageEventType_Authentication = 0,

  /** Recognition usage event */
  SENUsageEventType_Recognition = 1,

  /** Enrollment usage event */
  SENUsageEventType_Enrollment = 2,

  /** Synthesis usage event */
  SENUsageEventType_Synthesis = 3,

  /** Speech to text usage event */
  SENUsageEventType_Transcription = 4,
};

GPBEnumDescriptor *SENUsageEventType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENUsageEventType_IsValidValue(int32_t value);

#pragma mark - Enum SENServerType

/** Possible types of servers */
typedef GPB_ENUM(SENServerType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENServerType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  SENServerType_Titan = 0,
  SENServerType_Io = 1,
};

GPBEnumDescriptor *SENServerType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENServerType_IsValidValue(int32_t value);

#pragma mark - SENCommonRoot

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
GPB_FINAL @interface SENCommonRoot : GPBRootObject
@end

#pragma mark - SENCompressionConfiguration

typedef GPB_ENUM(SENCompressionConfiguration_FieldNumber) {
  SENCompressionConfiguration_FieldNumber_CompressionsArray = 1,
};

/**
 * Configuration for how data can be compressed
 **/
GPB_FINAL @interface SENCompressionConfiguration : GPBMessage

/** List of every compression method that was used */
// |compressionsArray| contains |SENCompressionType|
@property(nonatomic, readwrite, strong, null_resettable) GPBEnumArray *compressionsArray;
/** The number of items in @c compressionsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger compressionsArray_Count;

@end

#pragma mark - SENTokenResponse

typedef GPB_ENUM(SENTokenResponse_FieldNumber) {
  SENTokenResponse_FieldNumber_AccessToken = 1,
  SENTokenResponse_FieldNumber_ExpiresIn = 2,
  SENTokenResponse_FieldNumber_KeyId = 3,
  SENTokenResponse_FieldNumber_TokenType = 4,
};

/**
 * Response from a successful token request
 **/
GPB_FINAL @interface SENTokenResponse : GPBMessage

/** Signed JSON web token that should be added to any subsequent request */
@property(nonatomic, readwrite, copy, null_resettable) NSString *accessToken;

/** Number of seconds until this token will expire */
@property(nonatomic, readwrite) int32_t expiresIn;

/** Signing key identifier which can be used to retrieve the matching public key via the GetPublicKey request */
@property(nonatomic, readwrite, copy, null_resettable) NSString *keyId;

/** Token type */
@property(nonatomic, readwrite, copy, null_resettable) NSString *tokenType;

@end

#pragma mark - SENServiceHealth

typedef GPB_ENUM(SENServiceHealth_FieldNumber) {
  SENServiceHealth_FieldNumber_IsHealthy = 1,
  SENServiceHealth_FieldNumber_Name = 2,
  SENServiceHealth_FieldNumber_Message = 3,
};

/**
 * An indication of the health of a particular service
 **/
GPB_FINAL @interface SENServiceHealth : GPBMessage

/** Is healthy indication */
@property(nonatomic, readwrite) BOOL isHealthy;

/** Name of the service */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** Details of the service health */
@property(nonatomic, readwrite, copy, null_resettable) NSString *message;

@end

#pragma mark - SENServerHealthResponse

typedef GPB_ENUM(SENServerHealthResponse_FieldNumber) {
  SENServerHealthResponse_FieldNumber_IsHealthy = 1,
  SENServerHealthResponse_FieldNumber_ServerVersion = 2,
  SENServerHealthResponse_FieldNumber_Id_p = 3,
  SENServerHealthResponse_FieldNumber_ServicesArray = 4,
  SENServerHealthResponse_FieldNumber_ServerType = 5,
  SENServerHealthResponse_FieldNumber_IsLeader = 6,
};

/**
 * Response from a GetHealth request
 **/
GPB_FINAL @interface SENServerHealthResponse : GPBMessage

/** Is healthy indication. True if all services are healthy. */
@property(nonatomic, readwrite) BOOL isHealthy;

/** Currently running server version */
@property(nonatomic, readwrite, copy, null_resettable) NSString *serverVersion;

/** Unique Identifier for the particular server */
@property(nonatomic, readwrite, copy, null_resettable) NSString *id_p;

/** List of services and their health statuses */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<SENServiceHealth*> *servicesArray;
/** The number of items in @c servicesArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger servicesArray_Count;

/** The type of server that is sending the health response */
@property(nonatomic, readwrite) SENServerType serverType;

@property(nonatomic, readwrite) BOOL isLeader;

@end

/**
 * Fetches the raw value of a @c SENServerHealthResponse's @c serverType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENServerHealthResponse_ServerType_RawValue(SENServerHealthResponse *message);
/**
 * Sets the raw value of an @c SENServerHealthResponse's @c serverType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENServerHealthResponse_ServerType_RawValue(SENServerHealthResponse *message, int32_t value);

#pragma mark - SENSystemSummary

typedef GPB_ENUM(SENSystemSummary_FieldNumber) {
  SENSystemSummary_FieldNumber_Cpu = 1,
  SENSystemSummary_FieldNumber_Memory = 2,
};

/**
 * A summary of system statistics
 **/
GPB_FINAL @interface SENSystemSummary : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) SENCpuSummary *cpu;
/** Test to see if @c cpu has been set. */
@property(nonatomic, readwrite) BOOL hasCpu;

@property(nonatomic, readwrite, strong, null_resettable) SENMemorySummary *memory;
/** Test to see if @c memory has been set. */
@property(nonatomic, readwrite) BOOL hasMemory;

@end

#pragma mark - SENCpuSummary

typedef GPB_ENUM(SENCpuSummary_FieldNumber) {
  SENCpuSummary_FieldNumber_User = 1,
  SENCpuSummary_FieldNumber_Nice = 2,
  SENCpuSummary_FieldNumber_System = 3,
  SENCpuSummary_FieldNumber_Idle = 4,
  SENCpuSummary_FieldNumber_IoWait = 5,
  SENCpuSummary_FieldNumber_Irq = 6,
  SENCpuSummary_FieldNumber_SoftIrq = 7,
  SENCpuSummary_FieldNumber_Steal = 8,
  SENCpuSummary_FieldNumber_Guest = 9,
  SENCpuSummary_FieldNumber_GuestNice = 10,
};

/**
 * Summary of all CPU useage as measured in ticks
 **/
GPB_FINAL @interface SENCpuSummary : GPBMessage

/** normal processes executing in user mode */
@property(nonatomic, readwrite) uint64_t user;

/** niced processes executing in user mode */
@property(nonatomic, readwrite) uint64_t nice;

/** processes executing in kernel mode */
@property(nonatomic, readwrite) uint64_t system;

/** idle cpu */
@property(nonatomic, readwrite) uint64_t idle;

/** waiting for I/O to complete */
@property(nonatomic, readwrite) uint64_t ioWait;

/** servicing interrupts */
@property(nonatomic, readwrite) uint64_t irq;

/** servicing softirqs */
@property(nonatomic, readwrite) uint64_t softIrq;

/** counts the ticks spent executing other virtual hosts */
@property(nonatomic, readwrite) uint64_t steal;

/** counts the time spent running a virtual CPU for guest operating systems under the control of the Linux kernel */
@property(nonatomic, readwrite) uint64_t guest;

/** time spent running a niced guest */
@property(nonatomic, readwrite) uint64_t guestNice;

@end

#pragma mark - SENMemorySummary

typedef GPB_ENUM(SENMemorySummary_FieldNumber) {
  SENMemorySummary_FieldNumber_MemTotal = 1,
  SENMemorySummary_FieldNumber_MemFree = 2,
  SENMemorySummary_FieldNumber_MemAvailable = 3,
};

/**
 * A summary of memory usage
 **/
GPB_FINAL @interface SENMemorySummary : GPBMessage

/** total memory in use */
@property(nonatomic, readwrite) uint64_t memTotal;

/** total memory free */
@property(nonatomic, readwrite) uint64_t memFree;

/** total memory available by the system */
@property(nonatomic, readwrite) uint64_t memAvailable;

@end

#pragma mark - SENGenericClient

typedef GPB_ENUM(SENGenericClient_FieldNumber) {
  SENGenericClient_FieldNumber_ClientId = 1,
  SENGenericClient_FieldNumber_Secret = 2,
};

/**
 * Request to create a generic client. Client type should be inferred by usage.
 * This data should be stored securely on the client endpoint.
 **/
GPB_FINAL @interface SENGenericClient : GPBMessage

/** Unique Client ID as UUID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *clientId;

/** Strong secret value (min length of 10) */
@property(nonatomic, readwrite, copy, null_resettable) NSString *secret;

@end

#pragma mark - SENTenantResponse

typedef GPB_ENUM(SENTenantResponse_FieldNumber) {
  SENTenantResponse_FieldNumber_Id_p = 1,
  SENTenantResponse_FieldNumber_Name = 2,
  SENTenantResponse_FieldNumber_CreatedAt = 3,
  SENTenantResponse_FieldNumber_UpdatedAt = 4,
};

/**
 * Tenant response
 **/
GPB_FINAL @interface SENTenantResponse : GPBMessage

/** The unique uuid for this tenant */
@property(nonatomic, readwrite, copy, null_resettable) NSString *id_p;

/** The unique name for this tenant */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** Created timestamp */
@property(nonatomic, readwrite, strong, null_resettable) GPBTimestamp *createdAt;
/** Test to see if @c createdAt has been set. */
@property(nonatomic, readwrite) BOOL hasCreatedAt;

/** Last updated timestamp */
@property(nonatomic, readwrite, strong, null_resettable) GPBTimestamp *updatedAt;
/** Test to see if @c updatedAt has been set. */
@property(nonatomic, readwrite) BOOL hasUpdatedAt;

@end

#pragma mark - SENPaginationOptions

typedef GPB_ENUM(SENPaginationOptions_FieldNumber) {
  SENPaginationOptions_FieldNumber_Ordering = 1,
  SENPaginationOptions_FieldNumber_Decending = 2,
  SENPaginationOptions_FieldNumber_PageIndex = 3,
  SENPaginationOptions_FieldNumber_PageSize = 4,
};

/**
 * A message for telling the server how to paginate and order data
 **/
GPB_FINAL @interface SENPaginationOptions : GPBMessage

/** The parameter to order the data by. If empty, the server will choose a default ordering */
@property(nonatomic, readwrite, copy, null_resettable) NSString *ordering;

/** If "True" the data will be sorted in decending order */
@property(nonatomic, readwrite) BOOL decending;

/** The page index to return */
@property(nonatomic, readwrite) int32_t pageIndex;

/**
 * The preferred number of elements per page. If zero the server will choose a default size
 * The server enforces a maximum page size of 100
 **/
@property(nonatomic, readwrite) int32_t pageSize;

@end

#pragma mark - SENPaginationResponse

typedef GPB_ENUM(SENPaginationResponse_FieldNumber) {
  SENPaginationResponse_FieldNumber_Ordering = 1,
  SENPaginationResponse_FieldNumber_Decending = 2,
  SENPaginationResponse_FieldNumber_PossibleOrderingsArray = 3,
  SENPaginationResponse_FieldNumber_TotalCount = 4,
  SENPaginationResponse_FieldNumber_PageSize = 5,
  SENPaginationResponse_FieldNumber_PrevPageIndex = 6,
  SENPaginationResponse_FieldNumber_CurrentPageIndex = 7,
  SENPaginationResponse_FieldNumber_NextPageIndex = 8,
};

/**
 * A message for the server to tell how the data has been paginated
 **/
GPB_FINAL @interface SENPaginationResponse : GPBMessage

/** The parameter by which the data has been ordered by */
@property(nonatomic, readwrite, copy, null_resettable) NSString *ordering;

/** "True" if the data has been sorted in decending order */
@property(nonatomic, readwrite) BOOL decending;

/** A list of all possible parameters that the data can be ordered by */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<NSString*> *possibleOrderingsArray;
/** The number of items in @c possibleOrderingsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger possibleOrderingsArray_Count;

/** The total count of data objects */
@property(nonatomic, readwrite) int64_t totalCount;

/** The page size of the data */
@property(nonatomic, readwrite) int32_t pageSize;

/** The page index for the previous page. If negative there is no previous page */
@property(nonatomic, readwrite) int32_t prevPageIndex;

/** The page index for the current page. */
@property(nonatomic, readwrite) int32_t currentPageIndex;

/** The page index for the next page. If negative there is no next page */
@property(nonatomic, readwrite) int32_t nextPageIndex;

@end

#pragma mark - SENEnrollmentToken

typedef GPB_ENUM(SENEnrollmentToken_FieldNumber) {
  SENEnrollmentToken_FieldNumber_Token = 1,
  SENEnrollmentToken_FieldNumber_Expiration = 2,
};

/**
 * A message with an encrypted enrollment token and a token expiration date
 **/
GPB_FINAL @interface SENEnrollmentToken : GPBMessage

/** Encrypted token containing enrollment information */
@property(nonatomic, readwrite, copy, null_resettable) NSData *token;

/**
 * The number of seconds until the enrollment token expires
 * An expiration of 0 means that the enrollment token never expires
 **/
@property(nonatomic, readwrite) int64_t expiration;

@end

#pragma mark - SENCreateKeyRequest

typedef GPB_ENUM(SENCreateKeyRequest_FieldNumber) {
  SENCreateKeyRequest_FieldNumber_Name = 1,
  SENCreateKeyRequest_FieldNumber_KeyType = 2,
  SENCreateKeyRequest_FieldNumber_Value = 3,
  SENCreateKeyRequest_FieldNumber_Expiration = 4,
};

/**
 * Response to a key request. Holds a byte array representing the key value.
 * Also should we add a "userCreated" boolean or enum to the keys?
 **/
GPB_FINAL @interface SENCreateKeyRequest : GPBMessage

/** The name you'd like to associate with this key */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** The key type */
@property(nonatomic, readwrite) SENKeyType keyType;

/** The value of the key as a string */
@property(nonatomic, readwrite, copy, null_resettable) NSString *value;

/** Optional seconds until this key expires */
@property(nonatomic, readwrite) int64_t expiration;

@end

/**
 * Fetches the raw value of a @c SENCreateKeyRequest's @c keyType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENCreateKeyRequest_KeyType_RawValue(SENCreateKeyRequest *message);
/**
 * Sets the raw value of an @c SENCreateKeyRequest's @c keyType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENCreateKeyRequest_KeyType_RawValue(SENCreateKeyRequest *message, int32_t value);

#pragma mark - SENKeyResponse

typedef GPB_ENUM(SENKeyResponse_FieldNumber) {
  SENKeyResponse_FieldNumber_Id_p = 1,
  SENKeyResponse_FieldNumber_Name = 2,
  SENKeyResponse_FieldNumber_KeyType = 3,
  SENKeyResponse_FieldNumber_Expiration = 4,
  SENKeyResponse_FieldNumber_TenantId = 5,
  SENKeyResponse_FieldNumber_Disabled = 6,
};

/**
 * Response to a key request. Holds a byte array representing the key value.
 **/
GPB_FINAL @interface SENKeyResponse : GPBMessage

/** The the uuid associated with this key */
@property(nonatomic, readwrite, copy, null_resettable) NSString *id_p;

/** The name associated with this key */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** The key type */
@property(nonatomic, readwrite) SENKeyType keyType;

/**
 * Optional seconds until this key expires.
 * If this value is 0, this key will never expire
 **/
@property(nonatomic, readwrite) int64_t expiration;

/** TenantId for this key */
@property(nonatomic, readwrite, copy, null_resettable) NSString *tenantId;

/** Indicates if this key is disabled */
@property(nonatomic, readwrite) BOOL disabled;

@end

/**
 * Fetches the raw value of a @c SENKeyResponse's @c keyType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENKeyResponse_KeyType_RawValue(SENKeyResponse *message);
/**
 * Sets the raw value of an @c SENKeyResponse's @c keyType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENKeyResponse_KeyType_RawValue(SENKeyResponse *message, int32_t value);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
