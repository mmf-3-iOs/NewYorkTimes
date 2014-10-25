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

@interface ABCNewsTableViewController ()

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
    //UIStoryboard *storybord  = [UIStoryboard storyboardWithName:@"MyStoryboard" bundle:nil];
    //UIViewController *menu= [storybord instantiateViewControllerWithIdentifier:@"menu"];
    //[self addChildViewController:menu];
    //If the list of news was in file. Change for the list obtained from the API
    //NSString *filePath = [[NSBundle mainBundle] pathForResource:@"News" ofType:@"plist"];
    //NSLog(filePath);
    //self.news = [NSArray arrayWithContentsOfFile:filePath];
    //NSString *num = [NSString stringWithFormat:@"%d",[self.news count]];
    //NSLog(num);
    self.news = [[NSArray alloc]initWithObjects:@"item1",@"item2",@"item3", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.news count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PrototypeNewsCell";
    
   //[tableView registerClass:[ABCNewsPreviewCell class] forCellReuseIdentifier:CellIdentifier];
    
    ABCNewsPreviewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Fetch News
    NSString *news = [self.news objectAtIndex:[indexPath row]];
    
    //[cell setName:news];
    // Configure Cell
    [cell.name setText:news];
    
    
    return cell;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showDetailsSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ABCDetailsViewController *destController = segue.destinationViewController;
        destController.newsTitle = [self.news objectAtIndex:[indexPath row]];
    };
}

/*-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storybord  = [UIStoryboard storyboardWithName:@"MyStoryboard" bundle:nil];
    UIViewController *controller= [storybord instantiateViewControllerWithIdentifier:@"content"];
    
    [self.navigationController pushViewController:controller animated:YES];
}*/

@end
