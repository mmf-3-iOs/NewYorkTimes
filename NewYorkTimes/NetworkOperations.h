//
//  NetworkOperations.h
//  NewYorkTimes
//
//  Created by Admin on 09.11.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkOperations : NSObject
+ (void)getImageFromUrl:(NSString*)url forUIImageView:(UIImageView*)imVw;
@end
