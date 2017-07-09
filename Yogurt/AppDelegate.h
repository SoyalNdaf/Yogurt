//
//  AppDelegate.h
//  Yogurt
//
//  Created by Soyal on 18/05/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AFNetworking/AFNetworking.h"
#import "JTProgressHUD.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import <CoreLocation/CoreLocation.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    CLLocationManager *locationManager;
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

