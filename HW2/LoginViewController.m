//
//  ViewController.m
//  HW2
//
//  Created by Вячеслав Ко on 23.01.14.
//  Copyright (c) 2014 Vyacheslav Ko. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)privateMethod{
    
    
    
}
- (IBAction)actionLogin:(UIButton *)sender {
    NSLog(@"Login action!");
    NSLog(@"Login: %@",self.txtLogin.text);
    NSLog(@"Password: %@",self.txtPassword.text);
    
    //-------------------------------------------
    //User* user = [[User alloc]init];
    
    User* user = [User userWithName:self.txtLogin.text andPassword:self.txtPassword.text];
    
    //user.username = self.txtLogin.text;
    //user.userpassword = self.txtPassword.text;
    
    [user Login];
    
    NSLog(@"%@", user);
    
}

@end
