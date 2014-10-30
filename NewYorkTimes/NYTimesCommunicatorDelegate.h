//
//  MeetupCommunicatorDelegate.h
//  BrowseMeetup
//
//  Created by Simon on 31/8/13.
//  Copyright (c) 2013 TAMIM Ziad. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NYTimesCommunicatorDelegate
- (void)receivedEntriesJSON:(NSData *)objectNotation;
- (void)fetchingEntriesFailedWithError:(NSError *)error;
@end
