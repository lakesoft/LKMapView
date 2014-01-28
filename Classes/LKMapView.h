//
//  LKMapView.h
//  LKLocationManager
//
//  Created by Hiroshi Hashiguchi on 2014/01/28.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

@import MapKit;

@interface LKMapView : MKMapView

#pragma mark - Properties
@property (assign, nonatomic) BOOL pinEnabled;      // default: YES
@property (assign, nonatomic) BOOL circleEnabled;   // default: YES
@property (assign, nonatomic) CLLocationDegrees coordinateSpan;  // default: 0.0025

#pragma mark - API
- (void)setLocation:(CLLocation*)location;
- (void)setCoordinateSpan:(CLLocationDegrees)coordinateSpan animated:(BOOL)animated;

@end
