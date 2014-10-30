//
//  MeetupCommunicator.m
//  BrowseMeetup
//
//  Created by Simon on 31/8/13.
//  Copyright (c) 2013 TAMIM Ziad. All rights reserved.
//

#import "NYTimesCommunicator.h"
#import "NYTimesCommunicatorDelegate.h"

#define API_KEY @"6f6d5b3a38b0c5b4808078a6c3b842c2%3A17%3A69971684"

@implementation NYTimesCommunicator

- (void)searchEntries
{
    NSString *urlAsString = [NSString stringWithFormat:@"http://api.nytimes.com/svc/search/v2/articlesearch.json?sort=newest&api-key=%@", API_KEY];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingEntriesFailedWithError:error];
        } else {
            [self.delegate receivedEntriesJSON:data];
        }
    }];
}

@end
