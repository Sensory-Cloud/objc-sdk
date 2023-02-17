// Code generated by gRPC proto compiler.  DO NOT EDIT!
// source: v1/management/enrollment.proto

#import <Foundation/Foundation.h>

#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#import "Enrollment.pbobjc.h"
#endif

#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import <ProtoRPC/ProtoService.h>
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>
#endif

@class SENGAppendEnrollmentGroupRequest;
@class SENGCreateEnrollmentGroupRequest;
@class SENGDeleteEnrollmentGroupRequest;
@class SENGDeleteEnrollmentRequest;
@class SENGEnrollmentGroupResponse;
@class SENGEnrollmentResponse;
@class SENGGetEnrollmentGroupsResponse;
@class SENGGetEnrollmentsRequest;
@class SENGGetEnrollmentsResponse;
@class SENGRemoveEnrollmentsRequest;
@class SENGUpdateEnrollmentGroupRequest;
@class SENGUpdateEnrollmentRequest;

#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#if defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS) && GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
  #import <Protobuf/GPBTimestamp.pbobjc.h>
#else
  #import "GPBTimestamp.pbobjc.h"
#endif
  #import "Validate.pbobjc.h"
  #import "Common.pbobjc.h"
#endif

@class GRPCUnaryProtoCall;
@class GRPCStreamingProtoCall;
@class GRPCCallOptions;
@protocol GRPCProtoResponseHandler;
@class GRPCProtoCall;


NS_ASSUME_NONNULL_BEGIN

@protocol SENGEnrollmentService2 <NSObject>

#pragma mark GetEnrollments(GetEnrollmentsRequest) returns (GetEnrollmentsResponse)

/**
 * Get enrollments from the database that match the specified criteria
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)getEnrollmentsWithMessage:(SENGGetEnrollmentsRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetEnrollmentGroups(GetEnrollmentsRequest) returns (GetEnrollmentGroupsResponse)

/**
 * Get all enrollment groups that match the specified criteria
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)getEnrollmentGroupsWithMessage:(SENGGetEnrollmentsRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark CreateEnrollmentGroup(CreateEnrollmentGroupRequest) returns (EnrollmentGroupResponse)

/**
 * Creates a new enrollment group without any associated enrollments
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)createEnrollmentGroupWithMessage:(SENGCreateEnrollmentGroupRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark AppendEnrollmentGroup(AppendEnrollmentGroupRequest) returns (EnrollmentGroupResponse)

/**
 * Appends an enrollment to an enrollment group
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)appendEnrollmentGroupWithMessage:(SENGAppendEnrollmentGroupRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark DeleteEnrollment(DeleteEnrollmentRequest) returns (EnrollmentResponse)

/**
 * Deletes an enrollment from the database
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 * A user may not delete their last enrollment, as this would lead to a situation where a user could
 * lock themselves out of the system forever.
 */
- (GRPCUnaryProtoCall *)deleteEnrollmentWithMessage:(SENGDeleteEnrollmentRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark DeleteEnrollmentGroup(DeleteEnrollmentGroupRequest) returns (EnrollmentGroupResponse)

/**
 * Deletes an enrollment group from the database
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)deleteEnrollmentGroupWithMessage:(SENGDeleteEnrollmentGroupRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark UpdateEnrollment(UpdateEnrollmentRequest) returns (EnrollmentResponse)

/**
 * Updates the name of an enrollment
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)updateEnrollmentWithMessage:(SENGUpdateEnrollmentRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark UpdateEnrollmentGroup(UpdateEnrollmentGroupRequest) returns (EnrollmentGroupResponse)

/**
 * Updates the name of an enrollment group
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)updateEnrollmentGroupWithMessage:(SENGUpdateEnrollmentGroupRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark RemoveEnrollmentsFromGroup(RemoveEnrollmentsRequest) returns (EnrollmentGroupResponse)

/**
 * Removes a list of enrollments from an enrollment group
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)removeEnrollmentsFromGroupWithMessage:(SENGRemoveEnrollmentsRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

@end

/**
 * The methods in this protocol belong to a set of old APIs that have been deprecated. They do not
 * recognize call options provided in the initializer. Using the v2 protocol is recommended.
 */
@protocol SENGEnrollmentService <NSObject>

#pragma mark GetEnrollments(GetEnrollmentsRequest) returns (GetEnrollmentsResponse)

/**
 * Get enrollments from the database that match the specified criteria
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getEnrollmentsWithRequest:(SENGGetEnrollmentsRequest *)request handler:(void(^)(SENGGetEnrollmentsResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Get enrollments from the database that match the specified criteria
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetEnrollmentsWithRequest:(SENGGetEnrollmentsRequest *)request handler:(void(^)(SENGGetEnrollmentsResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark GetEnrollmentGroups(GetEnrollmentsRequest) returns (GetEnrollmentGroupsResponse)

/**
 * Get all enrollment groups that match the specified criteria
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getEnrollmentGroupsWithRequest:(SENGGetEnrollmentsRequest *)request handler:(void(^)(SENGGetEnrollmentGroupsResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Get all enrollment groups that match the specified criteria
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetEnrollmentGroupsWithRequest:(SENGGetEnrollmentsRequest *)request handler:(void(^)(SENGGetEnrollmentGroupsResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark CreateEnrollmentGroup(CreateEnrollmentGroupRequest) returns (EnrollmentGroupResponse)

/**
 * Creates a new enrollment group without any associated enrollments
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)createEnrollmentGroupWithRequest:(SENGCreateEnrollmentGroupRequest *)request handler:(void(^)(SENGEnrollmentGroupResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Creates a new enrollment group without any associated enrollments
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToCreateEnrollmentGroupWithRequest:(SENGCreateEnrollmentGroupRequest *)request handler:(void(^)(SENGEnrollmentGroupResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark AppendEnrollmentGroup(AppendEnrollmentGroupRequest) returns (EnrollmentGroupResponse)

/**
 * Appends an enrollment to an enrollment group
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)appendEnrollmentGroupWithRequest:(SENGAppendEnrollmentGroupRequest *)request handler:(void(^)(SENGEnrollmentGroupResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Appends an enrollment to an enrollment group
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToAppendEnrollmentGroupWithRequest:(SENGAppendEnrollmentGroupRequest *)request handler:(void(^)(SENGEnrollmentGroupResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark DeleteEnrollment(DeleteEnrollmentRequest) returns (EnrollmentResponse)

/**
 * Deletes an enrollment from the database
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 * A user may not delete their last enrollment, as this would lead to a situation where a user could
 * lock themselves out of the system forever.
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)deleteEnrollmentWithRequest:(SENGDeleteEnrollmentRequest *)request handler:(void(^)(SENGEnrollmentResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Deletes an enrollment from the database
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 * A user may not delete their last enrollment, as this would lead to a situation where a user could
 * lock themselves out of the system forever.
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToDeleteEnrollmentWithRequest:(SENGDeleteEnrollmentRequest *)request handler:(void(^)(SENGEnrollmentResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark DeleteEnrollmentGroup(DeleteEnrollmentGroupRequest) returns (EnrollmentGroupResponse)

/**
 * Deletes an enrollment group from the database
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)deleteEnrollmentGroupWithRequest:(SENGDeleteEnrollmentGroupRequest *)request handler:(void(^)(SENGEnrollmentGroupResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Deletes an enrollment group from the database
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToDeleteEnrollmentGroupWithRequest:(SENGDeleteEnrollmentGroupRequest *)request handler:(void(^)(SENGEnrollmentGroupResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark UpdateEnrollment(UpdateEnrollmentRequest) returns (EnrollmentResponse)

/**
 * Updates the name of an enrollment
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)updateEnrollmentWithRequest:(SENGUpdateEnrollmentRequest *)request handler:(void(^)(SENGEnrollmentResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Updates the name of an enrollment
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToUpdateEnrollmentWithRequest:(SENGUpdateEnrollmentRequest *)request handler:(void(^)(SENGEnrollmentResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark UpdateEnrollmentGroup(UpdateEnrollmentGroupRequest) returns (EnrollmentGroupResponse)

/**
 * Updates the name of an enrollment group
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)updateEnrollmentGroupWithRequest:(SENGUpdateEnrollmentGroupRequest *)request handler:(void(^)(SENGEnrollmentGroupResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Updates the name of an enrollment group
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToUpdateEnrollmentGroupWithRequest:(SENGUpdateEnrollmentGroupRequest *)request handler:(void(^)(SENGEnrollmentGroupResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark RemoveEnrollmentsFromGroup(RemoveEnrollmentsRequest) returns (EnrollmentGroupResponse)

/**
 * Removes a list of enrollments from an enrollment group
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)removeEnrollmentsFromGroupWithRequest:(SENGRemoveEnrollmentsRequest *)request handler:(void(^)(SENGEnrollmentGroupResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Removes a list of enrollments from an enrollment group
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToRemoveEnrollmentsFromGroupWithRequest:(SENGRemoveEnrollmentsRequest *)request handler:(void(^)(SENGEnrollmentGroupResponse *_Nullable response, NSError *_Nullable error))handler;


@end


#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface SENGEnrollmentService : GRPCProtoService<SENGEnrollmentService2, SENGEnrollmentService>
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions;
// The following methods belong to a set of old APIs that have been deprecated.
- (instancetype)initWithHost:(NSString *)host;
+ (instancetype)serviceWithHost:(NSString *)host;
@end
#endif

NS_ASSUME_NONNULL_END
