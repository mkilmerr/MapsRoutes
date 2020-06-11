//
//  ViewController.h
//  Maps
//
//  Created by Marcos Kilmer on 11/06/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocation/CoreLocation.h"
#import "MapKit/MapKit.h"

@interface ViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate>{
    CLLocationManager *locationManager;

}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

-(void)displayRoute:(CLLocationCoordinate2D) source destination:(CLLocationCoordinate2D)destination;

@end

