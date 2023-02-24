//
//  SecureCredentialStore.h
//  objc-sdk
//
//  Created by Niles Hacking on 2/22/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SENSecureCredentialStore <NSObject>

- (bool)saveCredentials: (NSString*)clientId
                 secret: (NSString*)secret
               errorPtr: (out NSError **)error;

- (NSString*)getClientId: (out NSError **)error;

- (NSString*)getClientSecret: (out NSError **)error;

@end

NS_ASSUME_NONNULL_END
