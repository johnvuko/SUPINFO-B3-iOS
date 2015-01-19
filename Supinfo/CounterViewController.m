//
//  CounterViewController.m
//  Supinfo
//
//  Created by Jonathan on 19/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "CounterViewController.h"

@interface CounterViewController ()

@end

@implementation CounterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGFloat PADDING = 40.;
    CGFloat CONTENT_WIDTH = (CGRectGetWidth(self.view.frame) - 2 * (PADDING));
    CGFloat LABEL_HEIGHT = 40;
    
    {
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING, 30, CONTENT_WIDTH, 2 * LABEL_HEIGHT)];
        
        [self commonToLabel:self.timeLabel];
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    {
        self.startLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING, CGRectGetMaxY(self.timeLabel.frame) + 30, CONTENT_WIDTH, LABEL_HEIGHT)];
        
        [self commonToLabel:self.startLabel];
        self.startLabel.hidden = YES;
    }
    
    {
        self.endLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING, CGRectGetMaxY(self.startLabel.frame) + 5, CONTENT_WIDTH, LABEL_HEIGHT)];
        
        [self commonToLabel:self.endLabel];
        self.endLabel.hidden = YES;
    }
    
    {
        self.durationLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING, CGRectGetMaxY(self.endLabel.frame) + 5, CONTENT_WIDTH, LABEL_HEIGHT)];
        
        [self commonToLabel:self.durationLabel];
        self.durationLabel.hidden = YES;
    }
    
    {
        self.actionButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        self.actionButton.center = self.view.center;
        self.actionButton.frame = CGRectMake(self.actionButton.frame.origin.x, CGRectGetHeight(self.view.frame) - 100, self.actionButton.frame.size.width, self.actionButton.frame.size.height);
        
        [self.actionButton setTitle:@"Start" forState:UIControlStateNormal];
        self.actionButton.backgroundColor = [UIColor whiteColor];
        [self.actionButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [self.actionButton addTarget:self action:@selector(didActionButtonTouch) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:self.actionButton];
    }
    
    {
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"HH:mm";
    }
    
    [self updateClock];
    timer = [NSTimer scheduledTimerWithTimeInterval:1. target:self selector:@selector(updateClock) userInfo:nil repeats:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [timer invalidate];
}

- (void)commonToLabel:(UILabel *)label
{
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    
    [self.view addSubview:label];
}

- (void)updateClock
{
    NSDate *currentDate = [NSDate date];
    self.timeLabel.text = [dateFormatter stringFromDate:currentDate];
}

- (void)didActionButtonTouch
{
    if([self.actionButton.titleLabel.text isEqualToString:@"Start"]){
        startDate = [NSDate date];
        self.startLabel.text = [NSString stringWithFormat:@"Started at: %@", [dateFormatter stringFromDate:startDate]];
        [self.actionButton setTitle:@"Stop" forState:UIControlStateNormal];
        
        self.startLabel.hidden = NO;
    }
    else if([self.actionButton.titleLabel.text isEqualToString:@"Stop"]){
        endDate = [NSDate date];
        self.endLabel.text = [NSString stringWithFormat:@"Ended at: %@", [dateFormatter stringFromDate:endDate]];
        [self.actionButton setTitle:@"Reset" forState:UIControlStateNormal];
        
        NSTimeInterval duration = [endDate timeIntervalSinceDate:startDate];
        self.durationLabel.text = [NSString stringWithFormat:@"%.0f seconds", duration];
        
        self.endLabel.hidden = NO;
        self.durationLabel.hidden = NO;
    }
    else{
        self.startLabel.text = @"";
        self.endLabel.text = @"";
        self.durationLabel.text = @"";
        
        self.startLabel.hidden = YES;
        self.endLabel.hidden = YES;
        self.durationLabel.hidden = YES;
        
        [self.actionButton setTitle:@"Start" forState:UIControlStateNormal];
    }
}

@end
