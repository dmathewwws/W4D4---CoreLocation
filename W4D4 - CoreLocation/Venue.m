//
//  Venue.m
//  W4D4 - CoreLocation
//
//  Created by Daniel Mathews on 2015-07-23.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

#import "Venue.h"

@implementation Venue

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)aCoordinate andTitle:(NSString *)aTitle andSubtitle:(NSString *)aSubtitle;
{
    self = [super init];
    if (self) {
        _coordinate = aCoordinate;
        _title = aTitle;
        _subtitle = aSubtitle;
    }
    return self;
}

@end
