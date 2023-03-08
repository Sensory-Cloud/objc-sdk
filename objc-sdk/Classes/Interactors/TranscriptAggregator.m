//
//  TranscriptAggregator.m
//  objc-sdk
//
//  Created by Niles Hacking on 3/7/23.
//

#import <Foundation/Foundation.h>
#import "TranscriptAggregator.h"
#import "Audio.pbrpc.h"

static NSString * const kErrorDomain = @"ai.SensoryCloud.TranscriptAggregator";

@implementation SENTranscriptAggregator

-(bool) processResponse: (SENGATranscribeWordResponse*) response errorPtr: (out NSError**)error {
    if([response wordsArray_Count] == 0) {
        return true;
    }

    // Expand the internal word list if needed
    uint64_t responseSize = [response lastWordIndex] + 1;
    while (responseSize > [_wordList count]) {
        [_wordList addObject:[SENGATranscribeWord message]];
    }

    // Copy over the words in the response to the word list
    for (SENGATranscribeWord* word in [response wordsArray]) {
        if ([word wordIndex] >= [_wordList count]) {
            if (error != nil) {
                NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Response contained a word with an out of bounds index"};
                *error = [NSError errorWithDomain:kErrorDomain code:errSecInternalError userInfo:userInfo];
            }
            return false;
        }
        _wordList[[word wordIndex]] = word;
    }

    // Shrink the internal word list if needed
    while (responseSize < [_wordList count]) {
        [_wordList removeLastObject];
    }

    return true;
}

-(NSString*) getTranscriptWithDelimiter: (NSString*)delimiter {
    NSMutableString* transcript = [NSMutableString string];

    for (SENGATranscribeWord* word in _wordList) {
        [transcript appendString: [self trimString: [word word]]];
        [transcript appendString:delimiter];
    }

    return transcript;
}

-(NSString*) trimString: (NSString*)string {
    NSCharacterSet* whitespaces = [NSCharacterSet characterSetWithCharactersInString:@" \n\r\t"];
    return [string stringByTrimmingCharactersInSet:whitespaces];
}

@end
