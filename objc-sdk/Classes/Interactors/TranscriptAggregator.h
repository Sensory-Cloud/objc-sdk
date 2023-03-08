//
//  TranscriptAggregator.h
//  objc-sdk
//
//  Created by Niles Hacking on 3/7/23.
//

#ifndef TranscriptAggregator_h
#define TranscriptAggregator_h

@class SENGATranscribeWord;
@class SENGATranscribeWordResponse;

/// A helper class that aggregates and stores transcript responses
///
/// This class can maintain the full transcript returned from the server's windowed response
@interface SENTranscriptAggregator : NSObject

/// The current raw transcript and associated metadata
@property NSMutableArray<SENGATranscribeWord*>* wordList;

/// Processes a single sliding-window response from the server
///
/// - Parameters:
///   - response: The server word list response
///   - error: Error pointer, set if an error occurs
/// - Returns: Success boolean, true if no error occurred
-(bool) processResponse: (SENGATranscribeWordResponse*) response errorPtr: (out NSError**)error;

/// The full transcript as computed from the current word list
/// - Parameter delimiter: delimiter character(s) to put between transcript words
/// - Returns: The full transcript as a string
-(NSString*) getTranscriptWithDelimiter: (NSString*)delimiter;

@end

#endif /* TranscriptAggregator_h */
