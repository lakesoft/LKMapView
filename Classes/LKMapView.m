//
//  LKMapView.m
//  LKLocationManager
//
//  Created by Hiroshi Hashiguchi on 2014/01/28.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKMapView.h"
#import "LKMapAnnotation.h"

@interface LKMapView() <MKMapViewDelegate>
@property (strong, nonatomic) MKCircle *circle;
@property (strong, nonatomic) LKMapAnnotation* annotation;
@end

@implementation LKMapView

#pragma mark - Privates
- (void)_init
{
    self.delegate = self;

    self.circleEnabled = YES;
    self.pinEnabled = YES;
    self.coordinateSpan = 0.0025;
    
    CLLocationCoordinate2D coordinate = CLLocationManager.new.location.coordinate;
    [self addAnnotation:[LKMapAnnotation mapAnnotationWithCoordinate:coordinate]];
}

#pragma mark - Properties
- (void)setCoordinateSpan:(CLLocationDegrees)coordinateSpan
{
    [self setCoordinateSpan:coordinateSpan animated:YES];
}

- (void)setPinEnabled:(BOOL)pinEnabled
{
    _pinEnabled = pinEnabled;
    if (!pinEnabled && self.annotation) {
        [self removeAnnotation:self.annotation];
        self.annotation = nil;
    }
}

- (void)setCircleEnabled:(BOOL)circleEnabled
{
    _circleEnabled = circleEnabled;
    if (!circleEnabled && self.circle) {
        [self removeOverlay:self.circle];
        self.circle = nil;
    }
}

#pragma mark - Basics
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _init];
    }
    return self;
}


#pragma mark - API
- (void)setLocation:(CLLocation*)location
{
    [self setCenterCoordinate:location.coordinate animated:YES];

    if (self.pinEnabled) {
        [self removeAnnotation:self.annotation];
        self.annotation = [LKMapAnnotation mapAnnotationWithCoordinate:location.coordinate];
        [self addAnnotation:self.annotation];
    }

    if (self.circleEnabled) {
        [self removeOverlay:self.circle];
        self.circle = [MKCircle circleWithCenterCoordinate:location.coordinate
                                                    radius:location.horizontalAccuracy];
        [self addOverlay:self.circle];
    }
}

- (void)setCoordinateSpan:(CLLocationDegrees)coordinateSpan animated:(BOOL)animated
{
    _coordinateSpan = coordinateSpan;
    CLLocationCoordinate2D coordinate = CLLocationManager.new.location.coordinate;
    MKCoordinateSpan span = MKCoordinateSpanMake(self.coordinateSpan, self.coordinateSpan);
    MKCoordinateRegion coordinateRegion = MKCoordinateRegionMake(coordinate, span);
    [self setRegion:coordinateRegion animated:YES];
}


#pragma mark - MKMapViewDelegate
-(MKOverlayRenderer *)mapView:(MKMapView*)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    
    MKCircle * circle = (MKCircle *)overlay;
    
    MKCircleRenderer * renderer = [[MKCircleRenderer alloc] initWithCircle:circle];
    renderer.strokeColor = [UIColor colorWithRed:0.5 green:0.5 blue:1.0 alpha:0.4];
    renderer.fillColor = [UIColor colorWithRed:0.5 green:0.5 blue:1.0 alpha:0.2];
    renderer.lineWidth = 0.5;
    return renderer;
    
}

@end
