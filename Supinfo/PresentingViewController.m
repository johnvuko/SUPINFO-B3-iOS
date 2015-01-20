//
//  PresentingViewController.m
//  Supinfo
//
//  Created by Jonathan on 20/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "PresentingViewController.h"

#import "PresentedViewController.h"

@interface PresentingViewController (){
    UILabel *label;
    UIButton *button;
}

@end

@implementation PresentingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0 ,0, CGRectGetWidth(self.view.frame), 30)];
        label.center = self.view.center;
        label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, label.frame.size.height);
        
        label.backgroundColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"I'm a presenting view controller";
        
        [self.view addSubview:label];
    }
    
    {
        button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        button.center = self.view.center;
        button.frame = CGRectMake(button.frame.origin.x, CGRectGetHeight(self.view.frame) - 100, button.frame.size.width, button.frame.size.height);
        
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:@"Show other VC" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(didButtonTouch) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
}

- (void)didButtonTouch
{
    PresentedViewController *controller = [PresentedViewController new];
    controller.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:controller animated:YES completion:nil];
}

@end
