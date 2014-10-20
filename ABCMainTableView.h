//
//  ABCMainTableView.h
//  NewYorkTimes
//
//  Created by Admin on 20.10.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABCMainTableView : UITableView

@property (strong, nonatomic) NSArray *news;
-(void) setNews:(NSArray *)news;
@end
