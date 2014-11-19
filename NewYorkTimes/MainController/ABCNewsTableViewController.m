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
#import "SWRevealViewController.h"

#import "EntryItem.h"
#import "APIManager.h"
#import "APICommunicator.h"
#import "NetworkOperations.h"


@interface ABCNewsTableViewController () <APIManagerDelegate> {
    NSArray *_entries;
    APIManager *_manager;
}
@property (nonatomic) IBOutlet UIBarButtonItem* menuButton;
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
    [self customSetup];
    
    
    _manager = [[APIManager alloc] init];
    _manager.communicator = [[APICommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    if (self.category) {
        [_manager fetchNews:self.category];
    } else {
        [_manager fetchNews];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)customSetup
{
    self.title = @"New York Times";
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.menuButton setTarget: self.revealViewController];
        [self.menuButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer: self.revealViewController.panGestureRecognizer];
    }
}

- (void)didReceive:(NSArray *)entries
{
    _entries = entries;
    [self.tableView reloadData];
}

- (void)fetchingFailedWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:[error localizedDescription]
                          message:[error localizedRecoverySuggestion]
                          delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"Ok", @"")
             git              otherButtonTitles:nil];
    
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
    return [_entries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"PrototypeNewsCell";
    
    ABCNewsPreviewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Fetch News
    EntryItem *entry = [_entries objectAtIndex:indexPath.row];
    
    //[cell setName:news];
    // Configure Cell
    [cell.title setText:entry.title];
    [cell.date setText:entry.date];
    [cell.text setText:entry.shortText];
    [cell.section setText:entry.section];
    if (!cell.image.image) {
        [NetworkOperations getImageFromUrl:entry.urlThumbImage forUIImageView:cell.image];
    }
    
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
