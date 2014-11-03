//
//  NYTimesCommunicatorDelegate.h
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 exadel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APICommunicatorDelegate <NSObject>
- (void)receivedNewsJSON:(NSData *)objectNotation;
- (void)receivedCategoriesJSON:(NSData *)objectNotation;
- (void)receivingFailedWithError:(NSError *)error;
@end
