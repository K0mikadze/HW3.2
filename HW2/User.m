//
//  User.m
//  HW2
//
//  Created by Вячеслав Ко on 23.01.14.
//  Copyright (c) 2014 Vyacheslav Ko. All rights reserved.
//

#import "User.h"

@implementation User


+(User *)userWithName:(NSString *)name andPassword:(NSString *)password{
    
    User* user = [[User alloc] init];
    
    user.username = name;
    user.userpassword = password;
    
    return user;
    
}

- (void)Login {
    
    NSLog(@"Try to login the user!");
}
@end
