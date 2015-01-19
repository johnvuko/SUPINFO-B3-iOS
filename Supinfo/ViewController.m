//
//  ViewController.m
//  Supinfo
//
//  Created by Jonathan on 19/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 30)];
    
    label.center = self.view.center;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Hello world!";
    
    [self.view addSubview:label];
}

@end
