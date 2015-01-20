//
//  SliderCell.m
//  Supinfo
//
//  Created by Jonathan on 20/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "SliderCell.h"

@implementation SliderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(!self){
        return nil;
    }
    
    {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.contentView.frame) - 10, 30)];
        [self.contentView addSubview:self.titleLabel];
    }
    
    {
        CGFloat x = 5;
        CGFloat width = CGRectGetWidth(self.contentView.frame) - x;
        CGFloat y = 40;
        CGFloat height = 30;

        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(x, y, width, height)];
        [self.contentView addSubview:slider];
        
        [slider addTarget:self action:@selector(didSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    
    {
        sliderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, CGRectGetWidth(self.contentView.frame) - 10, 30)];
        [self.contentView addSubview:sliderLabel];
        
        sliderLabel.text = @"Slider value:";
    }
    
    return self;
}

- (void)didSliderValueChanged:(UISlider *)slider
{
    sliderLabel.text = [NSString stringWithFormat: @"Slider value: %.2f", slider.value];
}

@end
