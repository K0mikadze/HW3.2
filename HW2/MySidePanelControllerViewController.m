//
//  MySidePanelControllerViewController.m
//  HW2
//
//  Created by Вячеслав Ко on 30.01.14.
//  Copyright (c) 2014 Vyacheslav Ko. All rights reserved.
//

#import "MySidePanelControllerViewController.h"
#import "MapViewController.h"
#import "RouteViewController.h"

@interface MySidePanelControllerViewController ()

@end

@implementation MySidePanelControllerViewController

-(void) awakeFromNib
{
//    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"]];
//    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"]];
    
    //вместо этого
    UINavigationController* navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
    
    MapViewController* mapViewController = (MapViewController*)
    [navigationController topViewController];
    RouteViewController* routeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"];
    
    //communicate
    routeViewController.delegate = mapViewController;
    
    [self setLeftPanel:routeViewController];
    [self setCenterPanel:navigationController
     ];
    
}

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

@end
