//
//  MarshrutkiApi.m
//  MU107
//
//  Created by Igor Tomych on 27/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import "MarshrutkiApi.h"
#import "Route.h"

@implementation MarshrutkiApi

+ (MarshrutkiApi *)sharedClient {
    static MarshrutkiApi *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[MarshrutkiApi alloc] init];
        
        _sharedClient.objectModel = [NSManagedObjectModel mergedModelFromBundles:nil];

        NSString *storePath = [[_sharedClient applicationDocumentsDirectory] stringByAppendingPathComponent:@"Marshrutki.sqlite"];

        _sharedClient.persistentStore = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_sharedClient.objectModel];
        
        NSError *error;
        
        [_sharedClient.persistentStore addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:storePath] options:nil error:&error];
        _sharedClient.context = [[NSManagedObjectContext alloc] init];
        
        _sharedClient.context.persistentStoreCoordinator = _sharedClient.persistentStore;
        
        Bus* busObject = [NSEntityDescription insertNewObjectForEntityForName:@"Bus" inManagedObjectContext:_sharedClient.context];
        
//        Route* testRoute = [NSEntityDescription insertNewObjectForEntityForName:@"Route" inManagedObjectContext:_sharedClient.context];
        
//        testRoute.name = @"Test Route";

        [_sharedClient.context save:&error];
        
    });
    
    return _sharedClient;
}

- (NSString *)applicationDocumentsDirectory {
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

-(void)getRoutes:(void (^)(NSArray *, NSError *))block params:(NSDictionary *)params {
    
    void (^mySuccessBlock)(AFHTTPRequestOperation *operation, id responseObject) = ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray* rawRoutes = (NSArray*) responseObject;
        
        NSMutableArray* routes = [[NSMutableArray alloc] init];
        
//        for (NSDictionary* attributes in rawRoutes) {
//            [routes addObject:[Route initRouteWithDictionary:attributes]];
//        }
        
        if (block != nil) {
            block(routes, nil);
        }
    };
    
    void (^failureBlock)(AFHTTPRequestOperation *operation, NSError *error) = ^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"Error: %@", error);
        
        if (block != nil) {
            block(nil, error);
        }
    };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:ROUTESURL parameters:nil success:mySuccessBlock failure:failureBlock];
}
@end
