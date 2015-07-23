//
//  ViewController.m
//  W4D4 - CoreLocation
//
//  Created by Daniel Mathews on 2015-07-22.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"
#import "AppDelegate.h"
#import "MyUtility.h"
#import "Venue.h"

#define zoominMapArea 2100

@interface ViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) CLLocation *currentLocation;
@property (assign,nonatomic) BOOL mapLoadedWithVenues;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.showsUserLocation = true;
    _mapLoadedWithVenues = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- Map

- (void) initiateMap {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    //[appDelegate startLocationManager];
    //no need because startLocationManager initates on launch
    
    _currentLocation = [[CLLocation alloc] initWithLatitude:appDelegate.currentLocation.coordinate.latitude longitude:appDelegate.currentLocation.coordinate.longitude];
    
    CLLocationCoordinate2D zoomLocation = CLLocationCoordinate2DMake(_currentLocation.coordinate.latitude, _currentLocation.coordinate.longitude);
    
    MKCoordinateRegion adjustedRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, zoominMapArea, zoominMapArea);
    
    [_mapView setRegion:adjustedRegion animated:YES];
    
    [MyUtility responseFrom4sq:_currentLocation categoryId:@"4d4b7105d754a06377d81259" limit:@"10" block:^(NSArray *locationsArray, NSError *error) {
        if (!error){
            
            _mapLoadedWithVenues = YES;
            
            for (NSDictionary *fsqrDict in locationsArray){
                
                NSString *name = fsqrDict[@"name"];
                NSDictionary *locationDict = fsqrDict[@"location"];
                NSString *address = locationDict[@"address"];
                NSNumber *lat = locationDict[@"lat"];
                NSNumber *lng = locationDict[@"lng"];
                
                Venue *venue = [[Venue alloc] initWithCoordinate:CLLocationCoordinate2DMake([lat doubleValue], [lng doubleValue]) andTitle:name andSubtitle:address];
            
                        dispatch_async(dispatch_get_main_queue(), ^(){
                            [self.mapView addAnnotation:venue];
                        });
            }

        }
    }];

}

-(void)mapViewDidFinishLoadingMap:(nonnull MKMapView *)mapView{
    if (!_mapLoadedWithVenues) {
        [self initiateMap];
    }
}

@end
