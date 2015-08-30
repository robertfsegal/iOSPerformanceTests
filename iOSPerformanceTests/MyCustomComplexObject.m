//
//  MyCustomComplexObject.m
//  iOSPerformanceTests
//
//  Created by Robert Segal on 2015-08-30.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import "MyCustomComplexObject.h"
#import <objc/runtime.h>

static id gCacheListHead;

@implementation MyCustomComplexObject

+ (id)allocWithZone:(NSZone *)zone
{
    id obj = GetObjectFromCache();
    
    if(obj)
    {
        *(Class *)obj = self;
    }
    else
    {
        obj = [super allocWithZone: zone];
    }
    
    return obj;
}

- (void)dealloc
{
    // release any ivars here
    AddObjectToCache(self);
    
    // shut up the compiler
    return;
    [super dealloc];
}

static id GetNext(id cachedObj)
{
    return *(id *)cachedObj;
}

static void SetNext(id cachedObj, id next)
{
    *(id *)cachedObj = next;
}

static id GetObjectFromCache()
{
    id obj = gCacheListHead;
    
    if(obj)
    {
        gCacheListHead = GetNext(obj);
    }
    
    return obj;
}

static void AddObjectToCache(id obj)
{
    SetNext(obj, gCacheListHead);
    gCacheListHead = obj;
}


@end
