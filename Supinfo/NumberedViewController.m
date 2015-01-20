//
//  NumberedViewController.m
//  Supinfo
//
//  Created by Jonathan on 20/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "NumberedViewController.h"

@interface NumberedViewController (){
    UILabel *label;
    UIButton *button;
}

@end

@implementation NumberedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0 ,0, CGRectGetWidth(self.view.frame), 30)];
        label.center = self.view.center;
        label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, label.frame.size.height);
        
        label.backgroundColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:label];
    }
      
    {
        button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200., 40)];
        button.center = self.view.center;
        button.frame = CGRectMake(button.frame.origin.x, CGRectGetHeight(self.view.frame) - 100, button.frame.size.width, button.frame.size.height);
        
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(didButtonTouch) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    {
        self.title = [NSString stringWithFormat:@"View %ld", self.number];
        label.text = [NSString stringWithFormat:@"View %ld", self.number];
        [button setTitle:[NSString stringWithFormat:@"Go to view %ld", self.number + 1] forState:UIControlStateNormal];
    }
    
    {
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]
                                          initWithTitle:@"Foo"
                                          style:UIBarButtonItemStyleDone
                                          target:self
                                          action:@selector(didBarButtonTouch)];
        
        self.toolbarItems = @[barButtonItem];
        self.navigationController.toolbarHidden = NO;
    }
    
    {
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }
}

- (void)didButtonTouch
{
    NumberedViewController *controller = [NumberedViewController new];
    controller.number = self.number + 1;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didBarButtonTouch
{
    label.text = @"Foo button touched";
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    label.text = editing ? @"In editing mode" : @"Not in editing mode";

//    Equivalent a
//    if(editing){
//        label.text = @"In editing mode";
//    }
//    else{
//        label.text = @"Not in editing mode";
//    }
}

@end
