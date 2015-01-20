//
//  WelcomeTableViewController.m
//  Supinfo
//
//  Created by Jonathan on 20/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "WelcomeTableViewController.h"

#import "DetailedTableViewController.h"

#import "FooItem.h"

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
              [[FooItem alloc] initWithTitle:@"Text 1" andValue:0],
              [[FooItem alloc] initWithTitle:@"Text 2" andValue:0],
              [[FooItem alloc] initWithTitle:@"Text 3" andValue:0],
              [[FooItem alloc] initWithTitle:@"Text 4" andValue:0],
              [[FooItem alloc] initWithTitle:@"Text 5" andValue:0]
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
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [items[indexPath.row] title];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailedTableViewController *controller = [DetailedTableViewController new];
    controller.item = items[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
