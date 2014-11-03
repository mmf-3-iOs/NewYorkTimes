//
//  NYTimesCommunicator.h
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 exadel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APICommunicatorDelegate;

@interface APICommunicator : NSObject
@property (weak, nonatomic) NSObject<APICommunicatorDelegate> *delegate;

- (void)getNews: (NSString *)category;
- (void)getNews;
- (void)getCategories;
@end