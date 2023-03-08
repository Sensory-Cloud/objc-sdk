//
//  AudioTranscriptionExampleViewController.m
//  objc-sdk-test-app
//
//  Created by Niles Hacking on 3/7/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#import "AudioTranscriptionExampleViewController.h"
#import <SensoryCloud/SensoryCloud-umbrella.h>

@interface AudioTranscriptionExampleViewController ()
@property GRPCStreamingProtoCall* call;
@property SENAudioStreamInteractor* interactor;
@property SENAudioService* audioService;
@property SENTranscriptAggregator* transcriptAggregator;
@end

@implementation AudioTranscriptionExampleViewController

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

    // Create the configuration object for audio transcription
    // Available models can be received from the [audioService getModels:] call
    // User ID is a device generated identifier (usually a UUID) that should remain constant for all calls made by the same user
    SENGATranscribeConfig* config = [SENGATranscribeConfig message];
    config.modelName = @"speech_recognition_en";
    config.userId = @"My-User-ID";
    config.enablePunctuationCapitalization = false;

    // Initialize a transcript aggregator
    [self setTranscriptAggregator: [[SENTranscriptAggregator alloc] init]];

    // Open a GRPC stream for audio transcription
    GRPCStreamingProtoCall* call = [audioService transcribeAudioWithConfig:config handler:self];
    self.call = call;

    // Start audio recording
    if (![interactor startRecording:&error]) {
        NSLog(@"Failed to start audio recording: %@", error.description);
        [call finish];
        return;
    }
}

// Remember to close the GRPC stream and stop recording once finished with the transcript stream
- (void) stopAudioExample {
    if (self.call) {
        [self.call finish];
        self.call = nil;
    }
}

// GRPCProtoResponseHandler protocol conformance, will be called with every response from the server
- (void)didReceiveProtoMessage:(GPBMessage *)message {
    // Cast the server response to the proper type
    SENGATranscribeResponse* response = (SENGATranscribeResponse*)message;
    if (response == nil) {
        return;
    }

    // Send the response to the transcript aggregator that will aggregate the sliding-window server responses
    NSError* transcriptError;
    if (![[self transcriptAggregator] processResponse:response.wordList errorPtr:&transcriptError]) {
        NSLog(@"Failed to update transcript: %@", transcriptError.description);
        return;
    }

    // Call getTranscriptWithDelimiter to get the full transcript
    // transcriptAggregator.wordList contains the full word list with associated metadata such as word timings
    NSLog(@"Transcript: %@", [[self transcriptAggregator] getTranscriptWithDelimiter:@" "]);
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
    SENGATranscribeRequest* request = [SENGATranscribeRequest message];
    request.audioContent = data;
    [[self call] writeMessage:request];
}

@end
