//
//  Group.h
//  BrowseMeetup
//
//  Created by Simon on 31/8/13.
//  Copyright (c) 2013 TAMIM Ziad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *urlImage;
@property (strong, nonatomic) NSString *shortText;
@property (strong, nonatomic) NSString *fullText;

@end
