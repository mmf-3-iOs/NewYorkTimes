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
    static ImageCache *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (_sharedInstance == nil){
            _sharedInstance = [[super allocWithZone:NULL] init];
        }
    });
    
    return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedInstance];
}

- (id)init {
    if (self = [super init]) {
        cacheTable = [NSMapTable mapTableWithKeyOptions:NSMapTableStrongMemory valueOptions:NSMapTableStrongMemory];
    }
    return self;
}


- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (void)addImage:(NSData *)image withURL: (NSString *)url {
    [cacheTable setObject:image forKey:url];
}

- (NSData *)getImageWithURL: (NSString *)url {
    return [cacheTable objectForKey:url];
}

@end