//
//  MyCustomObject.m
//  iOSPerformanceTests
//
//  Created by Robert Segal on 2015-08-30.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import "MyCustomObject.h"
#import <objc/runtime.h>

@implementation MyCustomObject

+ (id)allocWithZone:(NSZone *)zone
{
    id obj = (__bridge id)calloc(class_getInstanceSize(self), 1);
     *(Class *)obj = self;
    
    return obj;
}

- (void)dealloc
{
    free(self);
    return;
    
    [super dealloc]; // shut up compiler
}

@end
