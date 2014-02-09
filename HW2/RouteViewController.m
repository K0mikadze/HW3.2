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
#import "Config.h"
#import "JASidePanelController.h"
//#import "MarshrutkiApi.h"

@interface RouteViewController ()
@property (strong,nonatomic) NSMutableArray* routes;
@property (strong,nonatomic) NSMutableArray* favoriteRoutes;
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
    
    self.tableView.backgroundColor = MENU_BACKGROUND_COLOR;
    
    
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
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(favoritiesChanged) name:NOTIFICATION_FAVS_CHANGED object:nil];
    
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 2; //add 2 section
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.routes.count;
}

-(void)tableView:(UITableView* )tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIButton* disclosureButton = [[cell.subviews[0] subviews] objectAtIndex:0];
    disclosureButton.frame = CGRectMake(200, disclosureButton.frame.origin.y, disclosureButton.frame.size.width, disclosureButton.frame.size.height);
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Route* route = (Route*)self.routes[indexPath.row];
    
    static NSString *CellIdentifier = @"Cell";
    static NSString *FavCellIdentifier = @"FavCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:route.isFavorited?FavCellIdentifier:CellIdentifier forIndexPath:indexPath];
 
    cell.textLabel.text = route.title;
    cell.detailTextLabel.text = route.price;
    
   return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)
    section{
    
//    if (section != 0) {
//        return nil;
//    }
   
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    
    view.backgroundColor = MENU_BACKGROUND_COLOR;
    
    return view;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Route* route = (Route *)self.routes[indexPath.row];
    
   // [self.mapController selectRoute:route];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SetCurrentRoute" object:route.title];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectRoute:)]){
        [self.delegate didSelectRoute:route];
        
    }
  //  JASidePanelController* sideController = self.sidePanelController;
   // [sideController showCenterPanelAnimated:YES];
    
}

-(void)favoritiesChanged{
    
    
    
  //  self.routes = [self.routes sortedArrayUsingSelector:(@selector(Compare:))];
  
//    [self.routes sortWithOptions:NSSortConcurrent usingComparator:^NSComparisonResult(id obj1, id obj2) {
//        return [obj1 isEqual:obj2];
//    }];
//    
    //[self.tableView reloadData];
}



@end
