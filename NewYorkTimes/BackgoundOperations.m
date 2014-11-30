//
//  NetworkOperations.m
//  NewYorkTimes
//
//  Created by Admin on 09.11.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//
#import "BackgroundOperations.h"
#import "EntryItem.h"
#import "CategoryItem.h"

@interface BackgroundOperations()
{
    dispatch_queue_t queue;
    NSURLSession *session;
}
@end

@implementation BackgroundOperations

static BackgroundOperations *_sharedManager = nil;

+ (BackgroundOperations*)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[BackgroundOperations alloc] init];
    });
    
    return _sharedManager;
}

- (id)init
{
    self = [super init];
    
    queue = dispatch_queue_create("com.mmf-3-iOs.NewYorkTimes", DISPATCH_QUEUE_CONCURRENT);
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    return self;
}

- (void)downloadAsyncData:(NSString *)url withCompletionHandler:(DataDownloadCompletionHanlder)handler
{
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *downloadedData = [NSData dataWithContentsOfURL:location];
        dispatch_async(dispatch_get_main_queue(), ^{
            handler(downloadedData, error);
        });
    }];
    [downloadTask resume];
}

- (void)fetchAsyncData:(NSData *)data mode:(JSONFetchDataMode)mode withCompletionHandler:(JSONFetchCompletionHanlder)handler
{
    dispatch_async(queue, ^{
        NSError *localError = nil;
        NSMutableArray *entries = [[NSMutableArray alloc] init];
        NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&localError];
        NSArray *results = nil;
        
        if (localError == nil) {
            switch (mode) {
                case JSONFetchDataModeNews:
                    results = [parsedObject valueForKey:@"results"];
                    
                    for (NSDictionary *entryDic in results) {
                        EntryItem *entry = [[EntryItem alloc] init];
                        
                        for (NSString *key in entryDic) {
                            if ([key  isEqual: @"abstract"]) {
                                entry.shortText = [entryDic valueForKey:key];
                                entry.fullText = [entryDic valueForKey:key];
                            } else if ([key  isEqual: @"title"]) {
                                entry.title = [entryDic valueForKey:key];
                            } else if ([key  isEqual: @"url"]) {
                                entry.url = [entryDic valueForKey:key];
                            } else if ([key  isEqual: @"thumbnail_standard"]) {
                                entry.urlThumbImage = [entryDic valueForKey:key];
                                entry.urlFullImage = [entryDic valueForKey:key];
                            } else if ([key isEqual:@"created_date"]) {
                                entry.date = [entryDic valueForKey:key];
                            } else if ([key isEqual:@"section"]) {
                                entry.section = [entryDic valueForKey:key];
                            }
                        }
                        [entries addObject:entry];
                    }
                    break;
                    
                case JSONFetchDataModeCategories:
                    results = [parsedObject valueForKey:@"results"];
                    
                    for (NSDictionary *entryDic in results) {
                        CategoryItem *category = [[CategoryItem alloc] init];
                        
                        for (NSString *key in entryDic) {
                            if ([key  isEqual: @"display_name"]) {
                                category.title = [entryDic valueForKey:key];
                            } else if ([key  isEqual: @"section"]) {
                                category.forSearch = [entryDic valueForKey:key];
                            }
                        }
                        [entries addObject:category];
                    }                    break;
                default:
                    break;
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            handler(entries, localError);
        });
    });
}

- (void)downloadFromUrl:(NSString *)url andFetchInMode:(JSONFetchDataMode)mode withCompletionHandler:(JSONFetchCompletionHanlder)handler
{
    __block NSError *localError = nil;
    __block NSMutableArray *array = nil;
    [self downloadAsyncData:url withCompletionHandler:^(NSData *data, NSError *error) {
        if (error == nil) {
            [self fetchAsyncData:data mode:mode withCompletionHandler:^(NSMutableArray *data, NSError *error) {
                if (error != nil) {
                    localError = error;
                } else {
                    array = data;
                }
                handler(array, localError);
            }];
        } else {
            localError = error;
            handler(array, localError);
        }
    }];
}
@end
