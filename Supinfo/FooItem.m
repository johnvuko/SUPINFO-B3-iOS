//
//  FooItem.m
//  Supinfo
//
//  Created by Jonathan on 20/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import "FooItem.h"

@implementation FooItem

- (instancetype)initWithTitle:(NSString *)title andValue:(CGFloat)value
{
    self = [super init];
    if(!self){
        return nil;
    }
    
    self.title = title;
    self.value = value;
    
    return self;
}

@end
