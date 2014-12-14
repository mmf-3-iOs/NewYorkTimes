//
//  ImageCache.m
//  NewYorkTimes
//
//  Created by Admin on 07.12.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import "ImageCache.h"


@implementation ImageCache


+ (ImageCache *) sharedInstance {
    return [self sharedInstanceWithMaxSize:50];
}

+ (ImageCache *) sharedInstanceWithMaxSize:(NSInteger) size {
    static ImageCache *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (_sharedInstance == nil){
            _sharedInstance = [[super allocWithZone:NULL] initWithMaxSize: size];
        }
    });
    return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedInstance];
}

- (id)initWithMaxSize:(NSInteger) size{
    if (self = [super init]) {
        cacheTable = [NSMapTable mapTableWithKeyOptions:NSMapTableStrongMemory valueOptions:NSMapTableStrongMemory];
        values = [[NSMutableOrderedSet alloc] init];
        maxSize = size;
    }
    return self;
}

- (id)init {
    return [self initWithMaxSize: 50];
}


- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (void)addImage:(NSData *)image withURL: (NSString *)url {
    if (maxSize <= [values count]) {
        [cacheTable removeObjectForKey:(NSString*)[values firstObject]];
        [values removeObject:[values firstObject]];
        NSLog(@"REMOVE");

    }
    [cacheTable setObject:image forKey:url];
    [values addObject:url];
    NSLog(@"ADD");

}

- (NSData *)getImageWithURL: (NSString *)url {
    NSData *data =[cacheTable objectForKey:url];
    if (data) {
        [values removeObject:url];
        [values addObject:url];
        NSLog(@"GET");
    }
    return data;
}

@end