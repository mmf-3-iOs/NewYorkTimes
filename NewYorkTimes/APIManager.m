//
//  NYTimesManager.m
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 exadel. All rights reserved.
//

#import "APIManager.h"
#import "EntriesBuilder.h"
#import "APICommunicator.h"

@implementation APIManager
- (void)fetchNews
{
    [self.communicator getNews];
}

- (void)fetchNews: (NSString*)category
{
    [self.communicator getNews:category];
}

- (void)fetchCategories
{
    [self.communicator getCategories];
}

- (void)receivedNewsJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *entries = [EntriesBuilder newsFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingFailedWithError:error];
        
    } else {
        [self.delegate didReceive:entries];
    }
}

- (void)receivedCategoriesJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *categories = [EntriesBuilder categoriesFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingFailedWithError:error];
        
    } else {
        [self.delegate didReceive:categories];
    }
}

- (void)receivingFailedWithError:(NSError *)error
{
    [self.delegate fetchingFailedWithError:error];
}
@end