//
//  ABCSidePanel.m
//  NewYorkTimes
//
//  Created by Admin on 27.10.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import "ABCSidePanel.h"

#import "JASidePanelController.h"

#import "UIViewController+JASidePanel.h"

@interface ABCSidePanel ()

@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UIButton *hide;
@property (nonatomic, weak) UIButton *show;
@property (nonatomic, weak) UIButton *removeRightPanel;
@property (nonatomic, weak) UIButton *addRightPanel;
@property (nonatomic, weak) UIButton *changeCenterPanel;
@property (nonatomic, weak) UITableView *tableViewPanel;

@end

@implementation ABCSidePanel

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	UILabel *label  = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:20.0f];
    //label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
	label.text = @"Menu";
	[label sizeToFit];
	label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:label];
    self.label = label;
   
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0.0f, 70.0f, 240.0f, 410.0f);
    //tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tableView];
    self.tableViewPanel = tableView;
   
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.label.center = CGPointMake(floorf(self.sidePanelController.leftVisibleWidth/2.0f), 25.0f);
}


- (void)_hideTapped:(id)sender {
    [self.sidePanelController setCenterPanelHidden:YES animated:YES duration:0.2f];
    self.hide.hidden = YES;
    self.show.hidden = NO;
}

- (void)_showTapped:(id)sender {
    [self.sidePanelController setCenterPanelHidden:NO animated:YES duration:0.2f];
    self.hide.hidden = NO;
    self.show.hidden = YES;
}

- (void)_removeRightPanelTapped:(id)sender {
    self.sidePanelController.rightPanel = nil;
    self.removeRightPanel.hidden = YES;
    self.addRightPanel.hidden = NO;
}


@end
