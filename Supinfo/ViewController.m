//
//  ViewController.m
//  Supinfo
//
//  Created by Jonathan on 19/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UILabel *label;
    UIButton *button;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0 ,0, CGRectGetWidth(self.view.frame), 30)];
    label.center = self.view.center;
    label.frame = CGRectMake(label.frame.origin.x, CGRectGetHeight(self.view.frame) / 3., label.frame.size.width, label.frame.size.height);
    
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Hello, World";
    
    [self.view addSubview:label];
    
    
    button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100., 40)];
    button.center = self.view.center;
    button.frame = CGRectMake(button.frame.origin.x, CGRectGetHeight(self.view.frame) - 100, button.frame.size.width, button.frame.size.height);
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"Press me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    
    // Bordure
    button.layer.borderColor = [UIColor blueColor].CGColor;
    button.layer.cornerRadius = 15.;
    button.layer.borderWidth = 1.;
    
    [self.view addSubview:button];
}

- (void)didButtonTouch
{
    if([label.text isEqualToString:@"Hello, World"]){
        label.text = @"Hi there!";
    }
    else{
        label.text = @"Hello, World";
    }
}

@end
