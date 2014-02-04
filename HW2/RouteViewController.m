//
//  RouteViewController.m
//  HW2
//
//  Created by Вячеслав Ко on 30.01.14.
//  Copyright (c) 2014 Vyacheslav Ko. All rights reserved.
//

#import "RouteViewController.h"
#import "MapViewController.h"
#import <AFNetworking.h>
#import "Route.h"
#import <MBProgressHUD.h>

@interface RouteViewController ()
@property (strong,nonatomic) NSMutableArray* routes;
@end

@implementation RouteViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
   
    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    
    [manager GET:@"http://marshrutki.com.ua/mu/routes.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray* rawRoutes = (NSArray*)responseObject;
        
        self.routes = [[NSMutableArray alloc]init];
        for (NSDictionary* attributes in rawRoutes) {
            [self.routes addObject:[Route initRouteWithDictionary:attributes]];
            
        }
        
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        [self.tableView reloadData];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        NSLog(@"Error: %@", error);
    }];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return self.routes.count;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.routes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Route* route = (Route*)self.routes[indexPath.row];
    cell.textLabel.text = route.title;
    //cell.textLabel.text = [NSString stringWithFormat:@"section %d, row %d", indexPath.section,indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Route* route = (Route *)self.routes[indexPath.row];
    
    [self.mapController selectRoute:route];
    
    //return
    
}

@end
