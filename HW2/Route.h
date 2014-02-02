//
//  Route.h
//  HW2
//
//  Created by Вячеслав Ко on 23.01.14.
//  Copyright (c) 2014 Vyacheslav Ko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject
+ (Route *)initRouteWithDictionary:(NSDictionary *)attributes;
@property NSString* Name;
@property (strong,nonatomic) NSString* title;
@end
