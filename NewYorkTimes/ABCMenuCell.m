//
//  ABCMenuCell.m
//  NewYorkTimes
//
//  Created by Admin on 07.11.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import "ABCMenuCell.h"

@implementation ABCMenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
