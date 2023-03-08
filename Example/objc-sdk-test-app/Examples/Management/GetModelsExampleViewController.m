//
//  GetModelsExampleViewController.m
//  objc-sdk-test-app
//
//  Created by Niles Hacking on 3/8/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#import "GetModelsExampleViewController.h"
#import <objc-sdk-umbrella.h>

@interface GetModelsExampleViewController ()
@property SENAudioService* audioService;
@property SENVideoService* videoService;
@end

@implementation GetModelsExampleViewController

- (void) viewDidLoad {
    [super viewDidLoad];

    [self startGetModelsExample];
}

- (void)startGetModelsExample {
    // Initialize audio + video service
    // NOTE: In a production app, the same tokenManager instance should be
    //       shared between every initialized service
    SENKeychainManager* credentialStore = [SENKeychainManager alloc];
    SENOAuthService* oauthService = [[SENOAuthService alloc] init: credentialStore];
    SENTokenManager* tokenManager = [[SENTokenManager alloc] init: oauthService];
    SENAudioService* audioService = [[SENAudioService alloc] init: tokenManager];
    self.audioService = audioService;
    SENVideoService* videoService = [[SENVideoService alloc] init: tokenManager];
    self.videoService = videoService;

    // Request a list of available audio models
    [audioService getModels:^(SENGAGetModelsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error occurred while requesting audio models: %@", error.description);
            return;
        }

        // The response contains a list of available audio models
        NSLog(@"Audio Models:");
        for (SENGAAudioModel* model in [response modelsArray]) {
            // Each model includes the following properties
            // - name - The name of the model, used when calling other audio service functions
            // - IsEnrollable - Tells if the model can be used to create an enrollment
            // - ModelType - Tells the type of the model and its general function
            // - FixedPhrase - For speech-based models only. Indicates if a specific phrase must be said and what that phrase is
            // - SampleRate - The audio sample rate required by the model, usually 16kHz (16000)
            // - isLivenessSupported - Indicates if the model supports liveness for enrollment and authentication
            NSLog(@"%@", model.name);
        }
        NSLog(@"\n");

        // Now that all audio models have been requested, request the vision models
        // Audio models and vision models are requested sequentially here solely so that the NSLogs don't get intermingled
        [self getVisionModels];
    }];


}

- (void)getVisionModels {
    // Request a list of available vision models
    [self.videoService getModels:^(SENGVGetModelsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error occurred while requesting vision models: %@", error.description);
            return;
        }

        // The response contains a list of available vision models
        NSLog(@"Vision Models:");
        for (SENGAAudioModel* model in [response modelsArray]) {
            // Each model includes the following properties
            // - name - The name of the model, used when calling other video service functions
            // - IsEnrollable - Tells if the model can be used to create an enrollment
            // - ModelType - Tells the type of the model and its general function
            // - FixedObject - For recognition-based models only. Indicates if the model is built to recognize a specific object and what that object is
            // - isLivenessSupported - Indicates if the model supports liveness for enrollment and authentication
            NSLog(@"%@", model.name);
        }
        NSLog(@"\n");
    }];
}

@end
