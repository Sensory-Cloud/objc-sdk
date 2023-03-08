//
//  VisionEnrollmentExampleViewController.m
//  objc-sdk-test-app
//
//  Created by Niles Hacking on 3/8/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#import "VisionEnrollmentExampleViewController.h"
#import <SensoryCloud/SensoryCloud-umbrella.h>

@interface VisionEnrollmentExampleViewController ()
@property GRPCStreamingProtoCall* call;
@property SENVideoStreamInteractor* interactor;
@property SENVideoService* videoService;
@end

@implementation VisionEnrollmentExampleViewController

@synthesize dispatchQueue;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Ensure camera privileges are allowed before starting the example
    // Ensure there is a purpose string in the `Info.plist` file with the key `NSCameraUsageDescription`
    // for the system to allow camera permissions
    self.interactor = [SENVideoStreamInteractor sharedInstance];
    [[self interactor] requestVideoPermission:^(BOOL cameraAllowed) {
        if (cameraAllowed) {
            [self startVideoExample];
        } else {
            NSLog(@"Camera permissions not allowed");
        }
    }];
}

// Ensure any open GRPC stream and video recording are stopped when the view is dismissed
- (void)viewWillDisappear:(BOOL)animated {
    if (self.call) {
        [self.call finish];
        self.call = nil;
    }
}

- (void)startVideoExample {
    // Initialize video service
    // NOTE: In a production app, the same tokenManager instance should be
    //       shared between every initialized service
    SENKeychainManager* credentialStore = [SENKeychainManager alloc];
    SENOAuthService* oauthService = [[SENOAuthService alloc] init: credentialStore];
    SENTokenManager* tokenManager = [[SENTokenManager alloc] init: oauthService];
    SENVideoService* videoService = [[SENVideoService alloc] init: tokenManager];
    self.videoService = videoService;

    // Setup a dispatch queue that will receive updates from the GRPC stream
    dispatch_queue_attr_t qos = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_USER_INTERACTIVE, -1);
    dispatchQueue = dispatch_queue_create("GRPCStreamingQueue", qos);

    // Initialize + configure the video stream interactor, remember to set the delegate
    SENVideoStreamInteractor* interactor = [self interactor];
    interactor.delegate = self;
    NSError* error;
    if (![interactor configure:&error]) {
        NSLog(@"Failed to configure video interactor: %@", error.description);
        return;
    }
    [self setupCameraPreview];

    // Create the configuration object for vision enrollment
    // Available models can be received from the [videoService getModels:] call
    // User ID is a device generated identifier (usually a UUID) that should remain constant for all calls made by the same user
    SENGVCreateEnrollmentConfig* config = [SENGVCreateEnrollmentConfig message];
    config.modelName = @"face_recognition";
    config.userId = @"My-User-ID";
    config.description_p = @"My vision enrollment";
    config.isLivenessEnabled = false;

    // Open the GRPC stream for vision enrollment
    GRPCStreamingProtoCall* call = [videoService createEnrollmentWithConfig:config handler:self];
    self.call = call;

    // Start the video recording
    if (![interactor startRecording:&error]) {
        NSLog(@"Failed to start camera recording: %@", error.description);
        [call finish];
        return;
    }
    // Take an initial photo to upload to the server
    [interactor takePhoto];
}

// Sets up a UIView to show the camera preview
- (void)setupCameraPreview {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.videoPreviewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.interactor.session];
        if (self.videoPreviewLayer) {
            self.videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
            self.videoPreviewLayer.connection.videoOrientation = AVCaptureVideoOrientationPortrait;
            self.videoPreviewLayer.frame = self.previewView.bounds;
            [self.previewView.layer addSublayer:self.videoPreviewLayer];
        }
    });
}

// GRPCProtoResponseHandler protocol conformance, will be called with every response from the server
- (void)didReceiveProtoMessage:(GPBMessage *)message {
    SENGVCreateEnrollmentResponse* response = (SENGVCreateEnrollmentResponse*)message;
    if (response == nil) {
        return;
    }

    // The response contains info about the enrollment status
    // - percentComplete
    // - isAlive - (only when liveness is enabled) tells if the frame was determined to be live
    NSLog(@"Percent enrollment complete: %lld", response.percentComplete);

    // The response will include an enrollment ID once enrollment is complete
    if (![response.enrollmentId isEqualToString:@""]) {
        NSLog(@"Enrollment complete");

        // The server will automatically close the GRPC stream once enrollment is complete
    } else {
        // Upload the next video frame until the enrollment is complete
        [self.interactor takePhoto];
    }
}

// GRPCProtoResponseHandler protocol conformance, will be called once the stream is closed
// Any errors generated by the stream will also be sent to this function
- (void)didCloseWithTrailingMetadata:(NSDictionary *)trailingMetadata error:(NSError *)error {
    // Stop the video recording once the stream has closed
    [[self interactor] stopRecording];

    // Handle any errors that were generated
    if (error != nil) {
        NSLog(@"GRPC stream closed with error: %@", error.description);
        return;
    }

    NSLog(@"Successfully closed GRPC stream");
}

// SENVideoStreamDelegate protocol conformance, will be called with photo data after each call to [self.interactor takePhoto]
- (void)didTakePhoto:(NSData *)photo {
    // Ignore the update if there is no open GRPC stream
    if (![self call]) {
        return;
    }

    // Send the video data to the server for processing
    SENGVCreateEnrollmentRequest* request = [SENGVCreateEnrollmentRequest message];
    request.imageContent = photo;
    [[self call] writeMessage:request];
}

// SENVideoStreamDelegate protocol conformance, will be called if an error occurs while taking a photo
- (void)takePhotoFailedWithError:(NSError *)error {
    NSLog(@"Failed to take photo: %@", error.description);
}

@end
