//
//  LKMapAnnotation.h
//  LKLocationManager
//
//  Created by Hiroshi Hashiguchi on 2014/01/28.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

@import MapKit;

@interface LKMapAnnotation : NSObject <MKAnnotation>

+ (LKMapAnnotation*)mapAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end
