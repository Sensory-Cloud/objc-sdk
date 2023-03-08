//
//  VideoStreamInteractor.h
//  objc-sdk
//
//  Created by Niles Hacking on 3/6/23.
//

#ifndef VideoStreamInteractor_h
#define VideoStreamInteractor_h

#import <AVFoundation/AVFoundation.h>

/// Enum of the possible camera positions
typedef NS_ENUM(NSUInteger, SENCameraPosition) {
    /// The front facing camera
    kFront,
    /// The backward facing camera
    kBack
};

/// Delegate protocol for receiving pictures from `SENVideoStreamInteractor`
@protocol SENVideoStreamDelegate <NSObject>

/// Will be called after a photo has been taken
///
/// - Parameter photo: JPEG data of the photo
-(void) didTakePhoto: (NSData*) photo;

/// Will be called when an error occurs while taking a photo
///
/// - Parameter error: The error that occurred
-(void) takePhotoFailedWithError: (NSError*) error;

@end

/// Helper class for getting pictures from the device's camera
@interface SENVideoStreamInteractor : NSObject <AVCaptureVideoDataOutputSampleBufferDelegate>

/// Shared instance
+(instancetype) sharedInstance;

/// Delegate property that will receive photo data
@property (nonatomic, weak) id<SENVideoStreamDelegate> delegate;

/// The `AVCaptureSession` being used, this may be used to display a photo preview layer to the user
@property AVCaptureSession* session;

/// The JPEG compression used on processed data, A value between 0 and 1 where 0 is most compressed and 1 is highest quality
@property (nonatomic) double jpegCompression;

/// Requests permission to use the system camera
///
/// The app must contain a purpose string in the `Info.plist` file with the key `NSCameraUsageDescription` for the system to allow camera permissions
/// - Parameter callback: Completion handler that will be called once permission has been requested, parameter will be true if the permission has been granted
-(void) requestVideoPermission: (void (^)(BOOL))callback;

/// Configures and sets up the Video Stream Interactor
///
/// This *must* be called *after* getting camera record permissions from the user and *before* any video can be recorded
/// Any call made to this after the initial configure call will result in a NOP
///  - Parameter error: Error pointer, set if an error occurs
///  - Returns: Success boolean, true if no error occurred
-(bool) configure: (out NSError**)error;

/// Starts video recording
///
/// - Parameter error: Error pointer, set if an error occurs
/// - Returns: Success boolean, true if no error occurred
-(bool) startRecording: (out NSError**)error;

/// Stops video recording
-(void) stopRecording;

/// Sets the camera being used to either the forward or backward facing camera
///
/// By default, the forward facing camera is used
/// This may be called while the session is recording without causing any errors
/// - Parameters:
///   - position: The camera position to use
///   - error: Error pointer, set if an error occurs
/// - Returns: Success boolean, true if no error occurred
-(bool) setCameraPositionTo: (SENCameraPosition)position errorPtr: (out NSError**)error;

/// Requests for a photo to be taken
///
/// Results are returned via the `VideoStreamDelegate`
/// if this function is called multiple times in rapid succession, `VideoStreamDelegate` will only be called with a result once
-(void) takePhoto;

@end

#endif /* VideoStreamInteractor_h */
