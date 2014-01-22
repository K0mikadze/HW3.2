//
//  ViewController.h
//  HW2
//
//  Created by Вячеслав Ко on 23.01.14.
//  Copyright (c) 2014 Vyacheslav Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface LoginViewController : UIViewController
- (void) privateMethod;
@property (weak, nonatomic) IBOutlet UITextField *txtLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@end


