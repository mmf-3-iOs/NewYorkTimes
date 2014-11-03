//
//  NYTimesManagerDelegate.h
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 exadel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APIManagerDelegate <NSObject>
- (void)didReceive:(NSArray *)entries;
- (void)fetchingFailedWithError:(NSError *)error;
@end