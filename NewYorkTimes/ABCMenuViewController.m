//
//  ABCMenuViewController.m
//  NewYorkTimes
//
//  Created by Admin on 07.11.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import "ABCMenuViewController.h"
#import "ABCMenuCell.h"
#import "ABCNewsTableViewController.h"

#import "CategoryItem.h"
#import "APICommunicator.h"
#import "APIManager.h"

@interface ABCMenuViewController () <APIManagerDelegate> {
    NSArray *_categories;
    APIManager *_manager;
}

@end

@implementation ABCMenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _manager = [[APIManager alloc] init];
    _manager.communicator = [[APICommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    [_manager fetchCategories];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceive:(NSArray *)entries
{
    _categories = entries;
    [self.tableView reloadData];
}

- (void)fetchingFailedWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:[error localizedDescription]
                          message:[error localizedRecoverySuggestion]
                          delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"Ok", @"")
                          otherButtonTitles:nil];
    
    [alert show];
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ABCMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PrototypeCategoriesCell" forIndexPath:indexPath];
    
    CategoryItem *category = [_categories objectAtIndex:indexPath.row];
    
    [cell.title setText:category.title];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *navController = segue.destinationViewController;
    ABCNewsTableViewController* destView = [navController childViewControllers].firstObject;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    CategoryItem *category = [_categories objectAtIndex:indexPath.row];
    destView.category = category.forSearch;
}

@end
