//
//  MapViewController.m
//  HW2
//
//  Created by Вячеслав Ко on 24.01.14.
//  Copyright (c) 2014 Vyacheslav Ko. All rights reserved.
//

#import "MapViewController.h"
#import "Route.h"
#import "Config.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UILabel *txtMessage;
@property (nonatomic,strong) UIBarButtonItem* favoriteBarButton;
@property (strong, nonatomic) Route* currentRoute;
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
    
    [[NSNotificationCenter defaultCenter] addObserver:(self) selector:@selector(didGetMyNotification:) name:(@"SetCurrentRoute") object:(nil)];
    
   
    self.favoriteBarButton = [[UIBarButtonItem alloc]initWithTitle:@"★" style:UIBarButtonItemStyleBordered target:nil action: @selector(favAction)];
    
	self.navigationItem.rightBarButtonItem = self.favoriteBarButton;
    
 
    
}

- (void) didGetMyNotification:(NSNotification*)notification{
    self.routeTitle.text =[notification object];

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



#pragma mark - RouteMenuProtocol

-(void)didSelectRoute:(Route *)route{
 //   self.routeTitle.text =   route.title;
    self.title = route.title;
    
    self.currentRoute = route;
    
    self.favoriteBarButton.title = route.isFavorited? @"☆" : @"★";
}

-(void)favAction{
    self.currentRoute.isFavorited = !self.currentRoute.isFavorited;
    self.favoriteBarButton.title = self.currentRoute.isFavorited? @"☆" : @"★";
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_FAVS_CHANGED object:nil];
}

@end
