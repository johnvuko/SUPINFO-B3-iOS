//
//  DetailedTableViewController.h
//  Supinfo
//
//  Created by Jonathan on 20/01/15.
//  Copyright (c) 2015 Jonathan Tribouharet. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FooItem.h"

@interface DetailedTableViewController : UITableViewController

@property (nonatomic, weak) FooItem *item;

@end
