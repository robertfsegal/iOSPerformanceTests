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

//+ (id)allocWithZone:(NSZone *)zone
//{
//    id obj = GetObjectFromCache();
//    
//    if(obj)
//    {
//        *(Class *)obj = self;
//    }
//    else
//    {
//        obj = [super allocWithZone: zone];
//    }
//    
//    return obj;
//}

+ (id)allocWithZone: (NSZone *)zone
{
    id obj = GetObjectFromCache();
    if(!obj)
    {
        AllocateNewBlockAndCache(self);
        obj = GetObjectFromCache();
    }
    *(Class *)obj = self;
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

static void AllocateNewBlockAndCache(Class class)
{
    static size_t kBlockSize = 4096;
    char *newBlock = malloc(kBlockSize);
    
    size_t instanceSize = class_getInstanceSize(class);
    unsigned long instanceCount = kBlockSize / instanceSize;
    
    while(instanceCount-- > 0)
    {
        AddObjectToCache((id)newBlock);
        newBlock += instanceSize;
    }
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
