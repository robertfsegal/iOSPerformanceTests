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

#include "flatbuffers/flatbuffers.h"
#include "flatbuffers/idl.h"
#include "flatbuffers/util.h"

#include "pattern_generated.h"

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

static int kNumTests = 1000;

-(void)testPlistRead
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pattern-flatbuffers-test.plist" ofType:@""];

    NSTimeInterval start = [NSDate date].timeIntervalSince1970;
    
    for (int i = 0; i < kNumTests; i++)
    {
      NSDictionary *p = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    
    NSTimeInterval end = [NSDate date].timeIntervalSince1970;
    
    NSLog(@"Parse time -> %lf", end - start);
  
      NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:path];
    
    start = [NSDate date].timeIntervalSince1970;
    
    
    for (NSDictionary *d in plist[@"groups"])
    {
        for (NSDictionary *dd in d[@"objects"])
        {
            BOOL flipH = [dd[@"flip_horizontal"] boolValue];
            NSString *group = dd[@"group"];
            NSString *name = dd[@"name"];
            NSNumber *rotation = dd[@"rotation"];
            BOOL top = [dd[@"top"] boolValue];
            NSString *type = dd[@"type"];
            NSNumber *x = dd[@"x"];
            NSString *y = dd[@"y"];
            
           // NSLog(@"name : %@", name);
        }
    }
    
    end = [NSDate date].timeIntervalSince1970;
    
    NSLog(@"Read time -> %lf", end - start);
}

-(void)testFlatBufferRead
{
    flatbuffers::Parser parser;
    std::string         sData;
    const char*         cData;
    // std::string schemafile;
    // NSString *schemaPath = [[NSBundle mainBundle] pathForResource:@"pattern.fbs" ofType:@""];
    
    NSString *dataFilePath   = [[NSBundle mainBundle] pathForResource:@"pattern-flatbuffers-test.plist.bin" ofType:@""];
 
    const char* patternPath = [dataFilePath UTF8String];
    
    
    NSTimeInterval start = [NSDate date].timeIntervalSince1970;
    
    for (int i = 0; i < kNumTests; i++)
    {
        flatbuffers::LoadFile(patternPath, true, &sData);
        const pattern *p = Getpattern(cData);
    }
    
    NSTimeInterval end = [NSDate date].timeIntervalSince1970;
    NSLog(@"Parse time -> %lf", end - start);

    const pattern *p = Getpattern(cData);
    
    start = [NSDate date].timeIntervalSince1970;

    std::vector<const anObject *> objects;
    
    for (auto it = p->groups()->begin(); it != p->groups()->end(); ++it)
    {
        const aGroup *g    = (*it);

        for (auto it2 = g->objects()->begin(); it2 != g->objects()->end(); ++it2)
        {
            const anObject *a = (*it2);
            
            int x = a->x();
            int y = a->y();
            int rotation = a->rotation();
            bool flipH = a->flip_horizontal();
            bool top   = a->top();
            const char *type = a->type()->c_str();
            const char *n = a->name()->c_str();
            
            objects.push_back(a);
            
            //NSLog(@"name : %s", n);
        }
    }
    
    end = [NSDate date].timeIntervalSince1970;
    
    NSLog(@"Read time -> %lf", end - start);

}



@end
