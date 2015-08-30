//
//  MyCustomComplexObject.h
//  iOSPerformanceTests
//
//  Created by Robert Segal on 2015-08-30.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface MyCustomComplexObject : NSObject

@property (readonly, nonatomic)         BOOL                initialized;
@property (readonly, nonatomic)         BOOL                spawned;
@property (readonly, nonatomic)         NSString            *type;
@property (readonly, nonatomic)         id                  objectDef;
@property (readonly, nonatomic)         id                  physicsShape;
@property (readonly, nonatomic)         NSString            *group;
@property (readonly, nonatomic)         NSMutableDictionary *animations;
@property (readonly, nonatomic)         NSMutableDictionary *events;
@property (readonly, nonatomic)         id                  pattern;
@property (readonly, nonatomic)         id                  world;
@property (readonly, nonatomic)         CGPoint             patternPosition;
@property (readonly, nonatomic)         int                 nextActionTag;
@property (readonly, nonatomic)         BOOL                canMultithread;
@property (readwrite,assign, nonatomic) BOOL                culling;
@property (readwrite,assign, nonatomic) id                  node;
@property (nonatomic,readwrite)         BOOL flipX;
@property (nonatomic,readwrite)         BOOL flipY;
@property (readonly, nonatomic)         BOOL worldFlipX;
@property (readonly, nonatomic)         BOOL worldFlipY;
@property (readwrite,assign)            BOOL batched;
@property (nonatomic,readonly)          id body;
@property (nonatomic)                   CGPoint linearVelocity;
@property (nonatomic)                   BOOL active;
@property (readonly, nonatomic)         BOOL dead;
@property (readonly, nonatomic)         id target;
@property (readwrite,retain,nonatomic)  id spawnedBy;
@property (nonatomic)                   CGPoint facingDirection;


@end
