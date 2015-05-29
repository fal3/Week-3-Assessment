//
//  MapViewController.m
//  CodeChallenge3
//
//  Created by Vik Denic on 10/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;


@property MKPointAnnotation *annotation;

@property CLLocationManager *manager;

@property UIAlertView *alert;


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.alert = [[UIAlertView alloc] initWithTitle:@"Test Message"
                                            message:@"This is a test"
                                           delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];

    self.annotation = [MKPointAnnotation new];
    self.manager = [CLLocationManager new];
    CLLocationCoordinate2D zoomLocation;
    self.directions = [NSMutableString new];
    self.manager.delegate = self;
    [self.manager requestAlwaysAuthorization];
    [self.manager startUpdatingLocation];

    NSLog(@"%@",self.mapView.userLocation);

    NSNumber *latitude = [self.bike objectForKey:@"latitude"];
    zoomLocation.latitude = [latitude doubleValue];
    NSNumber *longitude = [self.bike objectForKey:@"longitude"];
    zoomLocation.longitude= [longitude doubleValue];


    self.annotation.coordinate = zoomLocation;
    MKCoordinateRegion region = MKCoordinateRegionMake(zoomLocation, MKCoordinateSpanMake(0.05, 0.05));


    [self.mapView setRegion:region animated:YES];

    self.annotation.title = [self.bike objectForKey:@"stationName"];

    [self.mapView addAnnotation:self.annotation];

//    self.mapView addAnnotation:self.manager




//    [alert release];




    self.mapView.showsUserLocation = YES;
   
}

//
//-(BOOL)enableLocationService
//
//{
//    if ([self.manager loca])
//}







-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if (annotation == mapView.userLocation) {
        return nil;
    }


    MKPinAnnotationView *pin =[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];

    pin.canShowCallout = YES;



    pin.image = [UIImage imageNamed:@"bikeImage"];

    pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];


    return pin;
}


-(void)setDirections
{
    MKMapItem *placemark = [MKMapItem new];

    MKDirectionsRequest *request = [MKDirectionsRequest new];

    CLLocationCoordinate2DMake([[self.bike objectForKey:@"latitude"]doubleValue], [[self.bike objectForKey:@"longitude"]doubleValue]);

    MKPlacemark *destination = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake([[self.bike objectForKey:@"latitude"]doubleValue], [[self.bike objectForKey:@"longitude"]doubleValue]) addressDictionary:nil];

//    CLLocationCoordinate2D zoomLocation;
//    NSNumber *latitude = [self.bike objectForKey:@"latitude"];
//    zoomLocation.latitude = [latitude doubleValue];
//    NSNumber *longitude = [self.bike objectForKey:@"longitude"];
//    zoomLocation.longitude= [longitude doubleValue];
//

//    self.annotation.coordinate = zoomLocation;
//    MKPlacemark *source1 = [MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(zoomLocation.latitude, zoomLocation.longitude) addressDictionary:nil;
//    MKMapItem *source2 = [MKMapItem alloc]initWithPlacemark:source1;

    placemark = [[MKMapItem alloc]initWithPlacemark:destination];
    request.source = [MKMapItem mapItemForCurrentLocation];
    request.destination = placemark;
    [request setTransportType:MKDirectionsTransportTypeWalking];

    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];

    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        NSArray *routes = response.routes;
        MKRoute *route = routes.firstObject;
//        NSMutableString *directions = [NSMutableString new];

        int i = 0;

        for (MKRouteStep * step in route.steps) {
            [self.directions appendFormat:@"%@\n",step.instructions];
            i++;

        }
        self.alert.message = self.directions;
        NSLog(@"%@", self.directions);

    }];


}




-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    //this is where the little information thing on animation gets view
    MKCoordinateRegion region = MKCoordinateRegionMake(view.annotation.coordinate, MKCoordinateSpanMake(0.01, 0.01));

     [self.alert show];

    [self.mapView setRegion:region animated:YES];

    [self setDirections];


}



//
//-(void)loadAddressString:(NSString *)addressString
//{
//
//    CLGeocoder *geocoder = [CLGeocoder new];
//
//    [geocoder geocodeAddressString:addressString completionHandler:^(NSArray *placemarks, NSError *error)
//     {
//         for (CLPlacemark *placemark in placemarks)
//         {
//             MKPointAnnotation *annotation = [MKPointAnnotation new];
//
//             annotation.title = placemark.name;
//
//             annotation.coordinate = placemark.location.coordinate;
//
//             [self.mapView addAnnotation:annotation];
//         }
//     }];
//}




@end
