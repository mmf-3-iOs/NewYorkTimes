//
//  NetworkOperations.m
//  NewYorkTimes
//
//  Created by Admin on 09.11.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import "NetworkOperations.h"

@implementation NetworkOperations
+ (void)getImageFromUrl:(NSString*)url forUIImageView:(UIImageView*)imVw
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session =  [NSURLSession sessionWithConfiguration:sessionConfig  delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask *getImageTask = [session downloadTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        UIImage *downloadedImage =
        [UIImage imageWithData: [NSData dataWithContentsOfURL:location]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [imVw setImage:downloadedImage];
        });
    }];
    [getImageTask resume];
}
@end
