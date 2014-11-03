//
//  EntriesBuilder.h
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 exadel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EntriesBuilder : NSObject

+ (NSArray *)newsFromJSON:(NSData *)objectNotation error:(NSError **)error;
+ (NSArray *)categoriesFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end