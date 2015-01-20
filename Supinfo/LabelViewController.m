//
//  LabelViewController.m
//  Supinfo
//
//  Created by Jonathan on 20/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "LabelViewController.h"

@interface LabelViewController (){
    UILabel *label;
}

@end

@implementation LabelViewController

- (instancetype)initWithTitle:(NSString *)title andItem:(UITabBarSystemItem)item
{
    self = [super init];
    if(!self){
        return nil;
    }
    
    self.title = title;
    self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:item tag:0];
    
    return self;
}

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

        label.text = self.title;
        
        [self.view addSubview:label];
    }
}

@end
