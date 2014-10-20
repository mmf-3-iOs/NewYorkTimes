//
//  ABCTestViewController.h
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABCMainTableView.h"

@interface ABCTestViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet ABCMainTableView *mainPannel;
@property (weak, nonatomic) IBOutlet UITableView *pannel;
@property (strong, nonatomic) NSArray *news;
- (IBAction)buttonPressed:(id)sender;
@end
