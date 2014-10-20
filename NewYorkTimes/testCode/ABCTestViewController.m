//
//  ABCTestViewController.m
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import "ABCTestViewController.h"

@interface ABCTestViewController ()
@property () BOOL width;

@end

@implementation ABCTestViewController
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
    self.title = @"New York Times";
    _width = NO;
    news = [[NSArray alloc]initWithObjects:@"item1",@"item2",@"item3", nil];
    [_mainPannel setNews:news];
    //[self.pannel setDelegate:self];
    //[self.pannel setDataSource:self];

    // Do any additional setup after loading the view.
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

- (IBAction)buttonPressed:(id)sender {
    if(_width){
        CGRect rect = self.pannel.frame;
        rect.size.width = 0;
        [self.pannel setFrame:rect];
        _width = NO;
    }else{
        CGRect rect = self.pannel.frame;
        rect.size.width = 200;
        [self.pannel setFrame:rect];
        _width = YES;
    
    }
    
}


@end
