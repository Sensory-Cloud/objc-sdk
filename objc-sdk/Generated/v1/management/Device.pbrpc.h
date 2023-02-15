// Code generated by gRPC proto compiler.  DO NOT EDIT!
// source: v1/management/device.proto

#import <Foundation/Foundation.h>

#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#import "Device.pbobjc.h"
#endif

#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import <ProtoRPC/ProtoService.h>
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>
#endif

@class SENDeviceGetWhoAmIRequest;
@class SENDeviceListResponse;
@class SENDeviceRequest;
@class SENDeviceResponse;
@class SENEnrollDeviceRequest;
@class SENGetDeviceResponse;
@class SENGetDevicesRequest;
@class SENRenewDeviceCredentialRequest;
@class SENUpdateDeviceRequest;

#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
  #import "Common.pbobjc.h"
  #import "Validate.pbobjc.h"
#endif

@class GRPCUnaryProtoCall;
@class GRPCStreamingProtoCall;
@class GRPCCallOptions;
@protocol GRPCProtoResponseHandler;
@class GRPCProtoCall;


NS_ASSUME_NONNULL_BEGIN

@protocol SENDeviceService2 <NSObject>

#pragma mark EnrollDevice(EnrollDeviceRequest) returns (DeviceResponse)

/**
 * Create a new device in the database
 */
- (GRPCUnaryProtoCall *)enrollDeviceWithMessage:(SENEnrollDeviceRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark RenewDeviceCredential(RenewDeviceCredentialRequest) returns (DeviceResponse)

/**
 * Renew a device's credential, which links the device to a key in the database.
 * This endpoint can be used to assign a new credential to a device if the old credential has expired.
 */
- (GRPCUnaryProtoCall *)renewDeviceCredentialWithMessage:(SENRenewDeviceCredentialRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetWhoAmI(DeviceGetWhoAmIRequest) returns (DeviceResponse)

/**
 * Allows a device to fetch information about itself
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)getWhoAmIWithMessage:(SENDeviceGetWhoAmIRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetDevice(DeviceRequest) returns (GetDeviceResponse)

/**
 * Returns device information
 */
- (GRPCUnaryProtoCall *)getDeviceWithMessage:(SENDeviceRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetDevices(GetDevicesRequest) returns (DeviceListResponse)

/**
 * Returns a list of devices associated with the given userId
 */
- (GRPCUnaryProtoCall *)getDevicesWithMessage:(SENGetDevicesRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark UpdateDevice(UpdateDeviceRequest) returns (DeviceResponse)

/**
 * Allows the name of a device to be updated
 */
- (GRPCUnaryProtoCall *)updateDeviceWithMessage:(SENUpdateDeviceRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark DeleteDevice(DeviceRequest) returns (DeviceResponse)

/**
 * Allows a device to be deleted
 */
- (GRPCUnaryProtoCall *)deleteDeviceWithMessage:(SENDeviceRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

@end

/**
 * The methods in this protocol belong to a set of old APIs that have been deprecated. They do not
 * recognize call options provided in the initializer. Using the v2 protocol is recommended.
 */
@protocol SENDeviceService <NSObject>

#pragma mark EnrollDevice(EnrollDeviceRequest) returns (DeviceResponse)

/**
 * Create a new device in the database
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)enrollDeviceWithRequest:(SENEnrollDeviceRequest *)request handler:(void(^)(SENDeviceResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Create a new device in the database
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToEnrollDeviceWithRequest:(SENEnrollDeviceRequest *)request handler:(void(^)(SENDeviceResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark RenewDeviceCredential(RenewDeviceCredentialRequest) returns (DeviceResponse)

/**
 * Renew a device's credential, which links the device to a key in the database.
 * This endpoint can be used to assign a new credential to a device if the old credential has expired.
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)renewDeviceCredentialWithRequest:(SENRenewDeviceCredentialRequest *)request handler:(void(^)(SENDeviceResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Renew a device's credential, which links the device to a key in the database.
 * This endpoint can be used to assign a new credential to a device if the old credential has expired.
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToRenewDeviceCredentialWithRequest:(SENRenewDeviceCredentialRequest *)request handler:(void(^)(SENDeviceResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark GetWhoAmI(DeviceGetWhoAmIRequest) returns (DeviceResponse)

/**
 * Allows a device to fetch information about itself
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getWhoAmIWithRequest:(SENDeviceGetWhoAmIRequest *)request handler:(void(^)(SENDeviceResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Allows a device to fetch information about itself
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetWhoAmIWithRequest:(SENDeviceGetWhoAmIRequest *)request handler:(void(^)(SENDeviceResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark GetDevice(DeviceRequest) returns (GetDeviceResponse)

/**
 * Returns device information
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getDeviceWithRequest:(SENDeviceRequest *)request handler:(void(^)(SENGetDeviceResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Returns device information
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetDeviceWithRequest:(SENDeviceRequest *)request handler:(void(^)(SENGetDeviceResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark GetDevices(GetDevicesRequest) returns (DeviceListResponse)

/**
 * Returns a list of devices associated with the given userId
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getDevicesWithRequest:(SENGetDevicesRequest *)request handler:(void(^)(SENDeviceListResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Returns a list of devices associated with the given userId
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetDevicesWithRequest:(SENGetDevicesRequest *)request handler:(void(^)(SENDeviceListResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark UpdateDevice(UpdateDeviceRequest) returns (DeviceResponse)

/**
 * Allows the name of a device to be updated
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)updateDeviceWithRequest:(SENUpdateDeviceRequest *)request handler:(void(^)(SENDeviceResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Allows the name of a device to be updated
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToUpdateDeviceWithRequest:(SENUpdateDeviceRequest *)request handler:(void(^)(SENDeviceResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark DeleteDevice(DeviceRequest) returns (DeviceResponse)

/**
 * Allows a device to be deleted
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)deleteDeviceWithRequest:(SENDeviceRequest *)request handler:(void(^)(SENDeviceResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Allows a device to be deleted
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToDeleteDeviceWithRequest:(SENDeviceRequest *)request handler:(void(^)(SENDeviceResponse *_Nullable response, NSError *_Nullable error))handler;


@end


#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface SENDeviceService : GRPCProtoService<SENDeviceService2, SENDeviceService>
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions;
// The following methods belong to a set of old APIs that have been deprecated.
- (instancetype)initWithHost:(NSString *)host;
+ (instancetype)serviceWithHost:(NSString *)host;
@end
#endif

NS_ASSUME_NONNULL_END

