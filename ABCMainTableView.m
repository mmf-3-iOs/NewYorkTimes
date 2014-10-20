//
//  ABCMainTableView.m
//  NewYorkTimes
//
//  Created by Admin on 20.10.14.
//  Copyright (c) 2014 mmf-3-iOs. All rights reserved.
//

#import "ABCMainTableView.h"

@implementation ABCMainTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"I'm here");
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
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
    
    NSString *num = [NSString stringWithFormat:@"%d",[self.news count]];
    NSLog(@"dbfcjhsbdjhvbdjv");
    static NSString *CellIdentifier = @"Cell Identifier";
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Fetch News
    NSDictionary *news = [self.news objectAtIndex:[indexPath row]];
    
    // Configure Cell
    [cell.textLabel setText:[news objectForKey:@"Title"]];
    
    return cell;
}

-(void)setNews:(NSArray *)news{
    _news = news;
}

@end
