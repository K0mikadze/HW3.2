//
//  User.h
//  HW2
//
//  Created by Вячеслав Ко on 23.01.14.
//  Copyright (c) 2014 Vyacheslav Ko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong,nonatomic) NSString* username;
@property (strong,nonatomic) NSString* userpassword;

+ (User *)userWithName:(NSString*)name andPassword:(NSString*)password;
- (void) Login;
@end
