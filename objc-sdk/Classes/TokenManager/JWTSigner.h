//
//  JWTSigner.h
//  objc-sdk
//
//  Created by Niles Hacking on 2/28/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SENJWTSigner <NSObject>

- (NSString*)signJWTWithKey: (NSString*)key
                 deviceName: (NSString*)deviceName
                   tenantId: (NSString*)tenantId
                   clientId: (NSString*)clientId
                   errorPtr: (out NSError **)error;

@end

NS_ASSUME_NONNULL_END
