//
//  ABCNewsTableViewController.m
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 exadel. All rights reserved.
//

#import "ABCNewsTableViewController.h"
#import "ABCNewsPreviewCell.h"
#import "ABCDetailsViewController.h"

#import "Entry.h"
#import "NYTimesManager.h"
#import "NYTimesCommunicator.h"


@interface ABCNewsTableViewController () <NYTimesManagerDelegate> {
    NSArray *_entries;
    NYTimesManager *_manager;
}
@end

@implementation ABCNewsTableViewController

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
    
    // Set Title
    self.title = @"New York Times";
    
    _manager = [[NYTimesManager alloc] init];
    _manager.communicator = [[NYTimesCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    [_manager fetchEntries];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveEntries:(NSArray *)entries
{
    _entries = entries;
    [self.tableView reloadData];
}

- (void)fetchingEntriesFailedWithError:(NSError *)error
{
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
    return [_entries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"PrototypeNewsCell";
    
    ABCNewsPreviewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Fetch News
    Entry *entry = [_entries objectAtIndex:indexPath.row];
    
    //[cell setName:news];
    // Configure Cell
    [cell.title setText:entry.title];
    [cell.date setText:entry.date];
    [cell.text setText:entry.shortText];
    //[cell.image setImage:news.newsImage];
    
    return cell;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showDetailsSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ABCDetailsViewController *destController = segue.destinationViewController;
        destController.entry = [_entries objectAtIndex:indexPath.row];
    };
}

@end
