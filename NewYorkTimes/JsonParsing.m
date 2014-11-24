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
    JsonParsingCompletionBlock _handler;
    NSOperationQueue *_queue;
}

@end

@implementation JsonParsing

-(void)initWithData:(NSData *)data queue:(NSOperationQueue*)queue completionHandler:(JsonParsingCompletionBlock)completionHandler
{
    _data = data;
    _queue = queue;
    _handler = completionHandler;
}

-(void)main {
    NSBlockOperation *completion = [NSBlockOperation blockOperationWithBlock: ^{
        //_handler(entries, error);
    }];
    [_queue addOperation:completion];
}

@end
