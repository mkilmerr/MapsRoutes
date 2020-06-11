//
//  LocationAnnotation.h
//  Maps
//
//  Created by Marcos Kilmer on 11/06/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"
NS_ASSUME_NONNULL_BEGIN

@interface LocationAnnotation : NSObject<MKAnnotation>

@property(nonatomic)CLLocationCoordinate2D coordinate;
@property(strong,nonatomic) NSString* title;

-(instancetype)initMKAnnotation:(NSString*)title coordinate:(CLLocationCoordinate2D)coordinate;

@end

NS_ASSUME_NONNULL_END
