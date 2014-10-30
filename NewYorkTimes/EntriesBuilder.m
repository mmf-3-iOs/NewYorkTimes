//
//  GroupBuilder.m
//  BrowseMeetup
//
//  Created by Simon on 31/8/13.
//  Copyright (c) 2013 TAMIM Ziad. All rights reserved.
//

#import "EntriesBuilder.h"
#import "Entry.h"

@implementation EntriesBuilder
+ (NSArray *)entriesFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *entries = [[NSMutableArray alloc] init];
    
    NSArray *results = [[parsedObject valueForKey:@"response"] valueForKey:@"docs"];
    //NSLog(@"Count %li", results.count);
    
    for (NSDictionary *entryDic in results) {
        Entry *entry = [[Entry alloc] init];
        
        for (NSString *key in entryDic) {
            if ([key  isEqual: @"snippet"]) {
                entry.shortText = [entryDic valueForKey:key];
                entry.fullText = [entryDic valueForKey:key];
            } else if ([key  isEqual: @"headline"]) {
                entry.title = [[entryDic valueForKey:key] valueForKey:@"main"];
            } else if ([key  isEqual: @"multimedia"]) {
                entry.urlImage = [[[entryDic valueForKey:key] firstObject] valueForKey:@"url"];
            } else if ([key isEqual:@"pub_date"]) {
                entry.date = [entryDic valueForKey:key];
            }
            if ([entry respondsToSelector:NSSelectorFromString(key)]) {
                [entry setValue:[entryDic valueForKey:key] forKey:key];
            }
        }
        
        [entries addObject:entry];
    }
    
    return entries;
}
@end
