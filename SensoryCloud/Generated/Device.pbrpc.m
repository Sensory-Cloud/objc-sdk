// Code generated by gRPC proto compiler.  DO NOT EDIT!
// source: v1/management/device.proto

#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import "Device.pbrpc.h"
#import "Device.pbobjc.h"
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriter+Immediate.h>

#import "Common.pbobjc.h"
#import "Validate.pbobjc.h"

@implementation SENGDeviceService

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

// Designated initializer
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [super initWithHost:host
                 packageName:@"sensory.api.v1.management"
                 serviceName:@"DeviceService"
                 callOptions:callOptions];
}

- (instancetype)initWithHost:(NSString *)host {
  return [super initWithHost:host
                 packageName:@"sensory.api.v1.management"
                 serviceName:@"DeviceService"];
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

#pragma mark EnrollDevice(EnrollDeviceRequest) returns (DeviceResponse)

/**
 * Create a new device in the database
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)enrollDeviceWithRequest:(SENGEnrollDeviceRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToEnrollDeviceWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * Create a new device in the database
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToEnrollDeviceWithRequest:(SENGEnrollDeviceRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"EnrollDevice"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[SENGDeviceResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * Create a new device in the database
 */
- (GRPCUnaryProtoCall *)enrollDeviceWithMessage:(SENGEnrollDeviceRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"EnrollDevice"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[SENGDeviceResponse class]];
}

#pragma mark RenewDeviceCredential(RenewDeviceCredentialRequest) returns (DeviceResponse)

/**
 * Renew a device's credential, which links the device to a key in the database.
 * This endpoint can be used to assign a new credential to a device if the old credential has expired.
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)renewDeviceCredentialWithRequest:(SENGRenewDeviceCredentialRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToRenewDeviceCredentialWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * Renew a device's credential, which links the device to a key in the database.
 * This endpoint can be used to assign a new credential to a device if the old credential has expired.
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToRenewDeviceCredentialWithRequest:(SENGRenewDeviceCredentialRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"RenewDeviceCredential"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[SENGDeviceResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * Renew a device's credential, which links the device to a key in the database.
 * This endpoint can be used to assign a new credential to a device if the old credential has expired.
 */
- (GRPCUnaryProtoCall *)renewDeviceCredentialWithMessage:(SENGRenewDeviceCredentialRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"RenewDeviceCredential"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[SENGDeviceResponse class]];
}

#pragma mark GetWhoAmI(DeviceGetWhoAmIRequest) returns (DeviceResponse)

/**
 * Allows a device to fetch information about itself
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getWhoAmIWithRequest:(SENGDeviceGetWhoAmIRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToGetWhoAmIWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * Allows a device to fetch information about itself
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetWhoAmIWithRequest:(SENGDeviceGetWhoAmIRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"GetWhoAmI"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[SENGDeviceResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * Allows a device to fetch information about itself
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)getWhoAmIWithMessage:(SENGDeviceGetWhoAmIRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"GetWhoAmI"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[SENGDeviceResponse class]];
}

#pragma mark GetDevice(DeviceRequest) returns (GetDeviceResponse)

/**
 * Returns device information
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getDeviceWithRequest:(SENGDeviceRequest *)request handler:(void(^)(SENGGetDeviceResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToGetDeviceWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * Returns device information
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetDeviceWithRequest:(SENGDeviceRequest *)request handler:(void(^)(SENGGetDeviceResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"GetDevice"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[SENGGetDeviceResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * Returns device information
 */
- (GRPCUnaryProtoCall *)getDeviceWithMessage:(SENGDeviceRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"GetDevice"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[SENGGetDeviceResponse class]];
}

#pragma mark GetDevices(GetDevicesRequest) returns (DeviceListResponse)

/**
 * Returns a list of devices associated with the given userId
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getDevicesWithRequest:(SENGGetDevicesRequest *)request handler:(void(^)(SENGDeviceListResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToGetDevicesWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * Returns a list of devices associated with the given userId
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetDevicesWithRequest:(SENGGetDevicesRequest *)request handler:(void(^)(SENGDeviceListResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"GetDevices"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[SENGDeviceListResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * Returns a list of devices associated with the given userId
 */
- (GRPCUnaryProtoCall *)getDevicesWithMessage:(SENGGetDevicesRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"GetDevices"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[SENGDeviceListResponse class]];
}

#pragma mark UpdateDevice(UpdateDeviceRequest) returns (DeviceResponse)

/**
 * Allows the name of a device to be updated
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)updateDeviceWithRequest:(SENGUpdateDeviceRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToUpdateDeviceWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * Allows the name of a device to be updated
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToUpdateDeviceWithRequest:(SENGUpdateDeviceRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"UpdateDevice"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[SENGDeviceResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * Allows the name of a device to be updated
 */
- (GRPCUnaryProtoCall *)updateDeviceWithMessage:(SENGUpdateDeviceRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"UpdateDevice"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[SENGDeviceResponse class]];
}

#pragma mark DeleteDevice(DeviceRequest) returns (DeviceResponse)

/**
 * Allows a device to be deleted
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)deleteDeviceWithRequest:(SENGDeviceRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToDeleteDeviceWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * Allows a device to be deleted
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToDeleteDeviceWithRequest:(SENGDeviceRequest *)request handler:(void(^)(SENGDeviceResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"DeleteDevice"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[SENGDeviceResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * Allows a device to be deleted
 */
- (GRPCUnaryProtoCall *)deleteDeviceWithMessage:(SENGDeviceRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"DeleteDevice"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[SENGDeviceResponse class]];
}

@end
#endif
