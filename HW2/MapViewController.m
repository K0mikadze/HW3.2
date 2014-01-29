//
//  MapViewController.m
//  HW2
//
//  Created by Вячеслав Ко on 24.01.14.
//  Copyright (c) 2014 Vyacheslav Ko. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UILabel *txtMessage;
- (IBAction)longtapWelcome:(UILongPressGestureRecognizer *)sender;
- (IBAction)tapWelcome:(UITapGestureRecognizer *)sender;

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)longtapWelcome:(UILongPressGestureRecognizer *)sender {
   self.txtMessage.text = @"Welcome, dear User!";
}

- (IBAction)tapWelcome:(UITapGestureRecognizer *)sender {
   
    self.txtMessage.text = @"Welcome, dear User!";
    
}
@end
