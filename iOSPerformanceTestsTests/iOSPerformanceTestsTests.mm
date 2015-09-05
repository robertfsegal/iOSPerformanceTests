//
//  iOSPerformanceTestsTests.m
//  iOSPerformanceTestsTests
//
//  Created by Robert Segal on 2015-08-16.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <dispatch/dispatch.h>

@interface iOSPerformanceTestsTests : XCTestCase

@end

@implementation iOSPerformanceTestsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

static const int kNumTests = 1000000;

-(void)testAllocation
{
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 0; i < kNumTests; i++)
    {
        [arr addObject:[[NSObject alloc] init]];
    }
}

-(void)testAllocationWithNilZone
{
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 0; i < kNumTests; i++)
    {
        [arr addObject:[[NSObject allocWithZone:nil] init]];
    }
}


@end
