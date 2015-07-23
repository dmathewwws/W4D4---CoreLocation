//
//  AppDelegate.h
//  W4D4 - CoreLocation
//
//  Created by Daniel Mathews on 2015-07-22.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong,nonatomic) CLLocation *currentLocation;

@end

