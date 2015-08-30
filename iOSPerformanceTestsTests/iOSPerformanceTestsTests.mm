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

-(void)testNSDictionaryWithFile
{
    NSTimeInterval start = [NSDate date].timeIntervalSince1970;
    
    NSString *s = [[NSBundle mainBundle] pathForResource:@"test-file-1.plist" ofType:@""];
    
    NSDictionary *d = [NSDictionary dictionaryWithContentsOfFile:s];
    
    if (d)
    {
        
    }
    
    NSTimeInterval end = [NSDate date].timeIntervalSince1970;
    
    NSLog(@"Time -> %lf", end - start);
}

-(void)testNSDictionaryWithNSURL
{
    NSTimeInterval start = [NSDate date].timeIntervalSince1970;
    
    NSURL *u = [[NSBundle mainBundle] URLForResource:@"test-file-1.plist" withExtension:@""];
    
    NSDictionary *d = [NSDictionary dictionaryWithContentsOfURL:u];
    
    if (d)
    {
        
    }
    
    NSTimeInterval end = [NSDate date].timeIntervalSince1970;
    
    
    NSLog(@"Time -> %lf", end - start);
}

-(void)testNSDictionaryWithIOChannel
{
    NSString *s = [[NSBundle mainBundle] pathForResource:@"test-file-1.plist" ofType:@""];
    
   
    dispatch_fd_t t = open([s UTF8String], O_RDONLY);
    
    dispatch_read(t, 4 * sizeof(int), dispatch_get_main_queue(), ^(dispatch_data_t data, int error)
    {
        printf("Read %zu bytes!\n", dispatch_data_get_size(data));
        printf("\tError: %d\n", error);
    });
    
    //    dispatch_io_t t = dispatch_io_create_with_path(DISPATCH_IO_RANDOM,
    //                                                [s UTF8String],   // Convert to C-string
    //                                                O_RDONLY,                // Open for reading
    //                                                0,                       // No extra flags
    //                                                dispatch_get_main_queue(),
    //                                                ^(int error){
    //                                                    // Cleanup code for normal channel operation.
    //                                                    // Assumes that dispatch_io_close was called elsewhere.
    //                                                    if (error == 0) {
    //                                                        //dispatch_release(t);
    //
    //                                                    }
    //                                                });
 
    
//
//    
//    [is read:<#(uint8_t *)#> maxLength:<#(NSUInteger)#>
//    
//    
//    [NSKeyedUnarchiver unarchiveObjectWithData:<#(NSData *)#>
    //std::map<NSString *, id> m;
    
    
    
}


@end
