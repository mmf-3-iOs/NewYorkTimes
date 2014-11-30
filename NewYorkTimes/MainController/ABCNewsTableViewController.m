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
#import "BackgroundOperations.h"


@interface ABCNewsTableViewController () {
    NSArray *_entries;
}
@property (nonatomic) IBOutlet UIBarButtonItem* menuButton;
@end

@implementation ABCNewsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customSetup];
    [self getData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)customSetup
{
    self.title = @"New York Times";
    
    // Refrashing
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(getData) forControlEvents:UIControlEventValueChanged];    SWRevealViewController *revealViewController = self.revealViewController;
    
    // Sidepanel
    if ( revealViewController )
    {
        [self.menuButton setTarget: self.revealViewController];
        [self.menuButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer: self.revealViewController.panGestureRecognizer];
    }
}

- (void)getData
{
    NSString *apiKey = @"f2e766bfe17b4503a0ad499f800d4d0e%3A10%3A69971684";
    NSString *url = [NSString stringWithFormat:@"http://api.nytimes.com/svc/news/v3/content/all/%@/.json?api-key=%@", (self.category) ? [self.category stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] : @"all", apiKey];
    
    [[BackgroundOperations sharedInstance] downloadFromUrl:url andFetchInMode:JSONFetchDataModeNews withCompletionHandler:^(NSArray *array, NSError *error) {
        if (error) {
            [self showFailAlert:error];
        } else {
            _entries = array;
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
        }
    }];
}

- (void)showFailAlert:(NSError *)error
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
    //if (!cell.image.image) {
    cell.image.image = nil;
        [[BackgroundOperations sharedInstance] downloadAsyncData:entry.urlThumbImage withCompletionHandler:^(NSData *data, NSError *error) {
            [cell.image setImage:[UIImage imageWithData:data]];
        }];
    //}
    
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
