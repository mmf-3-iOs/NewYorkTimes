//
//  GroupBuilder.h
//  BrowseMeetup
//
//  Created by Simon on 31/8/13.
//  Copyright (c) 2013 TAMIM Ziad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EntriesBuilder : NSObject

+ (NSArray *)entriesFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end