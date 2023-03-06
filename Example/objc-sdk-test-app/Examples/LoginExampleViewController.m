//
//  LoginExampleViewController.m
//  objc-sdk-test-app
//
//  Created by Niles Hacking on 3/2/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#import "LoginExampleViewController.h"
#import <objc_sdk/objc-sdk-umbrella.h>

@implementation LoginExampleViewController

- (IBAction)initSDK:(id)sender {

    // Load the file URL for the config.ini file
    NSURL* fileURL = [[NSBundle mainBundle] URLForResource:@"config" withExtension:@"ini"];
    if (fileURL == nil) {
        NSLog(@"Config file not found");
        return;
    }

    // Use the Sensory Cloud SDK to parse the file into a config object
    NSError* error;
    struct SENInitConfig config = [SENFileParser parseConfigFile:fileURL errorPtr:&error];
    if (error != nil) {
        NSLog(@"Could not parse config file: %@", error.description);
        return;
    }

    // Even if the config file includes a device id/device name it is recommended to override them
    // So that every device running the app has a unique device id
    NSString* deviceId = [[NSUserDefaults standardUserDefaults] stringForKey:@"deviceId"];
    if (deviceId == nil) {
        deviceId = [[NSUUID UUID] UUIDString];
        [[NSUserDefaults standardUserDefaults] setObject:deviceId forKey:@"deviceId"];
    }
    config.deviceId = deviceId;
    config.deviceName = @"Objective-C SDK example device";

    // Initialize a secure credential store and OAuth service
    SENKeychainManager* credentialStore = [SENKeychainManager alloc];
    SENOAuthService* oauthService = [[SENOAuthService alloc] init:credentialStore];

    // Declare handler function to handle the SDK initialization response
    void (^loginHandler)(SENGDeviceResponse*, NSError*) = ^void (SENGDeviceResponse* response, NSError* error) {
        if (error != nil) {
            NSLog(@"SDK initialization failed: %@", error.description);
            return;
        }

        if (response == nil) {
            NSLog(@"This device has been previously enrolled");
        } else {
            NSLog(@"Successfully enrolled device: %@", response.name);
        }

        NSLog(@"Successful SDK initialization!");
        [self showExamples];
    };

    // Initialize the SDK
    [SENInitializer initializeWithConfig: config
                            oAuthService: oauthService
                               jwtSigner: nil
                                 handler: loginHandler];
}

// Segue to the example select screen
- (void) showExamples {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"showExamples" sender:self];
    });
}

// Deletes any locally saved device info, effectively "logs out" the device
// Note - It is important to rotate the device ID when "logging out" and logging back in
- (IBAction)clearCredentials:(id)sender {
    // Deletes the OAuth clientID/clientSecret
    SENKeychainManager* manager = [SENKeychainManager alloc];
    NSError* error;
    if (![manager deleteSavedCredentials:&error]) {
        NSLog(@"Failed to delete locally saved credentials: %@", error.description);
    }

    // Deletes the locally generated device ID so that a new one is
    // generated the next time the SDK is initialized
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"deviceId"];
    NSLog(@"Successfully cleared device credentials");
}

@end
