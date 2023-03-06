//
//  KeychainManagerTests.m
//  objc-sdk_Tests
//
//  Created by Niles Hacking on 2/21/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

@interface KeychainManagerTests : XCTestCase

@end

NSString* prevClientId;
NSString* prevClientSecret;

@implementation KeychainManagerTests

+ (void)setUp {
    SENKeychainManager* manager = [SENKeychainManager alloc];

    NSString* clientId = [manager getClientId:nil];
    if (clientId != nil) {
        prevClientId = clientId;
    }
    NSString* clientSecret = [manager getClientSecret:nil];
    if (clientSecret != nil) {
        prevClientSecret = clientSecret;
    }

    [manager deleteEntryWithTag:@"Sensory_Client_ID" errorPtr:nil];
    [manager deleteEntryWithTag:@"Sensory_Client_Secret" errorPtr:nil];
}

+ (void)tearDown {
    if (prevClientId == nil || prevClientSecret == nil) {
        return;
    }

    SENKeychainManager* manager = [SENKeychainManager alloc];
    [manager saveCredentials:prevClientId secret:prevClientSecret errorPtr:nil];
}

- (void)testSaveGetDeleteData {
    SENKeychainManager *manager = [SENKeychainManager alloc];

    NSString* mockTag = @"keychain-tag";
    NSData* mockData = [@"This is a mock string" dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error;
    bool status = [manager saveDataWithTag:mockTag data:mockData errorPtr:&error];

    XCTAssertTrue(status);
    XCTAssertNil(error);

    NSData* result = [manager getDataWithTag:mockTag errorPtr:&error];

    XCTAssertNil(error);
    XCTAssertTrue([result isEqualToData:mockData]);

    NSData* newData = [@"This is a new mock string" dataUsingEncoding:NSUTF8StringEncoding];
    status = [manager saveDataWithTag:mockTag data:newData errorPtr:&error];

    XCTAssertTrue(status);
    XCTAssertNil(error);

    result = [manager getDataWithTag:mockTag errorPtr:&error];

    XCTAssertNil(error);
    XCTAssertTrue([result isEqualToData:newData]);

    status = [manager deleteEntryWithTag:mockTag errorPtr:&error];

    XCTAssertTrue(status);
    XCTAssertNil(error);

    result = [manager getDataWithTag:mockTag errorPtr:&error];

    XCTAssertNil(result);
    XCTAssertNotNil(error);
}

- (void)testSaveGetDeleteString {
    SENKeychainManager *manager = [SENKeychainManager alloc];

    NSString* mockTag = @"keychain-tag";
    NSString* mockString = @"This is a mock string";
    NSError* error;
    bool status = [manager saveStringWithTag:mockTag value:mockString errorPtr:&error];

    XCTAssertTrue(status);
    XCTAssertNil(error);

    NSString* result = [manager getStringWithTag:mockTag errorPtr:&error];

    XCTAssertNil(error);
    XCTAssertTrue([result isEqualToString:mockString]);

    NSString* newString = @"This is a new mock string";
    status = [manager saveStringWithTag:mockTag value:newString errorPtr:&error];

    XCTAssertTrue(status);
    XCTAssertNil(error);

    result = [manager getStringWithTag:mockTag errorPtr:&error];

    XCTAssertNil(error);
    XCTAssertTrue([result isEqualToString:newString]);

    status = [manager deleteEntryWithTag:mockTag errorPtr:&error];

    XCTAssertTrue(status);
    XCTAssertNil(error);

    result = [manager getStringWithTag:mockTag errorPtr:&error];

    XCTAssertNil(result);
    XCTAssertNotNil(error);
}

- (void)testSaveGetCredentials {
    SENKeychainManager *manager = [SENKeychainManager alloc];

    NSError* error;
    NSString* clientId = [manager getClientId:&error];

    XCTAssertNil(clientId);
    XCTAssertNotNil(error);

    NSString* clientSecret = [manager getClientSecret:&error];

    XCTAssertNil(clientSecret);
    XCTAssertNotNil(error);

    NSString* mockClientId = @"Mock client id";
    NSString* mockSecret = @"Mock client secret";
    error = nil;
    bool status = [manager saveCredentials:mockClientId secret:mockSecret errorPtr:&error];

    XCTAssertTrue(status);
    XCTAssertNil(error);

    clientId = [manager getClientId:&error];

    XCTAssertTrue([clientId isEqualToString:mockClientId]);
    XCTAssertNil(error);

    clientSecret = [manager getClientSecret:&error];

    XCTAssertTrue([clientSecret isEqualToString:mockSecret]);
    XCTAssertNil(error);
}

@end
