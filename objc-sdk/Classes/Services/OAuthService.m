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

// TODO: rm
static NSString * const kHostAddress = @"localhost:50050";

@interface SENOAuthService ()
@property (readwrite, weak) id<SENSecureCredentialStore> credentialStore;
@end

@implementation SENOAuthService

-(id)init: (id<SENSecureCredentialStore>)credentialStore {
    if (self = [super init]) {
        self.credentialStore = credentialStore;
    }
    return self;
}

- (NSString*) generateClientId {
    return [[NSUUID UUID] UUIDString];
}

- (NSString*) generateClientSecret {
    NSMutableData *data = [NSMutableData dataWithLength:32];
    OSStatus status = SecRandomCopyBytes(kSecRandomDefault, 32, data.mutableBytes);
    if (status != errSecSuccess) {
        // TODO: better error handling
        NSLog(@"Insecure client secret generation");
    }
    return [data base64EncodedStringWithOptions:0];
}

- (void)enrollDevice: (NSString*)name
          credential: (NSString*)credential
            clientId: (NSString*)clientId
        clientSecret: (NSString*)clientSecret
             handler: (GRPCUnaryResponseHandler<SENGDeviceResponse*>*)handler
{
    SENGDeviceService *service = [self getDeviceService];

    SENGEnrollDeviceRequest *request = [SENGEnrollDeviceRequest message];
    SENGGenericClient *client = [SENGGenericClient message];
    client.clientId = clientId;
    client.secret = clientSecret;
    request.name = @"name"; // TODO: device name
    request.deviceId = @"deviceId"; // TODO: device id
    request.tenantId = @"tenantId"; // TODO: tenant id
    request.client = client;
    request.credential = credential;

    [[service enrollDeviceWithMessage:request responseHandler:handler callOptions:nil] start];
}

- (void)getToken: (void (^)(SENGTokenResponse*, NSError*))handler
{
    SENGOauthService *service = [self getOAuthService];

    NSError* error;
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

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:nil];
    [[service getTokenWithMessage:request responseHandler:rspHandler callOptions:nil] start];
}

- (void)renewDeviceCredential: (NSString*)clientId
                   credential: (NSString*)credential
                      handler: (GRPCUnaryResponseHandler<SENGDeviceResponse*>*)handler
{
    SENGDeviceService *service = [self getDeviceService];

    SENGRenewDeviceCredentialRequest *request = [SENGRenewDeviceCredentialRequest message];
    request.deviceId = @"deviceId"; // TODO: device id
    request.clientId = clientId;
    request.tenantId = @"tenantId"; // TODO: tenant id
    request.credential = credential;

    [[service renewDeviceCredentialWithMessage:request responseHandler:handler callOptions:nil] start];
}

- (SENGDeviceService*)getDeviceService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGDeviceService *service = [[SENGDeviceService alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}

- (SENGOauthService*)getOAuthService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGOauthService *service = [[SENGOauthService alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}

@end
