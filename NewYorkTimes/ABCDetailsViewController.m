//
//  ABCDetailsViewController.m
//  NewYorkTimes
//
//  Created by Admin on 25.10.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import "ABCDetailsViewController.h"

@interface ABCDetailsViewController ()

@end

@implementation ABCDetailsViewController

@synthesize newsTitleLabel;
@synthesize newsImageView;
@synthesize dateLabel;
@synthesize newsTextView;
//@synthesize newsTitle;
//@synthesize newsPublishDate;
//@synthesize newsFullText;
//@synthesize newsImage;
@synthesize news;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    newsTitleLabel.text = newsTitle;
//    dateLabel.text = newsPublishDate;
//    newsTextView.text = newsFullText;
//    newsImageView.image = newsImage;
    newsTitleLabel.text = news.newsTitle;
    dateLabel.text = news.newsPublishDate;
    newsTextView.text = news.newsFullText;
    newsImageView.image = news.newsImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
