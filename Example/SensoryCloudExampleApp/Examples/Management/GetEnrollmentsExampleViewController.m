//
//  GetEnrollmentsExampleViewController.m
//  objc-sdk-test-app
//
//  Created by Niles Hacking on 3/8/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#import "GetEnrollmentsExampleViewController.h"
#import <SensoryCloud/SensoryCloud-umbrella.h>

@interface GetEnrollmentsExampleViewController ()
@property SENManagementService* managementService;
@end

@implementation GetEnrollmentsExampleViewController

- (void) viewDidLoad {
    [super viewDidLoad];

    [self startGetEnrollmentsExample];
}

- (void)startGetEnrollmentsExample {
    // Initialize audio + video service
    // NOTE: In a production app, the same tokenManager instance should be
    //       shared between every initialized service
    SENKeychainManager* credentialStore = [SENKeychainManager alloc];
    SENOAuthService* oauthService = [[SENOAuthService alloc] init: credentialStore];
    SENTokenManager* tokenManager = [[SENTokenManager alloc] init: oauthService];
    SENManagementService* managementService = [[SENManagementService alloc] init: tokenManager];
    self.managementService = managementService;

    // User ID is a device generated identifier (usually a UUID)
    // The userId should match the userID which was used when the enrollment was initially created
    NSString* userId = @"My-User-ID";

    [managementService getEnrollments:userId handler:^(SENGGetEnrollmentsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error occurred while requesting enrollments: %@", error.description);
        }

        NSLog(@"Enrollments:");
        for (SENGEnrollmentResponse* enrollment in [response enrollmentsArray]) {
            // Each enrollment includes the following properties
            // - id_p - The enrollmentID
            //   - NOTE: `id` is the automatically generated field that all GRPC classes contain and `id_p` is the enrollment ID
            // - description_p - The description entered at enrollment time
            //   - NOTE: `description` is the automatically generated field that all GRPC classes contain and `description_p` is the enrollment description
            // - modelName/Type/Version - Info about the model used to create the enrollment
            // - deviceId/Name - Info about the device used to create the enrollment
            NSLog(@"%@", enrollment.id_p);
        }
    }];
}

@end
