//
//  RouteViewController.h
//  HW2
//
//  Created by Вячеслав Ко on 30.01.14.
//  Copyright (c) 2014 Vyacheslav Ko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapViewController;

@interface RouteViewController : UITableViewController

@property (strong,nonatomic) MapViewController* mapController;

@end
