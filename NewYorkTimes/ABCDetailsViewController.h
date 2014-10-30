//
//  ABCDetailsViewController.h
//  NewYorkTimes
//
//  Created by Admin on 25.10.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface ABCDetailsViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *newsTitleLabel;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UIImageView *newsImageView;
@property (nonatomic, strong) IBOutlet UITextView *newsTextView;

//@property (nonatomic, strong) NSString *newsTitle;
//@property (nonatomic, strong) NSString *newsPublishDate;
//@property (nonatomic, strong) NSString *newsFullText;
//@property (nonatomic, strong) UIImage *newsImage;
@property (nonatomic, strong) Entry *entry;

@end
