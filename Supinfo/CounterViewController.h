//
//  CounterViewController.h
//  Supinfo
//
//  Created by Jonathan on 19/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounterViewController : UIViewController{
    NSTimer *timer;
    
    NSDateFormatter *dateFormatter;
    NSDate *startDate;
    NSDate *endDate;
}

@property (nonatomic) UILabel *timeLabel;
@property (nonatomic) UILabel *startLabel;
@property (nonatomic) UILabel *endLabel;
@property (nonatomic) UILabel *durationLabel;
@property (nonatomic) UIButton *actionButton;

@end
