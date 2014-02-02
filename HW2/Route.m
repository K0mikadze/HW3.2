//
//  Route.m
//  HW2
//
//  Created by Вячеслав Ко on 23.01.14.
//  Copyright (c) 2014 Vyacheslav Ko. All rights reserved.
//

#import "Route.h"

@implementation Route
+(Route *)initRouteWithDictionary:(NSDictionary *)attributes{
    Route* route = [[Route alloc] init];
    
    route.Title = attributes[@"route_title"];
    
    return route;
}

@end
