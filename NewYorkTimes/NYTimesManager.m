//
//  MeetupManager.m
//  BrowseMeetup
//
//  Created by Simon on 31/8/13.
//  Copyright (c) 2013 TAMIM Ziad. All rights reserved.
//

#import "NYTimesManager.h"
#import "EntriesBuilder.h"
#import "NYTimesCommunicator.h"

@implementation NYTimesManager
- (void)fetchEntries
{
    [self.communicator searchEntries];
}

#pragma mark - MeetupCommunicatorDelegate

- (void)receivedEntriesJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *entries = [EntriesBuilder entriesFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingEntriesFailedWithError:error];
        
    } else {
        [self.delegate didReceiveEntries:entries];
    }
}

- (void)fetchingEntriesFailedWithError:(NSError *)error
{
    [self.delegate fetchingEntriesFailedWithError:error];
}
@end
