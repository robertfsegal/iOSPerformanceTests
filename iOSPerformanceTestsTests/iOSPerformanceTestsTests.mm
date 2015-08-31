//
//  iOSPerformanceTestsTests.m
//  iOSPerformanceTestsTests
//
//  Created by Robert Segal on 2015-08-16.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//
//  Based off of Mike Ash's article...
//
//    https://www.mikeash.com/pyblog/friday-qa-2010-12-17-custom-object-allocators-in-objective-c.html
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "MyCustomObject.h"
#import "MyCustomComplexObject.h"

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

-(void)testCustomObjectAllocator
{
    MyCustomObject *a = [[MyCustomObject alloc] init];
    
    [a release];
}

-(void)testCustomComplexObjectAllocator
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    NSLog(@"Allocating complex object...");
    
    NSTimeInterval total = 0;

    const int kNumTests = 10000000;
    
    for(int i = 0; i < kNumTests; i++)
    {
        NSTimeInterval start = [[NSDate date] timeIntervalSince1970];
        
        MyCustomComplexObject *a = [[[MyCustomComplexObject alloc] init] autorelease];
        [arr addObject:a];
        
        NSTimeInterval end = [[NSDate date] timeIntervalSince1970];

        total += end - start;
    }
    
    NSLog(@"Done allocations of complex object.  Total of %f seconds | Avg of %f seconds", total, total / kNumTests);
    
    for(int i = 0; i < kNumTests; i++)
    {
        MyCustomComplexObject *a = arr[i];
        [a release];
    }
    
    [arr removeAllObjects];
   
     NSLog(@"Allocating complex object from cache...");
    
    NSTimeInterval totalCache = 0;
    
    for(int i = 0; i < kNumTests; i++)
    {
        NSTimeInterval start = [[NSDate date] timeIntervalSince1970];
        
        MyCustomComplexObject *a = [[[MyCustomComplexObject alloc] init] autorelease];
        [arr addObject:a];
        
        NSTimeInterval end = [[NSDate date] timeIntervalSince1970];
        
        totalCache += end - start;
    }
    
    NSLog(@"Done allocations of complex object from cache.  Total of %f seconds | Avg of %f seconds", totalCache, totalCache / kNumTests);
    NSLog(@"New vs. cache ratio: %f, less than 1.0 means caching is faster", totalCache/total );
    
    [arr release];
}



@end
