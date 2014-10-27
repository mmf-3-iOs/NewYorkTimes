//
//  ABCSidePanel.h
//  NewYorkTimes
//
//  Created by Admin on 27.10.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABCSidePanel : UIViewController

@property (nonatomic, weak, readonly) UILabel *label;
@property (nonatomic, weak, readonly) UIButton *hide;
@property (nonatomic, weak, readonly) UIButton *show;
@property (nonatomic, weak, readonly) UIButton *removeRightPanel;
@property (nonatomic, weak, readonly) UIButton *addRightPanel;
@property (nonatomic, weak, readonly) UIButton *changeCenterPanel;
@property (nonatomic, weak, readonly) UITableView *tableViewPanel;
@end
