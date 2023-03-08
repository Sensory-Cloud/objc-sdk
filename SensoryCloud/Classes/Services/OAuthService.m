//
//  OAuthService.m
//  objc-sdk
//
//  Created by Niles Hacking on 2/17/23.
//

#import <Foundation/Foundation.h>
#import "OAuthService.h"
#import "GRPCClient/GRPCTransport.h"
#import "Oauth.pbrpc.h"
#import "Device.pbrpc.h"
#import "SecureCredentialStore.h"
#import "Initializer.h"

static NSString * const kErrorDomain = @"ai.SensoryCloud.OAuthService";

@interface SENOAuthService ()
@property (readwrite, weak) id<SENSecureCredentialStore> credentialStore;
@property dispatch_queue_t responseQueue;
@end

@implementation SENOAuthService

-(id)init: (id<SENSecureCredentialStore>)credentialStore {
    if (self = [super init]) {
        self.credentialStore = credentialStore;
        dispatch_queue_attr_t qos = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_USER_INITIATED, -1);
        self.responseQueue = dispatch_queue_create("oauthServiceQueue", qos);
    }
    return self;
}

- (NSString*) generateClientId {
    return [[NSUUID UUID] UUIDString];
}

- (NSString*) generateClientSecret: (out NSError**)error {
    NSMutableData *data = [NSMutableData dataWithLength:32];
    OSStatus status = SecRandomCopyBytes(kSecRandomDefault, 32, data.mutableBytes);
    if (status != errSecSuccess) {
        NSString* description = @"Insufficient device entropy for random key generation";
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description};
        *error = [NSError errorWithDomain:kErrorDomain code:GRPCErrorCodeInternal userInfo:userInfo];
        return nil;
    }
    return [data base64EncodedStringWithOptions:0];
}

- (void)enrollDevice: (NSString*)name
          credential: (NSString*)credential
            clientId: (NSString*)clientId
        clientSecret: (NSString*)clientSecret
             handler: (void (^)(SENGDeviceResponse*, NSError*))handler
{
    NSError* error;
    SENGDeviceService *service = [self getDeviceService: &error];
    if (error != nil) {
        handler(nil, error);
    }

    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        handler(nil, [SENInitializer getNotInitializedError]);
        return;
    }

    SENGEnrollDeviceRequest *request = [SENGEnrollDeviceRequest message];
    SENGGenericClient *client = [SENGGenericClient message];
    client.clientId = clientId;
    client.secret = clientSecret;
    request.name = config.deviceName;
    request.deviceId = config.deviceId;
    request.tenantId = config.tenantId;
    request.client = client;
    request.credential = credential;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:self.responseQueue];
    [[service enrollDeviceWithMessage:request responseHandler:rspHandler callOptions:nil] start];
}

- (void)getToken: (void (^)(SENGTokenResponse*, NSError*))handler
{
    NSError* error;
    SENGOauthService *service = [self getOAuthService: &error];
    if (error != nil) {
        handler(nil, error);
    }
    NSString* clientId = [[self credentialStore] getClientId: &error];
    if (error != nil) {
        handler(nil, error);
        return;
    }
    NSString* clientSecret = [[self credentialStore] getClientSecret: &error];
    if (error != nil) {
        handler(nil, error);
        return;
    }

    SENGTokenRequest *request = [SENGTokenRequest message];
    request.clientId = clientId;
    request.secret = clientSecret;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:self.responseQueue];
    [[service getTokenWithMessage:request responseHandler:rspHandler callOptions:nil] start];
}

- (void)renewDeviceCredential: (NSString*)credential
                      handler: (void (^)(SENGDeviceResponse*, NSError*))handler
{
    NSError* error;
    SENGDeviceService *service = [self getDeviceService: &error];
    if (error != nil) {
        handler(nil, error);
        return;
    }
    NSString* clientId = [[self credentialStore] getClientId: &error];
    if (error != nil) {
        handler(nil, error);
        return;
    }
    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        handler(nil, [SENInitializer getNotInitializedError]);
        return;
    }

    SENGRenewDeviceCredentialRequest *request = [SENGRenewDeviceCredentialRequest message];
    request.deviceId = config.deviceId;
    request.clientId = clientId;
    request.tenantId = config.tenantId;
    request.credential = credential;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:self.responseQueue];
    [[service renewDeviceCredentialWithMessage:request responseHandler:rspHandler callOptions:nil] start];
}

- (void)getWhoAmI: (void (^)(SENGDeviceResponse*, NSError*))handler {
    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        handler(nil, [SENInitializer getNotInitializedError]);
        return;
    }

    void (^getTokenHandler)(SENGTokenResponse*, NSError*) = ^void (SENGTokenResponse* response, NSError* error) {
        if (response == nil) {
            handler(nil, error);
            return;
        }

        SENGOauthService *service = [self getOAuthService: &error];
        if (error != nil) {
            handler(nil, error);
            return;
        }
        GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
        options.oauth2AccessToken = response.accessToken;
        if (config.isSecure) {
            options.transport = GRPCDefaultTransportImplList.core_secure;
        } else {
            options.transport = GRPCDefaultTransportImplList.core_insecure;
        }
        SENGWhoAmIRequest *request = [SENGWhoAmIRequest message];

        GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:self.responseQueue];
        [[service getWhoAmIWithMessage:request responseHandler:rspHandler callOptions:options] start];
    };

    [self getToken:getTokenHandler];
}

- (SENGDeviceService*)getDeviceService: (out NSError**)error {
    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        if (error != nil) {
            *error = [SENInitializer getNotInitializedError];
        }
        return nil;
    }

    GRPCMutableCallOptions* options = [[GRPCMutableCallOptions alloc] init];
    if (config.isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    }

    SENGDeviceService* service = [[SENGDeviceService alloc] initWithHost:config.fullyQualifiedDomainName callOptions:options];
    return service;
}

- (SENGOauthService*)getOAuthService: (out NSError**)error {
    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        if (error != nil) {
            *error = [SENInitializer getNotInitializedError];
        }
        return nil;
    }

    GRPCMutableCallOptions* options = [[GRPCMutableCallOptions alloc] init];
    if (config.isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    }

    SENGOauthService* service = [[SENGOauthService alloc] initWithHost:config.fullyQualifiedDomainName callOptions:options];
    return service;
}

@end
