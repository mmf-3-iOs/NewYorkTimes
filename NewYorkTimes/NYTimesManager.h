//
//  MeetupManager.h
//  BrowseMeetup
//
//  Created by Simon on 31/8/13.
//  Copyright (c) 2013 TAMIM Ziad. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NYTimesManagerDelegate.h"
#import "NYTimesCommunicatorDelegate.h"

@class NYTimesCommunicator;

@interface NYTimesManager : NSObject<NYTimesCommunicatorDelegate>
@property (strong, nonatomic) NYTimesCommunicator *communicator;
@property (weak, nonatomic) id<NYTimesManagerDelegate> delegate;

- (void)fetchEntries;
@end