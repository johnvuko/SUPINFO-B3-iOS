//
//  PresentedViewController.m
//  Supinfo
//
//  Created by Jonathan on 20/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController (){
    UILabel *label;
    UIButton *button;
}

@end

@implementation PresentedViewController

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
        label.text = @"I'm a presented view controller";
        
        [self.view addSubview:label];
    }
    
    {
        button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        button.center = self.view.center;
        button.frame = CGRectMake(button.frame.origin.x, CGRectGetHeight(self.view.frame) - 100, button.frame.size.width, button.frame.size.height);
        
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:@"Close" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(didButtonTouch) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
}

- (void)didButtonTouch
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
