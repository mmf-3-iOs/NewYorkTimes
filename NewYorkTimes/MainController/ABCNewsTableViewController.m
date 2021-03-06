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
#import "ImageCache.h"


@interface ABCNewsTableViewController () {
    NSArray *_entries;
    NSInteger pageNumber;
    ImageCache *_cache;
}

@property (nonatomic) IBOutlet UIBarButtonItem* menuButton;
@end

@implementation ABCNewsTableViewController

- (id)init
{
    if ((self = [super init])) {
        pageNumber = 0;
        _entries = [[NSArray alloc] init];
        return self;
    } else {
        return nil;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customSetup];
    [self getData:YES];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)customSetup
{
    //self.title = @"New York Times";
    self.title = (self.categoryName)?self.categoryName:@"New York Times";
    
    _cache =[ImageCache sharedInstance];
    
    // Refrashing
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshEntries) forControlEvents:UIControlEventValueChanged];    SWRevealViewController *revealViewController = self.revealViewController;
    
    // Sidepanel
    if ( revealViewController )
    {
        [self.menuButton setTarget: self.revealViewController];
        [self.menuButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer: self.revealViewController.panGestureRecognizer];
    }
}

- (void)getData:(BOOL)isAdd
{
    NSString *apiKey = @"f2e766bfe17b4503a0ad499f800d4d0e%3A10%3A69971684";
    NSString *url = [NSString stringWithFormat:@"http://api.nytimes.com/svc/news/v3/content/all/%@/.json?offset=%ld&api-key=%@", (self.category) ? [self.category stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] : @"all", 20*pageNumber + 1, apiKey];
    
    [[BackgroundOperations sharedInstance] downloadFromUrl:url andFetchInMode:JSONFetchDataModeNews withCompletionHandler:^(NSMutableArray *array, NSError *error) {
        if (error) {
            [self showFailAlert:error];
        } else {
            if (isAdd) {
                NSMutableArray *tempArray = [[NSMutableArray alloc] initWithArray:_entries];
                [tempArray addObjectsFromArray:array];
                _entries = tempArray;
            } else {
                _entries = array;
            }
            
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
        }
    }];
}

- (void)refreshEntries
{
    [self getData:NO];
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

    cell.image.image = nil;
    if (entry.urlThumbImage && !([entry.urlThumbImage isEqualToString:@""])) {
        NSData *image = [_cache getImageWithURL:entry.urlThumbImage];
        if (image) {
            [cell.image setImage:[UIImage imageWithData:image]];
        } else {
            [[BackgroundOperations sharedInstance] downloadAsyncData:entry.urlThumbImage withCompletionHandler:^(NSData *data, NSError *error) {
                [_cache addImage:data withURL:entry.urlThumbImage];

                [cell.image setImage:[UIImage imageWithData:data]];
            }];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Uploading new items on scrolling down
    if (indexPath.row == [_entries count] - 1) {
        pageNumber++;
        [self getData:YES];
    }
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
