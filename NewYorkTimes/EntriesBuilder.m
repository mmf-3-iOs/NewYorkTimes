//
//  EntriesBuilder.m
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 exadel. All rights reserved.
//

#import "EntriesBuilder.h"
#import "EntryItem.h"
#import "CategoryItem.h"

@implementation EntriesBuilder
+ (NSArray *)newsFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *entries = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"results"];
	
    for (NSDictionary *entryDic in results) {
        EntryItem *entry = [[EntryItem alloc] init];
        
        for (NSString *key in entryDic) {
            if ([key  isEqual: @"abstract"]) {
                entry.shortText = [entryDic valueForKey:key];
                entry.fullText = [entryDic valueForKey:key];
            } else if ([key  isEqual: @"title"]) {
                entry.title = [entryDic valueForKey:key];
            } else if ([key  isEqual: @"thumbnail_standard"]) {
                entry.urlThumbImage = [entryDic valueForKey:key];
                entry.urlFullImage = [entryDic valueForKey:key];
            } else if ([key isEqual:@"created_date"]) {
                entry.date = [entryDic valueForKey:key];
            }
        }
        [entries addObject:entry];
    }
    
    return entries;
}

+ (NSArray *)categoriesFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *categories = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"results"];
	
    for (NSDictionary *entryDic in results) {
        CategoryItem *category = [[CategoryItem alloc] init];
        
        for (NSString *key in entryDic) {
            if ([key  isEqual: @"display_name"]) {
                category.title = [entryDic valueForKey:key];
            } else if ([key  isEqual: @"section"]) {
                category.forSearch = [entryDic valueForKey:key];
            }
        }
        [categories addObject:category];
    }
    
    return categories;
}
@end