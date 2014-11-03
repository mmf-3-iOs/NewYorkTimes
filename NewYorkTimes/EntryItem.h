//
//  EntryItem.h
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 exadel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EntryItem : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *section;
@property (strong, nonatomic) NSString *urlThumbImage;
@property (strong, nonatomic) NSString *urlFullImage;
@property (strong, nonatomic) NSString *shortText;
@property (strong, nonatomic) NSString *fullText;

@end
