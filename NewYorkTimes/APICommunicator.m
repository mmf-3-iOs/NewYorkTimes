//
//  NYTimesCommunicator.m
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 exadel. All rights reserved.
//

#import "APICommunicatorDelegate.h"
#import "APICommunicator.h"
#import "EntryItem.h"

#define API_KEY_NEWSWIRE @"f2e766bfe17b4503a0ad499f800d4d0e%3A10%3A69971684"

@implementation APICommunicator

- (void)getNews: (NSString *)category
{
    NSString *urlAsString = [NSString stringWithFormat:@"http://api.nytimes.com/svc/news/v3/content/all/%@/.json?api-key=%@", category, API_KEY_NEWSWIRE];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            [self.delegate receivingFailedWithError:error];
        } else {
            [self.delegate receivedNewsJSON:data];
        }
    }];
}

- (void)getNews
{
    [self getNews: @"all"];
}

- (void)getCategories
{
    NSString *urlAsString = [NSString stringWithFormat:@"http://api.nytimes.com/svc/news/v3/content/section-list.json?api-key=%@", API_KEY_NEWSWIRE];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            [self.delegate receivingFailedWithError:error];
        } else {
            [self.delegate receivedCategoriesJSON:data];
        }
    }];
}

@end