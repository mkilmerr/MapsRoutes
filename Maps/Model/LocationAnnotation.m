//
//  LocationAnnotation.m
//  Maps
//
//  Created by Marcos Kilmer on 11/06/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

#import "LocationAnnotation.h"

@implementation LocationAnnotation


-(instancetype)initMKAnnotation:(NSString *)title coordinate:(CLLocationCoordinate2D)coordinate{
    
    self = [super init];
    
    if(self){
        _title = title;
        _coordinate = coordinate;
    }
    
    
    return self;
}

@end
