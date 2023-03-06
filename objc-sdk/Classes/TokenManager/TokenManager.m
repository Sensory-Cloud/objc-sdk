//
//  TokenManager.m
//  objc-sdk
//
//  Created by Niles Hacking on 2/22/23.
//

#import <Foundation/Foundation.h>
#import "TokenManager.h"
#import "OAuthService.h"
#import "GRPCClient/GRPCTransport.h"
#import "Oauth.pbrpc.h"
#import "Initializer.h"

static NSString * const kErrorDomain = @"ai.SensoryCloud.TokenManager";
static float const kExpirationBuffer = 300.0; // 5 minutes

@interface SENTokenManager ()
@property (readwrite) SENOAuthService* service;
@property NSString* token;
@property float expires;
@end

@implementation SENTokenManager

-(id)init: (SENOAuthService*)oauthService {
    if (self = [super init]) {
        self.service = oauthService;
    }
    return self;
}

-(NSString*)getAccessToken: (out NSError**)error {
    @synchronized (self) {
        NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
        if (self.token == nil || timestamp > self.expires - kExpirationBuffer) {
            if (![self fetchNewToken:error]) {
                return nil;
            }
        }
    }

    return self.token;
}

-(GRPCMutableCallOptions*)getAuthorizationMetadata: (out NSError**)error {
    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        if (error != nil) {
            *error = [SENInitializer getNotInitializedError];
        }
        return nil;
    }

    NSString* token = [self getAccessToken:error];
    if (token == nil) {
        return nil;
    }
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.oauth2AccessToken = token;
    if (config.isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    }
    return options;
}

-(void)deleteCachedToken {
    self.token = nil;
    self.expires = 0;
}

-(bool)fetchNewToken: (out NSError**)error {
    __block SENGTokenResponse* tokenResponse = nil;
    __block NSError* errorResponse = nil;

    dispatch_group_t fetchTokenGroup = dispatch_group_create();
    dispatch_group_enter(fetchTokenGroup);

    [[self service] getToken:^(SENGTokenResponse *response, NSError *error) {
        tokenResponse = response;
        errorResponse = error;
        dispatch_group_leave(fetchTokenGroup);
    }];

    // Generous timeout here as the oauth service should always call the handler first even if the server isn't responding
    dispatch_group_wait(fetchTokenGroup, dispatch_time(DISPATCH_TIME_NOW, 120 * NSEC_PER_SEC));

    if (tokenResponse.accessToken == nil) {
        if (errorResponse == nil) {
            NSString* description = @"No response received when fetching OAuth token";
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description};
            errorResponse = [NSError errorWithDomain:kErrorDomain code:GRPCErrorCodeDeadlineExceeded userInfo:userInfo];
        }
        if (error != nil) {
            *error = errorResponse;
        }
        return FALSE;
    }

    self.token = tokenResponse.accessToken;
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    self.expires = timestamp + tokenResponse.expiresIn;

    return TRUE;
}

@end
