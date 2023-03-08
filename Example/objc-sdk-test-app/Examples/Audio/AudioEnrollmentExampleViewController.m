//
//  AudioEnrollmentExampleViewController.m
//  objc-sdk-test-app
//
//  Created by Niles Hacking on 3/7/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#import "AudioEnrollmentExampleViewController.h"
#import <objc-sdk-umbrella.h>

@interface AudioEnrollmentExampleViewController ()
@property GRPCStreamingProtoCall* call;
@property SENAudioStreamInteractor* interactor;
@property SENAudioService* audioService;
@end

@implementation AudioEnrollmentExampleViewController

@synthesize dispatchQueue;

- (void) viewDidLoad {
    [super viewDidLoad];

    // Ensure microphone privileges are allowed before starting the example
    // Ensure there is a purpose string in the `Info.plist` file with the key `NSMicrophoneUsageDescription`
    // for the system to allow microphone permissions
    self.interactor = [SENAudioStreamInteractor sharedInstance];
    [[self interactor] requestAudioPermission:^(BOOL microphoneAllowed) {
        if (microphoneAllowed) {
            [self startAudioExample];
        } else {
            NSLog(@"Microphone permissions not allowed");
        }
    }];
}

// Ensure any open GRPC stream and audio recording are stopped when the view is dismissed
- (void) viewWillDisappear:(BOOL)animated {
    // Close any open GRPC stream
    if (self.call) {
        [self.call finish];
        self.call = nil;
    }

    // Stop audio recording (It is safe to call this even if the audio interactor is not currently recording)
    if (self.interactor) {
        NSError* audioError;
        if (![[self interactor] stopRecording:&audioError]) {
            NSLog(@"Failed to stop audio recording: %@", audioError.description);
        }
    }
}

- (void)startAudioExample {
    // Initialize audio service
    // NOTE: In a production app, the same tokenManager instance should be
    //       shared between every initialized service
    SENKeychainManager* credentialStore = [SENKeychainManager alloc];
    SENOAuthService* oauthService = [[SENOAuthService alloc] init: credentialStore];
    SENTokenManager* tokenManager = [[SENTokenManager alloc] init: oauthService];
    SENAudioService* audioService = [[SENAudioService alloc] init: tokenManager];
    self.audioService = audioService;

    // Setup a dispatch queue that will receive updates from the GRPC stream
    dispatch_queue_attr_t qos = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_USER_INTERACTIVE, -1);
    dispatchQueue = dispatch_queue_create("GRPCStreamingQueue", qos);

    // Initialize + configure the audio stream interactor, remember to set the delegate
    SENAudioStreamInteractor* interactor = [self interactor];
    interactor.delegate = self;
    NSError* error;
    if (![interactor configure:&error]) {
        NSLog(@"Failed to configure audio interactor: %@", error.description);
        return;
    }

    // Create the configuration object for creating an audio enrollment
    // Available models can be received from the [audioService getModels:] call
    // User ID is a device generated identifier (usually a UUID) that should remain constant for all calls made by the same user
    SENGACreateEnrollmentConfig* config = [SENGACreateEnrollmentConfig message];
    config.modelName = @"wakeword-16kHz-open_sesame.ubm";
    config.userId = @"My-User-ID";
    config.description_p = @"My Enrollment";

    // Open a GRPC stream for creating an audio enrollment
    GRPCStreamingProtoCall* call = [audioService createEnrollmentWithConfig:config handler:self];
    self.call = call;

    // Start audio recording
    if (![interactor startRecording:&error]) {
        NSLog(@"Failed to start audio recording: %@", error.description);
        [call finish];
        return;
    }
}

// GRPCProtoResponseHandler protocol conformance, will be called with every response from the server
- (void)didReceiveProtoMessage:(GPBMessage *)message {
    // Cast the server response to the proper type
    SENGACreateEnrollmentResponse* response = (SENGACreateEnrollmentResponse*)message;
    if (response == nil) {
        return;
    }

    // The response contains info about the enrollment status
    // - audioEnergy
    // - percentComplete
    // For enrollments with liveness, two additional fields are populated
    // - modelPrompt - indicates what the user should say in order to proceed with the enrollment
    // - sectionPercentComplete - percent completion of the current ModelPrompt that has been spoken
    NSLog(@"Percent enrollment complete: %lld", response.percentComplete);

    // The response will include an enrollment ID once enrollment is complete
    if (![response.enrollmentId isEqualToString:@""]) {
        NSLog(@"Enrollment complete");

        // The server will automatically close the GRPC stream once enrollment is complete
    }
}

// GRPCProtoResponseHandler protocol conformance, will be called once the stream is closed
// Any errors generated by the stream will also be sent to this function
- (void)didCloseWithTrailingMetadata:(NSDictionary *)trailingMetadata error:(NSError *)error {
    // Stop audio recording once the stream has closed
    NSError* audioError;
    if (![[self interactor] stopRecording:&audioError]) {
        NSLog(@"Failed to stop audio recording: %@", audioError.description);
    }

    // Handle any errors that were generated
    if (error != nil) {
        NSLog(@"GRPC stream closed with error: %@", error.description);
        return;
    }

    NSLog(@"Successfully closed GRPC stream");
}

// SENAudioStreamDelegate protocol conformance, will be called with audio data as the microphone collects it
- (void)didProcessAudio:(NSData *)data {
    // Ignore the update if there is no open GRPC stream
    if (![self call]) {
        return;
    }

    // Send the Audio data to the server for processing
    SENGACreateEnrollmentRequest* request = [SENGACreateEnrollmentRequest message];
    request.audioContent = data;
    [[self call] writeMessage:request];
}

@end
