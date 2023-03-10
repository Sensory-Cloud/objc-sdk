// Code generated by gRPC proto compiler.  DO NOT EDIT!
// source: oauth/oauth.proto

#import <Foundation/Foundation.h>

#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#import "Oauth.pbobjc.h"
#endif

#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import <ProtoRPC/ProtoService.h>
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>
#endif

@class SENGPublicKeyRequest;
@class SENGPublicKeyResponse;
@class SENGSignTokenRequest;
@class SENGTokenRequest;
@class SENGTokenResponse;
@class SENGWhoAmIRequest;
@class SENGWhoAmIResponse;

#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
  #import "Validate.pbobjc.h"
  #import "Common.pbobjc.h"
#endif

@class GRPCUnaryProtoCall;
@class GRPCStreamingProtoCall;
@class GRPCCallOptions;
@protocol GRPCProtoResponseHandler;
@class GRPCProtoCall;


NS_ASSUME_NONNULL_BEGIN

@protocol SENGOauthService2 <NSObject>

#pragma mark GetToken(TokenRequest) returns (TokenResponse)

/**
 * Obtain an OAuth token for the given credentials
 * Endpoint does not require an authorization token
 */
- (GRPCUnaryProtoCall *)getTokenWithMessage:(SENGTokenRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark SignToken(SignTokenRequest) returns (TokenResponse)

/**
 * Sign and return an OAuth token. The passed authorization token must have the SignToken authority.
 * Therefore, Devices are not allowed to make this request.
 * Sign does not validate credentials, and therefore should be used in specific circumstances where credentials are not required.
 * One common usecase for the Sign request is an Io server issuing a user-scoped token after a successful authentication.
 * Only a limited subset of of scopes may be requested from the SignToken request.
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)signTokenWithMessage:(SENGSignTokenRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetWhoAmI(WhoAmIRequest) returns (WhoAmIResponse)

/**
 * Obtain information about oneself based on the passed OAuth token
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 */
- (GRPCUnaryProtoCall *)getWhoAmIWithMessage:(SENGWhoAmIRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetPublicKey(PublicKeyRequest) returns (PublicKeyResponse)

/**
 * Retrieve a public key by ID. Public keys retrieved by this endpoint can be used
 * to validate tokens signed by the Sensory cloud.
 */
- (GRPCUnaryProtoCall *)getPublicKeyWithMessage:(SENGPublicKeyRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

@end

/**
 * The methods in this protocol belong to a set of old APIs that have been deprecated. They do not
 * recognize call options provided in the initializer. Using the v2 protocol is recommended.
 */
@protocol SENGOauthService <NSObject>

#pragma mark GetToken(TokenRequest) returns (TokenResponse)

/**
 * Obtain an OAuth token for the given credentials
 * Endpoint does not require an authorization token
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getTokenWithRequest:(SENGTokenRequest *)request handler:(void(^)(SENGTokenResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Obtain an OAuth token for the given credentials
 * Endpoint does not require an authorization token
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetTokenWithRequest:(SENGTokenRequest *)request handler:(void(^)(SENGTokenResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark SignToken(SignTokenRequest) returns (TokenResponse)

/**
 * Sign and return an OAuth token. The passed authorization token must have the SignToken authority.
 * Therefore, Devices are not allowed to make this request.
 * Sign does not validate credentials, and therefore should be used in specific circumstances where credentials are not required.
 * One common usecase for the Sign request is an Io server issuing a user-scoped token after a successful authentication.
 * Only a limited subset of of scopes may be requested from the SignToken request.
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)signTokenWithRequest:(SENGSignTokenRequest *)request handler:(void(^)(SENGTokenResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Sign and return an OAuth token. The passed authorization token must have the SignToken authority.
 * Therefore, Devices are not allowed to make this request.
 * Sign does not validate credentials, and therefore should be used in specific circumstances where credentials are not required.
 * One common usecase for the Sign request is an Io server issuing a user-scoped token after a successful authentication.
 * Only a limited subset of of scopes may be requested from the SignToken request.
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToSignTokenWithRequest:(SENGSignTokenRequest *)request handler:(void(^)(SENGTokenResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark GetWhoAmI(WhoAmIRequest) returns (WhoAmIResponse)

/**
 * Obtain information about oneself based on the passed OAuth token
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getWhoAmIWithRequest:(SENGWhoAmIRequest *)request handler:(void(^)(SENGWhoAmIResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Obtain information about oneself based on the passed OAuth token
 * Authorization metadata is required {"authorization": "Bearer <TOKEN>"}
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetWhoAmIWithRequest:(SENGWhoAmIRequest *)request handler:(void(^)(SENGWhoAmIResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark GetPublicKey(PublicKeyRequest) returns (PublicKeyResponse)

/**
 * Retrieve a public key by ID. Public keys retrieved by this endpoint can be used
 * to validate tokens signed by the Sensory cloud.
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getPublicKeyWithRequest:(SENGPublicKeyRequest *)request handler:(void(^)(SENGPublicKeyResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * Retrieve a public key by ID. Public keys retrieved by this endpoint can be used
 * to validate tokens signed by the Sensory cloud.
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetPublicKeyWithRequest:(SENGPublicKeyRequest *)request handler:(void(^)(SENGPublicKeyResponse *_Nullable response, NSError *_Nullable error))handler;


@end


#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface SENGOauthService : GRPCProtoService<SENGOauthService2, SENGOauthService>
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions;
// The following methods belong to a set of old APIs that have been deprecated.
- (instancetype)initWithHost:(NSString *)host;
+ (instancetype)serviceWithHost:(NSString *)host;
@end
#endif

NS_ASSUME_NONNULL_END

