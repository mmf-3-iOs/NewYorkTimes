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

@end

@implementation ABCSidePanel

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor blueColor];
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
