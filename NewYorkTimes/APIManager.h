//
//  NYTimesManager.h
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 exadel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "APIManagerDelegate.h"
#import "APICommunicatorDelegate.h"

@class APICommunicator;

@interface APIManager : NSObject<APICommunicatorDelegate>
@property (strong, nonatomic) APICommunicator *communicator;
@property (weak, nonatomic) NSObject<APIManagerDelegate> *delegate;

- (void)fetchNews;
- (void)fetchNews: (NSString*)category;
- (void)fetchCategories;
@end