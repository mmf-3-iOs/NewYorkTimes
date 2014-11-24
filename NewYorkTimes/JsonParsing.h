//
//  JsonParsing.h
//  NewYorkTimes
//
//  Created by Admin on 24.11.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^JsonParsingCompletionBlock)(NSArray *entries, NSError *error);

@interface JsonParsing : NSOperation

- (void)initWithData:(NSData *)data completionHandler:(JsonParsingCompletionBlock)completionHandler;

@end
