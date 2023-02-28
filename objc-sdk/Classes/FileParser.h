//
//  FileParser.h
//  objc-sdk
//
//  Created by Niles Hacking on 2/28/23.
//

#ifndef INIFileParser_h
#define INIFileParser_h

@interface SENFileParser : NSObject

+ (struct SENInitConfig) parseConfigFile: (NSURL*)fileURL errorPtr: (out NSError**)error;

@end

#endif /* INIFileParser_h */
