//
//  FileParser.h
//  objc-sdk
//
//  Created by Niles Hacking on 2/28/23.
//

#ifndef INIFileParser_h
#define INIFileParser_h

/// Helper class for parsing `config.ini` files
///
/// This is *not* a full featured INI file parser. For example, this implementation ignores INI sections
@interface SENFileParser : NSObject

/// Parses an SDK configuration file into an SDK configuration object
///
/// Even if the configuration file includes configs for `deviceId` and `deviceName` it is recommended to override those in the returned config object with
/// device generated values so that each device using the app has a unique `deviceId`
/// - Parameters:
///   - fileURL: A file URL to the SDK configuration file
///   - error: Error pointer, will be set if an error occurs
/// - Returns: SDK configuration object that may be used for SDK initialization
+ (struct SENInitConfig) parseConfigFile: (NSURL*)fileURL errorPtr: (out NSError**)error;

@end

#endif /* INIFileParser_h */
