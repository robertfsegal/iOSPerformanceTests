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

static const int kNumTests = 10000;

-(void)testNSArray
{
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:kNumTests];
    
    for (int i = 0; i < kNumTests; i++)
    {
        [arr addObject:[[NSObject alloc] init]];
    }
    
    for (int i = 0; i < kNumTests; i++)
    {
        NSObject *obj = arr[i];
        
        void * addr = &obj + 2;
    }
}

#include <vector>

using namespace std;

-(void)testSTLVector
{
    vector<NSObject *> arr(kNumTests);
    
    for (int i = 0; i < kNumTests; i++)
    {
        arr.push_back([[NSObject alloc] init]);
    }
    
    for (int i = 0; i < kNumTests; i++)
    {
        NSObject *obj = arr[i];
       
        void * addr = &obj + 2;
    }
}


@end
