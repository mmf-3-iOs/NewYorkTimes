//
//  MeetupCommunicator.h
//  BrowseMeetup
//
//  Created by Simon on 31/8/13.
//  Copyright (c) 2013 TAMIM Ziad. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NYTimesCommunicatorDelegate;

@interface NYTimesCommunicator : NSObject
@property (weak, nonatomic) id<NYTimesCommunicatorDelegate> delegate;

- (void)searchEntries;
@end