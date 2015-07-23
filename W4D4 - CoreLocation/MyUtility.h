//
//  MyUtility.h
//  W4D4 - CoreLocation
//
//  Created by Daniel Mathews on 2015-07-23.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MyUtility : NSObject

+ (void)responseFrom4sq:(CLLocation*)currentLocation categoryId:(NSString*)categoryId limit:(NSString*)limit block:(void (^)(NSArray *locationsArray, NSError *error))completionBlock;

@end
