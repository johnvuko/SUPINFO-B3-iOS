//
//  DetailedTableViewController.m
//  Supinfo
//
//  Created by Jonathan on 20/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "DetailedTableViewController.h"

#import "SliderCell.h"

@interface DetailedTableViewController ()

@end

@implementation DetailedTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Detail view";
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Details";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 2){
        return 120;
    }
    
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if(indexPath.row == 0){
        static NSString *cellIdentifier = @"Cell0";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        cell.textLabel.text = @"DefaultCell";
    }
    else if(indexPath.row == 1){
        static NSString *cellIdentifier = @"Cell1";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = CGRectMake(0, 0, 90, 30);
            [button setTitle:@"Press me" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            cell.accessoryView = button;
        }
        
        cell.textLabel.text = @"ButtonCell";
    }
    else{
        static NSString *cellIdentifier = @"Cell2";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if(!cell){
            cell = [[SliderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            
            [((SliderCell *)cell).slider addTarget:self action:@selector(didSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        }
        
        // Attention on utilise titleLabel et non textLabel
        ((SliderCell *)cell).titleLabel.text = @"SliderCell";
        ((SliderCell *)cell).slider.value = self.item.value;
    }
    
    return cell;
}

- (void)didSliderValueChanged:(UISlider *)slider
{
    self.item.value = slider.value;
}

@end
