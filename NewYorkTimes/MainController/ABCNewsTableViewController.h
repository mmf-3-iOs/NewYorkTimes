//
//  ABCNewsTableViewController.h
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 exadel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABCNewsTableViewController : UITableViewController

@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end
