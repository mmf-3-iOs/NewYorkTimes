//
//  ImageCache.h
//  NewYorkTimes
//
//  Created by Admin on 07.12.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCache : NSObject{
@private
    NSMapTable *cacheTable;
}

+ (ImageCache *)sharedInstance;
- (void)addImage:(NSData *)image withURL: (NSString *)url;
- (NSData *)getImageWithURL: (NSString *)url;

@end