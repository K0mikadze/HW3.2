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
    
    route.title = attributes[@"route_title"];
    route.price = attributes[@"route_price"];
    
    
    return route;
}



@end
