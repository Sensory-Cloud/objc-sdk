//
//  objc-sdkTests.m
//  objc-sdkTests
//
//  Created by Niles Hacking on 02/09/2023.
//  Copyright (c) 2023 Niles Hacking. All rights reserved.
//

// https://github.com/Specta/Specta

SpecBegin(InitialSpecs)

describe(@"these will pass", ^{
    
    it(@"can do maths", ^{
        expect(1).beLessThan(23);
    });
    
    it(@"can read", ^{
        expect(@"team").toNot.contain(@"I");
    });
});

describe(@"Testing imports", ^{
    it(@"can do maths", ^{
        expect(1).beLessThan(2);
    });
});

SpecEnd

