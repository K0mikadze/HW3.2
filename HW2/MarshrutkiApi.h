//
//  MarshrutkiApi.h
//  MU107
//
//  Created by Igor Tomych on 27/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <CoreData/CoreData.h>

@interface MarshrutkiApi : NSObject

@property (strong, nonatomic) NSManagedObjectContext* context;
@property (strong, nonatomic) NSManagedObjectModel* objectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator* persistentStore;

+ (MarshrutkiApi *)sharedClient;

- (void)getRoutes:(void (^)(NSArray *routes, NSError *error))block params:(NSDictionary *)params;
@end
