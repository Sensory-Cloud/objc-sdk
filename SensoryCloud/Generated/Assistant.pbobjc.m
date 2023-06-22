// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: v1/assistant/assistant.proto

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

#import <stdatomic.h>

#import "Assistant.pbobjc.h"
#import "Common.pbobjc.h"
#import "Validate.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdollar-in-identifier-extension"

#pragma mark - Objective C Class declarations
// Forward declarations of Objective C classes that we can use as
// static values in struct initializers.
// We don't use [Foo class] because it is not a static value.
GPBObjCClassDeclaration(ChatMessage);

#pragma mark - AssistantRoot

@implementation AssistantRoot

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

#pragma mark - AssistantRoot_FileDescriptor

static GPBFileDescriptor *AssistantRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"sensory.api.v1.assistant"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum ChatRole

GPBEnumDescriptor *ChatRole_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "System\000User\000Assistant\000";
    static const int32_t values[] = {
        ChatRole_System,
        ChatRole_User,
        ChatRole_Assistant,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(ChatRole)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:ChatRole_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL ChatRole_IsValidValue(int32_t value__) {
  switch (value__) {
    case ChatRole_System:
    case ChatRole_User:
    case ChatRole_Assistant:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - ChatMessage

@implementation ChatMessage

@dynamic role;
@dynamic content;

typedef struct ChatMessage__storage_ {
  uint32_t _has_storage_[1];
  ChatRole role;
  NSString *content;
} ChatMessage__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "role",
        .dataTypeSpecific.enumDescFunc = ChatRole_EnumDescriptor,
        .number = ChatMessage_FieldNumber_Role,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ChatMessage__storage_, role),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "content",
        .dataTypeSpecific.clazz = Nil,
        .number = ChatMessage_FieldNumber_Content,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(ChatMessage__storage_, content),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ChatMessage class]
                                     rootClass:[AssistantRoot class]
                                          file:AssistantRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ChatMessage__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t ChatMessage_Role_RawValue(ChatMessage *message) {
  GPBDescriptor *descriptor = [ChatMessage descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:ChatMessage_FieldNumber_Role];
  return GPBGetMessageRawEnumField(message, field);
}

void SetChatMessage_Role_RawValue(ChatMessage *message, int32_t value) {
  GPBDescriptor *descriptor = [ChatMessage descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:ChatMessage_FieldNumber_Role];
  GPBSetMessageRawEnumField(message, field, value);
}

#pragma mark - TextChatRequest

@implementation TextChatRequest

@dynamic modelName;
@dynamic messagesArray, messagesArray_Count;

typedef struct TextChatRequest__storage_ {
  uint32_t _has_storage_[1];
  NSString *modelName;
  NSMutableArray *messagesArray;
} TextChatRequest__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "modelName",
        .dataTypeSpecific.clazz = Nil,
        .number = TextChatRequest_FieldNumber_ModelName,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(TextChatRequest__storage_, modelName),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "messagesArray",
        .dataTypeSpecific.clazz = GPBObjCClass(ChatMessage),
        .number = TextChatRequest_FieldNumber_MessagesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(TextChatRequest__storage_, messagesArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[TextChatRequest class]
                                     rootClass:[AssistantRoot class]
                                          file:AssistantRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(TextChatRequest__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\001\t\000";
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

#pragma mark - TextChatResponse

@implementation TextChatResponse

@dynamic hasMessage, message;

typedef struct TextChatResponse__storage_ {
  uint32_t _has_storage_[1];
  ChatMessage *message;
} TextChatResponse__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "message",
        .dataTypeSpecific.clazz = GPBObjCClass(ChatMessage),
        .number = TextChatResponse_FieldNumber_Message,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(TextChatResponse__storage_, message),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[TextChatResponse class]
                                     rootClass:[AssistantRoot class]
                                          file:AssistantRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(TextChatResponse__storage_)
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