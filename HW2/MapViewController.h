//
//  MapViewController.h
//  HW2
//
//  Created by Вячеслав Ко on 24.01.14.
//  Copyright (c) 2014 Vyacheslav Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Route.h"
#import "RouteViewController.h"

@class Route;

@interface MapViewController : UIViewController <RoutesMenuProtocol>
@property (weak, nonatomic) IBOutlet UILabel *routeTitle;

- (void) selectRoute:(Route *)selectedRoute;

@end
