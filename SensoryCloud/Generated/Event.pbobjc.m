// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: v1/event/event.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import "Event.pbobjc.h"
#import "Validate.pbobjc.h"
#import "Common.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdollar-in-identifier-extension"

#pragma mark - Objective C Class declarations
// Forward declarations of Objective C classes that we can use as
// static values in struct initializers.
// We don't use [Foo class] because it is not a static value.
GPBObjCClassDeclaration(GPBTimestamp);
GPBObjCClassDeclaration(SENGPaginationOptions);
GPBObjCClassDeclaration(SENGPaginationResponse);
GPBObjCClassDeclaration(SENGUsageEvent);
GPBObjCClassDeclaration(SENGUsageEventModelSummary);
GPBObjCClassDeclaration(SENGUsageEventResponse);

#pragma mark - SENGEventRoot

@implementation SENGEventRoot

+ (GPBExtensionRegistry*)extensionRegistry {
  // This is called by +initialize so there is no need to worry
  // about thread safety and initialization of registry.
  static GPBExtensionRegistry* registry = nil;
  if (!registry) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    registry = [[GPBExtensionRegistry alloc] init];
    // Merge in the imports (direct or indirect) that defined extensions.
    [registry addExtensions:[ValidateRoot extensionRegistry]];
  }
  return registry;
}

@end

#pragma mark - SENGEventRoot_FileDescriptor

static GPBFileDescriptor *SENGEventRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"sensory.api.v1.event"
                                                 objcPrefix:@"SENG"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - SENGPublishUsageEventsRequest

@implementation SENGPublishUsageEventsRequest

@dynamic eventsArray, eventsArray_Count;

typedef struct SENGPublishUsageEventsRequest__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *eventsArray;
} SENGPublishUsageEventsRequest__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "eventsArray",
        .dataTypeSpecific.clazz = GPBObjCClass(SENGUsageEvent),
        .number = SENGPublishUsageEventsRequest_FieldNumber_EventsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(SENGPublishUsageEventsRequest__storage_, eventsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SENGPublishUsageEventsRequest class]
                                     rootClass:[SENGEventRoot class]
                                          file:SENGEventRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(SENGPublishUsageEventsRequest__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - SENGUsageEvent

@implementation SENGUsageEvent

@dynamic hasTimestamp, timestamp;
@dynamic duration;
@dynamic id_p;
@dynamic clientId;
@dynamic type;
@dynamic route;
@dynamic technologiesArray, technologiesArray_Count;
@dynamic modelsArray, modelsArray_Count;
@dynamic audioDurationMs;
@dynamic videoFrameCount;
@dynamic tenantId;
@dynamic billableFunction;
@dynamic tokenCount;

typedef struct SENGUsageEvent__storage_ {
  uint32_t _has_storage_[1];
  SENGUsageEventType type;
  SENGModelType billableFunction;
  GPBTimestamp *timestamp;
  NSString *id_p;
  NSString *clientId;
  NSString *route;
  GPBEnumArray *technologiesArray;
  NSMutableArray *modelsArray;
  NSString *tenantId;
  int64_t duration;
  int64_t audioDurationMs;
  int64_t videoFrameCount;
  int64_t tokenCount;
} SENGUsageEvent__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "timestamp",
        .dataTypeSpecific.clazz = GPBObjCClass(GPBTimestamp),
        .number = SENGUsageEvent_FieldNumber_Timestamp,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, timestamp),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "duration",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEvent_FieldNumber_Duration,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, duration),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "id_p",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEvent_FieldNumber_Id_p,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, id_p),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "clientId",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEvent_FieldNumber_ClientId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, clientId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "type",
        .dataTypeSpecific.enumDescFunc = SENGUsageEventType_EnumDescriptor,
        .number = SENGUsageEvent_FieldNumber_Type,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, type),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "route",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEvent_FieldNumber_Route,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, route),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "technologiesArray",
        .dataTypeSpecific.enumDescFunc = SENGTechnologyType_EnumDescriptor,
        .number = SENGUsageEvent_FieldNumber_TechnologiesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, technologiesArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "modelsArray",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEvent_FieldNumber_ModelsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, modelsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "audioDurationMs",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEvent_FieldNumber_AudioDurationMs,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, audioDurationMs),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "videoFrameCount",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEvent_FieldNumber_VideoFrameCount,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, videoFrameCount),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "tenantId",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEvent_FieldNumber_TenantId,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, tenantId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "billableFunction",
        .dataTypeSpecific.enumDescFunc = SENGModelType_EnumDescriptor,
        .number = SENGUsageEvent_FieldNumber_BillableFunction,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, billableFunction),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldHasEnumDescriptor | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "tokenCount",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEvent_FieldNumber_TokenCount,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(SENGUsageEvent__storage_, tokenCount),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SENGUsageEvent class]
                                     rootClass:[SENGEventRoot class]
                                          file:SENGEventRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(SENGUsageEvent__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\006\004\010\000\t\017\000\n\017\000\013\010\000\014\020\000\r\n\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t SENGUsageEvent_Type_RawValue(SENGUsageEvent *message) {
  GPBDescriptor *descriptor = [SENGUsageEvent descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SENGUsageEvent_FieldNumber_Type];
  return GPBGetMessageRawEnumField(message, field);
}

void SetSENGUsageEvent_Type_RawValue(SENGUsageEvent *message, int32_t value) {
  GPBDescriptor *descriptor = [SENGUsageEvent descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SENGUsageEvent_FieldNumber_Type];
  GPBSetMessageRawEnumField(message, field, value);
}

int32_t SENGUsageEvent_BillableFunction_RawValue(SENGUsageEvent *message) {
  GPBDescriptor *descriptor = [SENGUsageEvent descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SENGUsageEvent_FieldNumber_BillableFunction];
  return GPBGetMessageRawEnumField(message, field);
}

void SetSENGUsageEvent_BillableFunction_RawValue(SENGUsageEvent *message, int32_t value) {
  GPBDescriptor *descriptor = [SENGUsageEvent descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SENGUsageEvent_FieldNumber_BillableFunction];
  GPBSetMessageRawEnumField(message, field, value);
}

#pragma mark - SENGUsageEventResponse

@implementation SENGUsageEventResponse

@dynamic hasTimestamp, timestamp;
@dynamic duration;
@dynamic id_p;
@dynamic clientId;
@dynamic type;
@dynamic route;
@dynamic technologiesArray, technologiesArray_Count;
@dynamic modelsArray, modelsArray_Count;
@dynamic billableValue;
@dynamic billableUnits;
@dynamic tenantId;
@dynamic billableFunction;
@dynamic credits;

typedef struct SENGUsageEventResponse__storage_ {
  uint32_t _has_storage_[1];
  SENGUsageEventType type;
  SENGModelType billableFunction;
  GPBTimestamp *timestamp;
  NSString *id_p;
  NSString *clientId;
  NSString *route;
  GPBEnumArray *technologiesArray;
  NSMutableArray *modelsArray;
  NSString *billableUnits;
  NSString *tenantId;
  int64_t duration;
  int64_t billableValue;
  double credits;
} SENGUsageEventResponse__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "timestamp",
        .dataTypeSpecific.clazz = GPBObjCClass(GPBTimestamp),
        .number = SENGUsageEventResponse_FieldNumber_Timestamp,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, timestamp),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "duration",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventResponse_FieldNumber_Duration,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, duration),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "id_p",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventResponse_FieldNumber_Id_p,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, id_p),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "clientId",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventResponse_FieldNumber_ClientId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, clientId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "type",
        .dataTypeSpecific.enumDescFunc = SENGUsageEventType_EnumDescriptor,
        .number = SENGUsageEventResponse_FieldNumber_Type,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, type),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "route",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventResponse_FieldNumber_Route,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, route),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "technologiesArray",
        .dataTypeSpecific.enumDescFunc = SENGTechnologyType_EnumDescriptor,
        .number = SENGUsageEventResponse_FieldNumber_TechnologiesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, technologiesArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "modelsArray",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventResponse_FieldNumber_ModelsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, modelsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "billableValue",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventResponse_FieldNumber_BillableValue,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, billableValue),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "billableUnits",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventResponse_FieldNumber_BillableUnits,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, billableUnits),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "tenantId",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventResponse_FieldNumber_TenantId,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, tenantId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "billableFunction",
        .dataTypeSpecific.enumDescFunc = SENGModelType_EnumDescriptor,
        .number = SENGUsageEventResponse_FieldNumber_BillableFunction,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, billableFunction),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldHasEnumDescriptor | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "credits",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventResponse_FieldNumber_Credits,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(SENGUsageEventResponse__storage_, credits),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeDouble,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SENGUsageEventResponse class]
                                     rootClass:[SENGEventRoot class]
                                          file:SENGEventRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(SENGUsageEventResponse__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\005\004\010\000\t\r\000\n\r\000\013\010\000\014\020\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t SENGUsageEventResponse_Type_RawValue(SENGUsageEventResponse *message) {
  GPBDescriptor *descriptor = [SENGUsageEventResponse descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SENGUsageEventResponse_FieldNumber_Type];
  return GPBGetMessageRawEnumField(message, field);
}

void SetSENGUsageEventResponse_Type_RawValue(SENGUsageEventResponse *message, int32_t value) {
  GPBDescriptor *descriptor = [SENGUsageEventResponse descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SENGUsageEventResponse_FieldNumber_Type];
  GPBSetMessageRawEnumField(message, field, value);
}

int32_t SENGUsageEventResponse_BillableFunction_RawValue(SENGUsageEventResponse *message) {
  GPBDescriptor *descriptor = [SENGUsageEventResponse descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SENGUsageEventResponse_FieldNumber_BillableFunction];
  return GPBGetMessageRawEnumField(message, field);
}

void SetSENGUsageEventResponse_BillableFunction_RawValue(SENGUsageEventResponse *message, int32_t value) {
  GPBDescriptor *descriptor = [SENGUsageEventResponse descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SENGUsageEventResponse_FieldNumber_BillableFunction];
  GPBSetMessageRawEnumField(message, field, value);
}

#pragma mark - SENGUsageEventListRequest

@implementation SENGUsageEventListRequest

@dynamic tenantId;
@dynamic hasPagination, pagination;
@dynamic hasAfter, after;
@dynamic hasBefore, before;
@dynamic billableFunctionsArray, billableFunctionsArray_Count;

typedef struct SENGUsageEventListRequest__storage_ {
  uint32_t _has_storage_[1];
  NSString *tenantId;
  SENGPaginationOptions *pagination;
  GPBTimestamp *after;
  GPBTimestamp *before;
  GPBEnumArray *billableFunctionsArray;
} SENGUsageEventListRequest__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "tenantId",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventListRequest_FieldNumber_TenantId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(SENGUsageEventListRequest__storage_, tenantId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "pagination",
        .dataTypeSpecific.clazz = GPBObjCClass(SENGPaginationOptions),
        .number = SENGUsageEventListRequest_FieldNumber_Pagination,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(SENGUsageEventListRequest__storage_, pagination),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "after",
        .dataTypeSpecific.clazz = GPBObjCClass(GPBTimestamp),
        .number = SENGUsageEventListRequest_FieldNumber_After,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(SENGUsageEventListRequest__storage_, after),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "before",
        .dataTypeSpecific.clazz = GPBObjCClass(GPBTimestamp),
        .number = SENGUsageEventListRequest_FieldNumber_Before,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(SENGUsageEventListRequest__storage_, before),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "billableFunctionsArray",
        .dataTypeSpecific.enumDescFunc = SENGModelType_EnumDescriptor,
        .number = SENGUsageEventListRequest_FieldNumber_BillableFunctionsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(SENGUsageEventListRequest__storage_, billableFunctionsArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked | GPBFieldTextFormatNameCustom | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SENGUsageEventListRequest class]
                                     rootClass:[SENGEventRoot class]
                                          file:SENGEventRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(SENGUsageEventListRequest__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\002\001\010\000\005\000billableFunctions\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - SENGUsageEventListResponse

@implementation SENGUsageEventListResponse

@dynamic eventsArray, eventsArray_Count;
@dynamic hasPagination, pagination;

typedef struct SENGUsageEventListResponse__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *eventsArray;
  SENGPaginationResponse *pagination;
} SENGUsageEventListResponse__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "eventsArray",
        .dataTypeSpecific.clazz = GPBObjCClass(SENGUsageEventResponse),
        .number = SENGUsageEventListResponse_FieldNumber_EventsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(SENGUsageEventListResponse__storage_, eventsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "pagination",
        .dataTypeSpecific.clazz = GPBObjCClass(SENGPaginationResponse),
        .number = SENGUsageEventListResponse_FieldNumber_Pagination,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(SENGUsageEventListResponse__storage_, pagination),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SENGUsageEventListResponse class]
                                     rootClass:[SENGEventRoot class]
                                          file:SENGEventRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(SENGUsageEventListResponse__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - SENGGlobalEventSummaryRequest

@implementation SENGGlobalEventSummaryRequest

@dynamic tenantsArray, tenantsArray_Count;
@dynamic hasAfter, after;
@dynamic hasBefore, before;
@dynamic billableFunctionsArray, billableFunctionsArray_Count;

typedef struct SENGGlobalEventSummaryRequest__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *tenantsArray;
  GPBTimestamp *after;
  GPBTimestamp *before;
  GPBEnumArray *billableFunctionsArray;
} SENGGlobalEventSummaryRequest__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "tenantsArray",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGGlobalEventSummaryRequest_FieldNumber_TenantsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(SENGGlobalEventSummaryRequest__storage_, tenantsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "after",
        .dataTypeSpecific.clazz = GPBObjCClass(GPBTimestamp),
        .number = SENGGlobalEventSummaryRequest_FieldNumber_After,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(SENGGlobalEventSummaryRequest__storage_, after),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "before",
        .dataTypeSpecific.clazz = GPBObjCClass(GPBTimestamp),
        .number = SENGGlobalEventSummaryRequest_FieldNumber_Before,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(SENGGlobalEventSummaryRequest__storage_, before),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "billableFunctionsArray",
        .dataTypeSpecific.enumDescFunc = SENGModelType_EnumDescriptor,
        .number = SENGGlobalEventSummaryRequest_FieldNumber_BillableFunctionsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(SENGGlobalEventSummaryRequest__storage_, billableFunctionsArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked | GPBFieldTextFormatNameCustom | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SENGGlobalEventSummaryRequest class]
                                     rootClass:[SENGEventRoot class]
                                          file:SENGEventRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(SENGGlobalEventSummaryRequest__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\005\000billableFunctions\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - SENGUsageEventSummary

@implementation SENGUsageEventSummary

@dynamic summariesArray, summariesArray_Count;

typedef struct SENGUsageEventSummary__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *summariesArray;
} SENGUsageEventSummary__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "summariesArray",
        .dataTypeSpecific.clazz = GPBObjCClass(SENGUsageEventModelSummary),
        .number = SENGUsageEventSummary_FieldNumber_SummariesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(SENGUsageEventSummary__storage_, summariesArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SENGUsageEventSummary class]
                                     rootClass:[SENGEventRoot class]
                                          file:SENGEventRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(SENGUsageEventSummary__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - SENGUsageEventModelSummary

@implementation SENGUsageEventModelSummary

@dynamic billableFunction;
@dynamic units;
@dynamic value;
@dynamic count;
@dynamic credits;
@dynamic tenantId;

typedef struct SENGUsageEventModelSummary__storage_ {
  uint32_t _has_storage_[1];
  SENGModelType billableFunction;
  NSString *units;
  NSString *tenantId;
  int64_t value;
  int64_t count;
  double credits;
} SENGUsageEventModelSummary__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "billableFunction",
        .dataTypeSpecific.enumDescFunc = SENGModelType_EnumDescriptor,
        .number = SENGUsageEventModelSummary_FieldNumber_BillableFunction,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(SENGUsageEventModelSummary__storage_, billableFunction),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldHasEnumDescriptor | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "units",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventModelSummary_FieldNumber_Units,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(SENGUsageEventModelSummary__storage_, units),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "value",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventModelSummary_FieldNumber_Value,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(SENGUsageEventModelSummary__storage_, value),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "count",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventModelSummary_FieldNumber_Count,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(SENGUsageEventModelSummary__storage_, count),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "credits",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventModelSummary_FieldNumber_Credits,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(SENGUsageEventModelSummary__storage_, credits),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeDouble,
      },
      {
        .name = "tenantId",
        .dataTypeSpecific.clazz = Nil,
        .number = SENGUsageEventModelSummary_FieldNumber_TenantId,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(SENGUsageEventModelSummary__storage_, tenantId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SENGUsageEventModelSummary class]
                                     rootClass:[SENGEventRoot class]
                                          file:SENGEventRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(SENGUsageEventModelSummary__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\002\001\020\000\006\010\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t SENGUsageEventModelSummary_BillableFunction_RawValue(SENGUsageEventModelSummary *message) {
  GPBDescriptor *descriptor = [SENGUsageEventModelSummary descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SENGUsageEventModelSummary_FieldNumber_BillableFunction];
  return GPBGetMessageRawEnumField(message, field);
}

void SetSENGUsageEventModelSummary_BillableFunction_RawValue(SENGUsageEventModelSummary *message, int32_t value) {
  GPBDescriptor *descriptor = [SENGUsageEventModelSummary descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SENGUsageEventModelSummary_FieldNumber_BillableFunction];
  GPBSetMessageRawEnumField(message, field, value);
}

#pragma mark - SENGPublishUsageEventsResponse

@implementation SENGPublishUsageEventsResponse


typedef struct SENGPublishUsageEventsResponse__storage_ {
  uint32_t _has_storage_[1];
} SENGPublishUsageEventsResponse__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SENGPublishUsageEventsResponse class]
                                     rootClass:[SENGEventRoot class]
                                          file:SENGEventRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(SENGPublishUsageEventsResponse__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
