//
//  KeychainManager.h
//  Pods
//
//  Created by Niles Hacking on 2/21/23.
//

#ifndef KeychainManager_h
#define KeychainManager_h

@interface SENKeychainManager : NSObject

- (bool)saveStringWithTag: (NSString*) tag
                    value: (NSString*)value
                 errorPtr:(out NSError **)error;

- (bool)saveDataWithTag: (NSString*)tag
                   data: (NSData*)data
               errorPtr:(out NSError **)error;

- (NSString*)getStringWithTag: (NSString*)tag
                     errorPtr:(out NSError **)error;

- (NSData*)getDataWithTag: (NSString*)tag
                 errorPtr:(out NSError **)error;

- (bool)deleteEntryWithTag: (NSString*)tag
                  errorPtr:(out NSError **)error;

@end

#endif /* KeychainManager_h */
