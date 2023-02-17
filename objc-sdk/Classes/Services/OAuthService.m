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

// TODO: rm
static NSString * const kHostAddress = @"localhost:50050";

@implementation SENOAuthService

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

- (void)getToken: (NSString*)clientId
          secret: (NSString*)secret
         handler: (GRPCUnaryResponseHandler<SENGTokenResponse*>*)handler
{
    SENGOauthService *service = [self getOAuthService];

    SENGTokenRequest *request = [SENGTokenRequest message];
    request.clientId = clientId;
    request.secret = secret;

    [[service getTokenWithMessage:request responseHandler:handler callOptions:nil] start];
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
