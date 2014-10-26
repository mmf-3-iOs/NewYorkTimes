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
#import "ABCNews.h"

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
    ABCNews *n1 = [ABCNews alloc];
    n1.newsTitle = @"In U.S., Ebola Fears Close Schools and Shape Politics";
    n1.newsPublishDate = @"OCT. 19, 2014";
    n1.newsTextPreview = @"The line between vigilance and hysteria can be blurry in debating how to manage potential threats to public health.";
    n1.newsFullText = @"The line between vigilance and hysteria can be blurry in debating how to manage potential threats to public health.";
    n1.newsImage = [UIImage imageNamed:@"1.jpg"];
    ABCNews *n2 = [ABCNews alloc];
    n2.newsTitle = @"Where Young College Graduates Are Choosing to Live";
    n2.newsPublishDate = @"OCT. 20, 2014";
    n2.newsTextPreview = @"More young people are moving to the very heart of cities, even in economically troubled places like Buffalo and Cleveland.";
    n2.newsFullText = @"More young people are moving to the very heart of cities, even in economically troubled places like Buffalo and Cleveland.";
    n2.newsImage = [UIImage imageNamed:@"2.jpg"];
    self.news = [[NSArray alloc]initWithObjects:n1,n2, nil];
    
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
    ABCNews *news = [self.news objectAtIndex:[indexPath row]];
    
    //[cell setName:news];
    // Configure Cell
    [cell.name setText:news.newsTitle];
    [cell.date setText:news.newsPublishDate];
    [cell.text setText:news.newsTextPreview];
    [cell.image setImage:news.newsImage];
    
    return cell;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showDetailsSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ABCDetailsViewController *destController = segue.destinationViewController;
        destController.news = [self.news objectAtIndex:[indexPath row]];
    };
}

/*-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storybord  = [UIStoryboard storyboardWithName:@"MyStoryboard" bundle:nil];
    UIViewController *controller= [storybord instantiateViewControllerWithIdentifier:@"content"];
    
    [self.navigationController pushViewController:controller animated:YES];
}*/

@end
