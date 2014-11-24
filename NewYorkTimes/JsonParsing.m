//
//  JsonParsing.m
//  NewYorkTimes
//
//  Created by Admin on 24.11.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import "JsonParsing.h"

@interface JsonParsing() {
    NSData *_data;
    JsonParsingCompletionBlock handler;
}

@end

@implementation JsonParsing

-(void)initWithData:(NSData *)data completionHandler:(JsonParsingCompletionBlock)completionHandler
{
   // NSBlockOperation onComplete = [NSBlockOperation blockOperationWithBlock:<#^(void)block#>]
}

@end
