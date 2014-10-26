//
//  ABCNews.h
//  NewYorkTimes
//
//  Created by Admin on 26.10.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABCNews : NSObject

@property (strong, nonatomic) NSString *newsTitle;
@property (strong, nonatomic) NSString *newsPublishDate;
@property (strong, nonatomic) NSString *newsTextPreview;
@property (strong, nonatomic) NSString *newsFullText;
@property (strong, nonatomic) UIImage *newsImage;

@end
