//
//  NYTNewsTableViewController.m
//  NewYorkTimes
//
//  Created by Admin on 19.10.14.
//  Copyright (c) 2014 exadel. All rights reserved.
//

#import "NYTNewsTableViewController.h"
#import "ABCNewsPreviewCell.h"

@interface NYTNewsTableViewController ()

@end

@implementation NYTNewsTableViewController

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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/*-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storybord  = [UIStoryboard storyboardWithName:@"MyStoryboard" bundle:nil];
    UIViewController *controller= [storybord instantiateViewControllerWithIdentifier:@"content"];
    
    [self.navigationController pushViewController:controller animated:YES];
}*/

@end
