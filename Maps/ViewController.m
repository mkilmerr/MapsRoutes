//
//  ViewController.m
//  Maps
//
//  Created by Marcos Kilmer on 11/06/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

#import "ViewController.h"
#import "LocationAnnotation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 5.0;
    
    [locationManager requestWhenInUseAuthorization];
    
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse){
        
        [locationManager startUpdatingLocation];
        
    }
    
    
    LocationAnnotation *apple = [[LocationAnnotation alloc] initMKAnnotation:@"Apple Union Square" coordinate:CLLocationCoordinate2DMake(37.7887, -122.4072)];
    _mapView.delegate = self;
    [_mapView addAnnotation:apple];
//    [_mapView setCenterCoordinate:apple.coordinate animated:NO];
    
    // 33.618014, -117.927703
    LocationAnnotation *blueBottleCoffee = [[LocationAnnotation alloc] initMKAnnotation:@"Blue Bottle Coffee" coordinate:CLLocationCoordinate2DMake(33.618014, -117.927703)];
    
    [_mapView addAnnotations:@[apple,blueBottleCoffee]];
    
    [self displayRoute:CLLocationCoordinate2DMake(apple.coordinate.latitude, apple.coordinate.longitude) destination:CLLocationCoordinate2DMake(blueBottleCoffee.coordinate.latitude, blueBottleCoffee.coordinate.longitude)];
    
    
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    
    MKPolylineRenderer *render = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    render.strokeColor = UIColor.blueColor;
    render.lineWidth = 5.0;
    
    return render;
}

-(void)displayRoute:(CLLocationCoordinate2D)source destination:(CLLocationCoordinate2D)destination{
    
    MKPlacemark *sourcePlacemark = [[MKPlacemark alloc] initWithCoordinate:source];
    MKPlacemark *destinationPlacemark = [[MKPlacemark alloc] initWithCoordinate:destination];
    
    
    //    MKDirections *directionRequest = [[MKDirections alloc] initWithRequest: [[MKDirectionsRequest alloc] init]];
    
    MKDirectionsRequest *directionRequest =  [[MKDirectionsRequest alloc] init];
    directionRequest.source = [[MKMapItem alloc] initWithPlacemark:sourcePlacemark];
    directionRequest.destination = [[MKMapItem alloc] initWithPlacemark:destinationPlacemark];
    directionRequest.transportType = MKDirectionsTransportTypeAutomobile;
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:directionRequest];
    
    
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"There is a error with calculating route %@",error);
            return;
        }else{
            [self->_mapView addOverlay:response.routes.firstObject.polyline level:MKOverlayLevelAboveRoads];
            [self->_mapView setVisibleMapRect:response.routes.firstObject.polyline.boundingMapRect edgePadding:UIEdgeInsetsMake(80.0, 80.0, 80.0, 80.8) animated:NO];
        }
        
        
    }];
    
    //    [directions calculateETAWithCompletionHandler:^(MKETAResponse * _Nullable response, NSError * _Nullable error) {
    //
    //        if(error){
    //            NSLog(@"There is a error with calculating route %@",error);
    //            return;
    //        }else{
    //            response.
    //        }
    //
    //    }];
    
    
    
    //    MKDirectionsRequest *directionRequest = [[MKDirections all];
    
    //    directionRequest.source = [[MKMapItem alloc] initWithPlacemark:]
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse){
        [locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    float latitude = locations.firstObject.coordinate.latitude;
    float longitude = locations.firstObject.coordinate.longitude;
    
    NSLog(@"%f",latitude);
    NSLog(@"%f",longitude);
}


@end
