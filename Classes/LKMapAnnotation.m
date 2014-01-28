//
//  LKMapAnnotation.m
//  LKLocationManager
//
//  Created by Hiroshi Hashiguchi on 2014/01/28.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKMapAnnotation.h"

@interface LKMapAnnotation()
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@end

@implementation LKMapAnnotation

+ (LKMapAnnotation*)mapAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    LKMapAnnotation* mapAnnotation = self.new;
    mapAnnotation.coordinate = coordinate;
    return mapAnnotation;
}

@end
