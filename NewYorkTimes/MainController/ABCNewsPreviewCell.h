//
//  ABCNewsPreviewCell.h
//  NewYorkTimes
//
//  Created by Admin on 20.10.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABCNewsPreviewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextView *text;

@end
