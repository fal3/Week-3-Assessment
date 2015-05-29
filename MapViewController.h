//
//  MapViewController.h
//  CodeChallenge3
//
//  Created by Vik Denic on 10/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StationsListViewController.h"
#import <CoreLocation/CoreLocation.h>

#import "BikeStop.h"

@interface MapViewController : UIViewController

@property BikeStop * bike;

@property NSMutableString *directions;

@end
