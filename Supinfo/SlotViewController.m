//
//  SlotViewController.m
//  Supinfo
//
//  Created by Jonathan on 20/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "SlotViewController.h"

@interface SlotViewController (){
    NSArray *slots;
}

@end

@implementation SlotViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    slots = @[
             [UIImage imageNamed:@"slot-plum"],
             [UIImage imageNamed:@"slot-seven"],
             [UIImage imageNamed:@"slot-orange"],
             [UIImage imageNamed:@"slot-melon"],
             [UIImage imageNamed:@"slot-lemon"],
             [UIImage imageNamed:@"slot-jackpot"],
             [UIImage imageNamed:@"slot-cherry"],
             [UIImage imageNamed:@"slot-bar"],
             [UIImage imageNamed:@"slot-bananas"],
             ];
    
    UIPickerView *pickerView = [UIPickerView new];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [self.view addSubview:pickerView];
}

#pragma mark - PickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return slots.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 64;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 64;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIImageView *imageView = (UIImageView *)view;
    
    if(!imageView){
        imageView = [UIImageView new];
    }
    
    imageView.image = slots[row];
    
    return imageView;
}

@end
