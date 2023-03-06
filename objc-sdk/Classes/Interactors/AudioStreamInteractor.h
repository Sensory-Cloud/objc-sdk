//
//  AudioStreamInteractor.h
//  Pods
//
//  Created by Niles Hacking on 3/3/23.
//

#ifndef AudioStreamInteractor_h
#define AudioStreamInteractor_h

/// Delegate protocol for receiving processed audio data
@protocol SENAudioStreamDelegate <NSObject>

/// Will be called periodically with the new audio stream data when the interactor is recording
///
/// - Parameter data: The audio data
- (void) didProcessAudio: (NSData*) data;

@end

/// Helper class for getting a stream of audio data from the device's microphone
@interface SENAudioStreamInteractor : NSObject

/// Shared instance
+ (instancetype) sharedInstance;

/// Delegate property that will receive audio data
@property (nonatomic, weak) id<SENAudioStreamDelegate> delegate;

/// Requests permission to record audio data from the user
///
/// The app must contain a purpose string in the `Info.plist` file with the key `NSMicrophoneUsageDescription` for the system to allow microphone permissions
/// - Parameter callback: Completion handler that will be called once permission has been requested, parameter will be true if the permission has been granted
-(void) requestAudioPermission: (void (^)(BOOL))callback;

/// Configures and sets up the Audio Stream Interactor
///
/// This *must* be called *after* getting audio record permissions for the user and *before* any audio can be recorded
/// Any call made to this after the initial configure call will result in a NOP
/// - Parameter error: Error pointer, set if an error occurs
/// - Returns: Success boolean, true if no error occurred
-(bool) configure: (out NSError**)error;

/// Starts audio recording
///
/// Processed audio is passed back via the `SENAudioStreamDelegate`
/// - Parameter error: error pointer, set if an error occurs
/// - Returns: Success boolean, true if no error occurred
-(bool) startRecording: (out NSError**)error;

/// Stops audio recording
///
/// - Parameter error: error pointer, set if an error occurs
/// - Returns: Success boolean, true if no error occurred
-(bool) stopRecording: (out NSError**)error;

@end

#endif /* AudioStreamInteractor_h */
