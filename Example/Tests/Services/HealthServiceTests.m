//
//  HealthServiceTests.m
//  objc-sdk_Tests
//
//  Created by Niles Hacking on 2/17/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

@interface HealthServiceTests : XCTestCase

@end

@implementation HealthServiceTests

- (void)testGetHealth {
    XCTestExpectation *expectResponse = [self expectationWithDescription: @"Server response should be received"];

    SENHealthService *service = [SENHealthService alloc];
    GRPCUnaryResponseHandler *handler =
    [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:
     ^(SENGServerHealthResponse *response, NSError *error) {
        if (response) {
            NSLog(@"Success");
            [expectResponse fulfill];
        } else {
            NSLog(@"Error: %@", error);
            XCTFail(@"An error should not be produced");
        }
    } responseDispatchQueue:nil];
    [service getHealth:handler];

    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout error: %@", error);
        }
    }];
}

@end
