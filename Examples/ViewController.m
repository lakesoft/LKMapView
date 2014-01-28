//
//  ViewController.m
//  LKMapView
//
//  Created by Hiroshi Hashiguchi on 2014/01/28.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//
@import MapKit;
#import "ViewController.h"
#import "LKMapView.h"

@interface ViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet LKMapView *mapView;
@property (strong, nonatomic) CLLocationManager* locationManager;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationManager = CLLocationManager.new;
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"updating...");
    self.mapView.location = newLocation;
}

@end
