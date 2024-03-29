// Code generated by gRPC proto compiler.  DO NOT EDIT!
// source: v1/assistant/assistant.proto

#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import "Assistant.pbrpc.h"
#import "Assistant.pbobjc.h"
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriter+Immediate.h>

#import "Common.pbobjc.h"

@implementation AssistantService

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

// Designated initializer
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [super initWithHost:host
                 packageName:@"sensory.api.v1.assistant"
                 serviceName:@"AssistantService"
                 callOptions:callOptions];
}

- (instancetype)initWithHost:(NSString *)host {
  return [super initWithHost:host
                 packageName:@"sensory.api.v1.assistant"
                 serviceName:@"AssistantService"];
}

#pragma clang diagnostic pop

// Override superclass initializer to disallow different package and service names.
- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName {
  return [self initWithHost:host];
}

- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName
                 callOptions:(GRPCCallOptions *)callOptions {
  return [self initWithHost:host callOptions:callOptions];
}

#pragma mark - Class Methods

+ (instancetype)serviceWithHost:(NSString *)host {
  return [[self alloc] initWithHost:host];
}

+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [[self alloc] initWithHost:host callOptions:callOptions];
}

#pragma mark - Method Implementations

#pragma mark TextChat(TextChatRequest) returns (TextChatResponse)

/**
 * Allows a user to verify their own email. Will fail if the email is already verified.
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)textChatWithRequest:(TextChatRequest *)request handler:(void(^)(TextChatResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToTextChatWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * Allows a user to verify their own email. Will fail if the email is already verified.
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToTextChatWithRequest:(TextChatRequest *)request handler:(void(^)(TextChatResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"TextChat"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[TextChatResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * Allows a user to verify their own email. Will fail if the email is already verified.
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)textChatWithMessage:(TextChatRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"TextChat"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[TextChatResponse class]];
}

@end
#endif
