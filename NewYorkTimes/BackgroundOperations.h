//
//  NetworkOperations.h
//  NewYorkTimes
//
//  Created by Admin on 09.11.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DataDownloadCompletionHanlder)(NSData* data, NSError* error);
typedef void(^JSONFetchCompletionHanlder)(NSMutableArray* array, NSError* error);

typedef enum JSONFetchDataMode
{
    JSONFetchDataModeNews,
    JSONFetchDataModeCategories,
    JSONFetchDataModeArticleSearch
}JSONFetchDataMode;


@interface BackgroundOperations : NSObject
+ (BackgroundOperations*)sharedInstance;
- (void)downloadAsyncData:(NSString*)url withCompletionHandler:(DataDownloadCompletionHanlder)handler;
- (void)fetchAsyncData:(NSData*)data mode:(JSONFetchDataMode)mode withCompletionHandler:(JSONFetchCompletionHanlder)handler;
- (void)downloadFromUrl:(NSString*)url andFetchInMode:(JSONFetchDataMode)mode withCompletionHandler:(JSONFetchCompletionHanlder)handler;
@end
