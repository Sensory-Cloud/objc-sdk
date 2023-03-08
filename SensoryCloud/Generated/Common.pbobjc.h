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

@class SENGCpuSummary;
@class SENGMemorySummary;
@class SENGServiceHealth;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum SENGVoid

/** Generic NULL value */
typedef GPB_ENUM(SENGVoid) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENGVoid_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  SENGVoid_VoidValue = 0,
};

GPBEnumDescriptor *SENGVoid_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENGVoid_IsValidValue(int32_t value);

#pragma mark - Enum SENGKeyType

/**
 * A type of key supported by the API
 * Note: if you change this enum, ensure to update schema.prisma KeyType
 **/
typedef GPB_ENUM(SENGKeyType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENGKeyType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** General Public key - kept for backwards compatability */
  SENGKeyType_PublicKey = 0,

  /** ED25519 Public key used for asymmetric cryptographic operations */
  SENGKeyType_PublicKeyEd25519 = 1,

  /** Shared secret string */
  SENGKeyType_SharedSecret = 3,

  /** AES-256 32 byte string */
  SENGKeyType_Aes256 = 4,
};

GPBEnumDescriptor *SENGKeyType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENGKeyType_IsValidValue(int32_t value);

#pragma mark - Enum SENGFeatureFlag

/**
 * Example ideas of possible FFs
 * Voice
 * VoiceBiometricTextDependent   FeatureFlag = iota // Voice Auth Text Dependent (Enrollable)
 * VoiceBiometricTextIndependent                    // Voice Auth Text Independent (Enrollable)
 * VoiceBiometricWakeword                           // Voice Wakeword (Enrollable)
 * VoiceEventWakeword                               // Voice Wakeword
 **/
typedef GPB_ENUM(SENGFeatureFlag) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENGFeatureFlag_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** TssvAll feature set */
  SENGFeatureFlag_TssvAll = 0,

  /** TsAll feature set */
  SENGFeatureFlag_TsAll = 1,

  /** TnlAll feature set */
  SENGFeatureFlag_TnlAll = 2,
};

GPBEnumDescriptor *SENGFeatureFlag_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENGFeatureFlag_IsValidValue(int32_t value);

#pragma mark - Enum SENGModelType

/**
 * A type of model supported by this API
 * Note: if you change this enum, ensure to update schema.prisma ModelType
 **/
typedef GPB_ENUM(SENGModelType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENGModelType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** Unknown Model Type */
  SENGModelType_Unknown = 0,

  /** Voice Auth Text Independent (Enrollable) */
  SENGModelType_VoiceBiometricTextIndependent = 1,

  /** Voice Wakeword (Enrollable) */
  SENGModelType_VoiceBiometricWakeword = 2,

  /** Voice Wakeword */
  SENGModelType_VoiceEventWakeword = 3,

  /** Voice Grammar Recognition such as LVCSR */
  SENGModelType_VoiceTranscribeGrammar = 4,

  /** Voice Commands and Search recognition */
  SENGModelType_VoiceTranscribeCommandAndSearch = 5,

  /** Voice activity detection */
  SENGModelType_VoiceRecognitionActivityDetection = 6,

  /** Voice feature extractor */
  SENGModelType_VoiceFeatureExtractor = 7,

  /** Voice digit recognizer for liveness */
  SENGModelType_VoiceBiometricLivenessDigit = 8,

  /** Voice Auth Text Dependent (Enrollable) */
  SENGModelType_VoiceBiometricTextDependent = 9,

  /** Voice Synthesis */
  SENGModelType_VoiceSynthesis = 10,

  /** Sound Event Auth (Enrollable) */
  SENGModelType_SoundEventEnrollable = 100,

  /** Sound Event Revalidation */
  SENGModelType_SoundEventRevalidation = 101,

  /** Sound Event Recognition */
  SENGModelType_SoundEventFixed = 102,

  /** Sound Scene Recognition */
  SENGModelType_SoundSceneFixed = 103,

  /** Face Auth (Enrollable) */
  SENGModelType_FaceBiometric = 201,

  /** Face Recognition */
  SENGModelType_FaceRecognition = 202,

  /** Object Recognition */
  SENGModelType_ObjectRecognition = 203,

  /** Image Transformation */
  SENGModelType_ImageTransform = 204,
};

GPBEnumDescriptor *SENGModelType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENGModelType_IsValidValue(int32_t value);

#pragma mark - Enum SENGTechnologyType

/** An enum denoting the type of Sensory technology employed */
typedef GPB_ENUM(SENGTechnologyType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENGTechnologyType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** Not Set type - used internally */
  SENGTechnologyType_NotSet = 0,

  /** Truly Secure Speaker Verification, an audio authentication and wakeword tool */
  SENGTechnologyType_Tssv = 1,

  /** Truly Secure, a face identification and liveness suite */
  SENGTechnologyType_Ts = 2,

  /** Truly Natural, a wakeword and speech recognition tool */
  SENGTechnologyType_Tnl = 3,

  /** Speech to Text, a large scale neural speech recognition tool */
  SENGTechnologyType_Stt = 4,

  /** Text to Speech, a voice synthesis tool */
  SENGTechnologyType_Tts = 5,
};

GPBEnumDescriptor *SENGTechnologyType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENGTechnologyType_IsValidValue(int32_t value);

#pragma mark - Enum SENGCompressionType

/**
 * Every type of compression that is supported
 * Note: if you change this enum, ensure to update schema.prisma CompressionType
 **/
typedef GPB_ENUM(SENGCompressionType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENGCompressionType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** Image data is in grayscale instead of full color */
  SENGCompressionType_ImageGrayscale = 0,
};

GPBEnumDescriptor *SENGCompressionType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENGCompressionType_IsValidValue(int32_t value);

#pragma mark - Enum SENGClientType

/** Possible client types */
typedef GPB_ENUM(SENGClientType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENGClientType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** Invalid, not set role */
  SENGClientType_Invalid = 0,

  /** User End Device       (E.G. Sensory SDK on Smartphone) */
  SENGClientType_Device = 1,

  /** Remote Cluster        (E.G. Customer-Deployed Io Cluster) */
  SENGClientType_Cluster = 2,

  /** User Account          (E.G. Customer-Portal) */
  SENGClientType_User = 3,

  /** Super User Account    (E.G. Admin) */
  SENGClientType_SuperUser = 4,

  /** Billing User Account   (E.G. CFO) */
  SENGClientType_BillingUser = 5,

  /** Read-Only Account */
  SENGClientType_ReadOnlyUser = 6,

  /** Sensory Root Token */
  SENGClientType_Root = 100,
};

GPBEnumDescriptor *SENGClientType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENGClientType_IsValidValue(int32_t value);

#pragma mark - Enum SENGUsageEventType

/**
 * Possible usage event type
 * Note: if you change this enum, ensure to update schema.prisma EventType
 **/
typedef GPB_ENUM(SENGUsageEventType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENGUsageEventType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** Authentication usage event */
  SENGUsageEventType_Authentication = 0,

  /** Recognition usage event */
  SENGUsageEventType_Recognition = 1,

  /** Enrollment usage event */
  SENGUsageEventType_Enrollment = 2,

  /** Synthesis usage event */
  SENGUsageEventType_Synthesis = 3,

  /** Speech to text usage event */
  SENGUsageEventType_Transcription = 4,
};

GPBEnumDescriptor *SENGUsageEventType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENGUsageEventType_IsValidValue(int32_t value);

#pragma mark - Enum SENGServerType

/** Possible types of servers */
typedef GPB_ENUM(SENGServerType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  SENGServerType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  SENGServerType_Titan = 0,
  SENGServerType_Io = 1,
};

GPBEnumDescriptor *SENGServerType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL SENGServerType_IsValidValue(int32_t value);

#pragma mark - SENGCommonRoot

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
GPB_FINAL @interface SENGCommonRoot : GPBRootObject
@end

#pragma mark - SENGCompressionConfiguration

typedef GPB_ENUM(SENGCompressionConfiguration_FieldNumber) {
  SENGCompressionConfiguration_FieldNumber_CompressionsArray = 1,
};

/**
 * Configuration for how data can be compressed
 **/
GPB_FINAL @interface SENGCompressionConfiguration : GPBMessage

/** List of every compression method that was used */
// |compressionsArray| contains |SENGCompressionType|
@property(nonatomic, readwrite, strong, null_resettable) GPBEnumArray *compressionsArray;
/** The number of items in @c compressionsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger compressionsArray_Count;

@end

#pragma mark - SENGTokenResponse

typedef GPB_ENUM(SENGTokenResponse_FieldNumber) {
  SENGTokenResponse_FieldNumber_AccessToken = 1,
  SENGTokenResponse_FieldNumber_ExpiresIn = 2,
  SENGTokenResponse_FieldNumber_KeyId = 3,
  SENGTokenResponse_FieldNumber_TokenType = 4,
};

/**
 * Response from a successful token request
 **/
GPB_FINAL @interface SENGTokenResponse : GPBMessage

/** Signed JSON web token that should be added to any subsequent request */
@property(nonatomic, readwrite, copy, null_resettable) NSString *accessToken;

/** Number of seconds until this token will expire */
@property(nonatomic, readwrite) int32_t expiresIn;

/** Signing key identifier which can be used to retrieve the matching public key via the GetPublicKey request */
@property(nonatomic, readwrite, copy, null_resettable) NSString *keyId;

/** Token type */
@property(nonatomic, readwrite, copy, null_resettable) NSString *tokenType;

@end

#pragma mark - SENGServiceHealth

typedef GPB_ENUM(SENGServiceHealth_FieldNumber) {
  SENGServiceHealth_FieldNumber_IsHealthy = 1,
  SENGServiceHealth_FieldNumber_Name = 2,
  SENGServiceHealth_FieldNumber_Message = 3,
};

/**
 * An indication of the health of a particular service
 **/
GPB_FINAL @interface SENGServiceHealth : GPBMessage

/** Is healthy indication */
@property(nonatomic, readwrite) BOOL isHealthy;

/** Name of the service */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** Details of the service health */
@property(nonatomic, readwrite, copy, null_resettable) NSString *message;

@end

#pragma mark - SENGServerHealthResponse

typedef GPB_ENUM(SENGServerHealthResponse_FieldNumber) {
  SENGServerHealthResponse_FieldNumber_IsHealthy = 1,
  SENGServerHealthResponse_FieldNumber_ServerVersion = 2,
  SENGServerHealthResponse_FieldNumber_Id_p = 3,
  SENGServerHealthResponse_FieldNumber_ServicesArray = 4,
  SENGServerHealthResponse_FieldNumber_ServerType = 5,
  SENGServerHealthResponse_FieldNumber_IsLeader = 6,
};

/**
 * Response from a GetHealth request
 **/
GPB_FINAL @interface SENGServerHealthResponse : GPBMessage

/** Is healthy indication. True if all services are healthy. */
@property(nonatomic, readwrite) BOOL isHealthy;

/** Currently running server version */
@property(nonatomic, readwrite, copy, null_resettable) NSString *serverVersion;

/** Unique Identifier for the particular server */
@property(nonatomic, readwrite, copy, null_resettable) NSString *id_p;

/** List of services and their health statuses */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<SENGServiceHealth*> *servicesArray;
/** The number of items in @c servicesArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger servicesArray_Count;

/** The type of server that is sending the health response */
@property(nonatomic, readwrite) SENGServerType serverType;

@property(nonatomic, readwrite) BOOL isLeader;

@end

/**
 * Fetches the raw value of a @c SENGServerHealthResponse's @c serverType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENGServerHealthResponse_ServerType_RawValue(SENGServerHealthResponse *message);
/**
 * Sets the raw value of an @c SENGServerHealthResponse's @c serverType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENGServerHealthResponse_ServerType_RawValue(SENGServerHealthResponse *message, int32_t value);

#pragma mark - SENGSystemSummary

typedef GPB_ENUM(SENGSystemSummary_FieldNumber) {
  SENGSystemSummary_FieldNumber_Cpu = 1,
  SENGSystemSummary_FieldNumber_Memory = 2,
};

/**
 * A summary of system statistics
 **/
GPB_FINAL @interface SENGSystemSummary : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) SENGCpuSummary *cpu;
/** Test to see if @c cpu has been set. */
@property(nonatomic, readwrite) BOOL hasCpu;

@property(nonatomic, readwrite, strong, null_resettable) SENGMemorySummary *memory;
/** Test to see if @c memory has been set. */
@property(nonatomic, readwrite) BOOL hasMemory;

@end

#pragma mark - SENGCpuSummary

typedef GPB_ENUM(SENGCpuSummary_FieldNumber) {
  SENGCpuSummary_FieldNumber_User = 1,
  SENGCpuSummary_FieldNumber_Nice = 2,
  SENGCpuSummary_FieldNumber_System = 3,
  SENGCpuSummary_FieldNumber_Idle = 4,
  SENGCpuSummary_FieldNumber_IoWait = 5,
  SENGCpuSummary_FieldNumber_Irq = 6,
  SENGCpuSummary_FieldNumber_SoftIrq = 7,
  SENGCpuSummary_FieldNumber_Steal = 8,
  SENGCpuSummary_FieldNumber_Guest = 9,
  SENGCpuSummary_FieldNumber_GuestNice = 10,
};

/**
 * Summary of all CPU useage as measured in ticks
 **/
GPB_FINAL @interface SENGCpuSummary : GPBMessage

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

#pragma mark - SENGMemorySummary

typedef GPB_ENUM(SENGMemorySummary_FieldNumber) {
  SENGMemorySummary_FieldNumber_MemTotal = 1,
  SENGMemorySummary_FieldNumber_MemFree = 2,
  SENGMemorySummary_FieldNumber_MemAvailable = 3,
};

/**
 * A summary of memory usage
 **/
GPB_FINAL @interface SENGMemorySummary : GPBMessage

/** total memory in use */
@property(nonatomic, readwrite) uint64_t memTotal;

/** total memory free */
@property(nonatomic, readwrite) uint64_t memFree;

/** total memory available by the system */
@property(nonatomic, readwrite) uint64_t memAvailable;

@end

#pragma mark - SENGGenericClient

typedef GPB_ENUM(SENGGenericClient_FieldNumber) {
  SENGGenericClient_FieldNumber_ClientId = 1,
  SENGGenericClient_FieldNumber_Secret = 2,
};

/**
 * Request to create a generic client. Client type should be inferred by usage.
 * This data should be stored securely on the client endpoint.
 **/
GPB_FINAL @interface SENGGenericClient : GPBMessage

/** Unique Client ID as UUID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *clientId;

/** Strong secret value (min length of 10) */
@property(nonatomic, readwrite, copy, null_resettable) NSString *secret;

@end

#pragma mark - SENGTenantResponse

typedef GPB_ENUM(SENGTenantResponse_FieldNumber) {
  SENGTenantResponse_FieldNumber_Id_p = 1,
  SENGTenantResponse_FieldNumber_Name = 2,
  SENGTenantResponse_FieldNumber_CreatedAt = 3,
  SENGTenantResponse_FieldNumber_UpdatedAt = 4,
};

/**
 * Tenant response
 **/
GPB_FINAL @interface SENGTenantResponse : GPBMessage

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

#pragma mark - SENGPaginationOptions

typedef GPB_ENUM(SENGPaginationOptions_FieldNumber) {
  SENGPaginationOptions_FieldNumber_Ordering = 1,
  SENGPaginationOptions_FieldNumber_Decending = 2,
  SENGPaginationOptions_FieldNumber_PageIndex = 3,
  SENGPaginationOptions_FieldNumber_PageSize = 4,
};

/**
 * A message for telling the server how to paginate and order data
 **/
GPB_FINAL @interface SENGPaginationOptions : GPBMessage

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

#pragma mark - SENGPaginationResponse

typedef GPB_ENUM(SENGPaginationResponse_FieldNumber) {
  SENGPaginationResponse_FieldNumber_Ordering = 1,
  SENGPaginationResponse_FieldNumber_Decending = 2,
  SENGPaginationResponse_FieldNumber_PossibleOrderingsArray = 3,
  SENGPaginationResponse_FieldNumber_TotalCount = 4,
  SENGPaginationResponse_FieldNumber_PageSize = 5,
  SENGPaginationResponse_FieldNumber_PrevPageIndex = 6,
  SENGPaginationResponse_FieldNumber_CurrentPageIndex = 7,
  SENGPaginationResponse_FieldNumber_NextPageIndex = 8,
};

/**
 * A message for the server to tell how the data has been paginated
 **/
GPB_FINAL @interface SENGPaginationResponse : GPBMessage

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

#pragma mark - SENGEnrollmentToken

typedef GPB_ENUM(SENGEnrollmentToken_FieldNumber) {
  SENGEnrollmentToken_FieldNumber_Token = 1,
  SENGEnrollmentToken_FieldNumber_Expiration = 2,
};

/**
 * A message with an encrypted enrollment token and a token expiration date
 **/
GPB_FINAL @interface SENGEnrollmentToken : GPBMessage

/** Encrypted token containing enrollment information */
@property(nonatomic, readwrite, copy, null_resettable) NSData *token;

/**
 * The number of seconds until the enrollment token expires
 * An expiration of 0 means that the enrollment token never expires
 **/
@property(nonatomic, readwrite) int64_t expiration;

@end

#pragma mark - SENGCreateKeyRequest

typedef GPB_ENUM(SENGCreateKeyRequest_FieldNumber) {
  SENGCreateKeyRequest_FieldNumber_Name = 1,
  SENGCreateKeyRequest_FieldNumber_KeyType = 2,
  SENGCreateKeyRequest_FieldNumber_Value = 3,
  SENGCreateKeyRequest_FieldNumber_Expiration = 4,
};

/**
 * Response to a key request. Holds a byte array representing the key value.
 * Also should we add a "userCreated" boolean or enum to the keys?
 **/
GPB_FINAL @interface SENGCreateKeyRequest : GPBMessage

/** The name you'd like to associate with this key */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** The key type */
@property(nonatomic, readwrite) SENGKeyType keyType;

/** The value of the key as a string */
@property(nonatomic, readwrite, copy, null_resettable) NSString *value;

/** Optional seconds until this key expires */
@property(nonatomic, readwrite) int64_t expiration;

@end

/**
 * Fetches the raw value of a @c SENGCreateKeyRequest's @c keyType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENGCreateKeyRequest_KeyType_RawValue(SENGCreateKeyRequest *message);
/**
 * Sets the raw value of an @c SENGCreateKeyRequest's @c keyType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENGCreateKeyRequest_KeyType_RawValue(SENGCreateKeyRequest *message, int32_t value);

#pragma mark - SENGKeyResponse

typedef GPB_ENUM(SENGKeyResponse_FieldNumber) {
  SENGKeyResponse_FieldNumber_Id_p = 1,
  SENGKeyResponse_FieldNumber_Name = 2,
  SENGKeyResponse_FieldNumber_KeyType = 3,
  SENGKeyResponse_FieldNumber_Expiration = 4,
  SENGKeyResponse_FieldNumber_TenantId = 5,
  SENGKeyResponse_FieldNumber_Disabled = 6,
};

/**
 * Response to a key request. Holds a byte array representing the key value.
 **/
GPB_FINAL @interface SENGKeyResponse : GPBMessage

/** The the uuid associated with this key */
@property(nonatomic, readwrite, copy, null_resettable) NSString *id_p;

/** The name associated with this key */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** The key type */
@property(nonatomic, readwrite) SENGKeyType keyType;

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
 * Fetches the raw value of a @c SENGKeyResponse's @c keyType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t SENGKeyResponse_KeyType_RawValue(SENGKeyResponse *message);
/**
 * Sets the raw value of an @c SENGKeyResponse's @c keyType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetSENGKeyResponse_KeyType_RawValue(SENGKeyResponse *message, int32_t value);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)