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

@class SENGDeviceGetWhoAmIRequest;
@class SENGDeviceListResponse;
@class SENGDeviceRequest;
@class SENGDeviceResponse;
@class SENGEnrollDeviceRequest;
@class SENGGetDeviceResponse;
@class SENGGetDevicesRequest;
@class SENGRenewDeviceCredentialRequest;
@class SENGUpdateDeviceRequest;

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

@protocol SENGDeviceService2 <NSObject>

#pragma mark EnrollDevice(EnrollDeviceRequest) returns (DeviceResponse)

/**
 * Create a new device in the database
 */
- (GRPCUnaryProtoCall *)enrollDeviceWithMessage:(SENGEnrollDeviceRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark RenewDeviceCredential(RenewDeviceCredentialRequest) returns (DeviceResponse)

/**
 * Renew a device's credential, which links the device to a key in the database.
 * This endpoint can be used to assign a new credential to a device if the old credential has expired.
 */
- (GRPCUnaryProtoCall *)renewDeviceCredentialWithMessage:(SENGRenewDeviceCredentialRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetWhoAmI(DeviceGetWhoAmIRequest) returns (DeviceResponse)

/**
 * Allows a device to fetch information about itself
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)getWhoAmIWithMessage:(SENGDeviceGetWhoAmIRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetDevice(DeviceRequest) returns (GetDeviceResponse)

/**
 * Returns device information
 */
- (GRPCUnaryProtoCall *)getDeviceWithMessage:(SENGDeviceRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetDevices(GetDevicesRequest) returns (DeviceListResponse)

/**
 * Returns a list of devices associated with the given userId
 */
- (GRPCUnaryProtoCall *)getDevicesWithMessage:(SENGGetDevicesRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark UpdateDevice(UpdateDeviceRequest) returns (DeviceResponse)

/**
 * Allows the name of a device to be updated
 */
- (GRPCUnaryProtoCall *)updateDeviceWithMessage:(SENGUpdateDeviceRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark DeleteDevice(DeviceRequest) returns (DeviceResponse)

/**
 * Allows a device to be deleted
 */
- (GRPCUnaryProtoCall *)deleteDeviceWithMessage:(SENGDeviceRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

@end

/**
 * The methods in this protocol belong to a set of old APIs that have been deprecated. They do not
 * recognize call options provided in the initializer. Using the v2 protocol is recommended.
 */
@protocol SENGDeviceService <NSObject>

#pragma mark EnrollDevice(EnrollDeviceRequest) returns (DeviceResponse)

/**
 * Create a new device in the database
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)enrollDeviceWithRequest:(SENGEnrollDeviceRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Create a new device in the database
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToEnrollDeviceWithRequest:(SENGEnrollDeviceRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark RenewDeviceCredential(RenewDeviceCredentialRequest) returns (DeviceResponse)

/**
 * Renew a device's credential, which links the device to a key in the database.
 * This endpoint can be used to assign a new credential to a device if the old credential has expired.
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)renewDeviceCredentialWithRequest:(SENGRenewDeviceCredentialRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Renew a device's credential, which links the device to a key in the database.
 * This endpoint can be used to assign a new credential to a device if the old credential has expired.
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToRenewDeviceCredentialWithRequest:(SENGRenewDeviceCredentialRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark GetWhoAmI(DeviceGetWhoAmIRequest) returns (DeviceResponse)

/**
 * Allows a device to fetch information about itself
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getWhoAmIWithRequest:(SENGDeviceGetWhoAmIRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Allows a device to fetch information about itself
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetWhoAmIWithRequest:(SENGDeviceGetWhoAmIRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark GetDevice(DeviceRequest) returns (GetDeviceResponse)

/**
 * Returns device information
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getDeviceWithRequest:(SENGDeviceRequest *)request handler:(void(^)(SENGGetDeviceResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Returns device information
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetDeviceWithRequest:(SENGDeviceRequest *)request handler:(void(^)(SENGGetDeviceResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark GetDevices(GetDevicesRequest) returns (DeviceListResponse)

/**
 * Returns a list of devices associated with the given userId
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getDevicesWithRequest:(SENGGetDevicesRequest *)request handler:(void(^)(SENGDeviceListResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Returns a list of devices associated with the given userId
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetDevicesWithRequest:(SENGGetDevicesRequest *)request handler:(void(^)(SENGDeviceListResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark UpdateDevice(UpdateDeviceRequest) returns (DeviceResponse)

/**
 * Allows the name of a device to be updated
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)updateDeviceWithRequest:(SENGUpdateDeviceRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Allows the name of a device to be updated
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToUpdateDeviceWithRequest:(SENGUpdateDeviceRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark DeleteDevice(DeviceRequest) returns (DeviceResponse)

/**
 * Allows a device to be deleted
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)deleteDeviceWithRequest:(SENGDeviceRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Allows a device to be deleted
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToDeleteDeviceWithRequest:(SENGDeviceRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler;


@end


#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface SENGDeviceService : GRPCProtoService<SENGDeviceService2, SENGDeviceService>
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions;
// The following methods belong to a set of old APIs that have been deprecated.
- (instancetype)initWithHost:(NSString *)host;
+ (instancetype)serviceWithHost:(NSString *)host;
@end
#endif

NS_ASSUME_NONNULL_END

