//
//  WelcomeTableViewController.m
//  Supinfo
//
//  Created by Jonathan on 20/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "WelcomeTableViewController.h"

#import "DetailedTableViewController.h"

@interface WelcomeTableViewController (){
    NSArray *items;
}

@end

@implementation WelcomeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Welcome screen";
    
    items = @[
              @"Text 1",
              @"Text 2",
              @"Text 3",
              @"Text 4",
              @"Text 5"
              ];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = items[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailedTableViewController *controller = [DetailedTableViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
