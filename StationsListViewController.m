//
//  StationsListViewController.m
//  CodeChallenge3
//
//  Created by Vik Denic on 10/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "StationsListViewController.h"
#import "BikeStop.h"
#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface StationsListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;



@property NSDictionary *json;

@property NSMutableArray *bikes;

@end

@implementation StationsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.json = [NSDictionary new];
    self.bikes = [NSMutableArray new];
    [self loadJson];
}


#pragma mark - UITableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // TODO:
    return self.bikes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSLog(@"YO");

    cell.textLabel.text = [[self.bikes objectAtIndex:indexPath.row] objectForKey:@"stationName"];

    id bikesAvailable = [[self.bikes objectAtIndex:indexPath.row]objectForKey:@"availableBikes"];

    cell.detailTextLabel.text = [NSString stringWithFormat:@"Bikes available %@", bikesAvailable];
    // TODO:
    return cell;
}


#pragma mark - Helper Methods

-(void)loadJson
{
    NSLog(@"HELLO??");
    NSString *strURL = @"http://www.bayareabikeshare.com/stations/json";
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         self.json = [[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]objectForKey:@"stationBeanList"];
         for (NSDictionary *bikeStop in self.json)
         {
             BikeStop *bike = [[BikeStop alloc] initWithJSONDictionary:bikeStop];
             [self.bikes addObject:bikeStop];
             NSLog(@"bike stop %@" , bike.longitude);
         }
         [self.tableView reloadData];
     }];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MapViewController *MVC = [MapViewController new];
    MVC = segue.destinationViewController;
    NSInteger selected;
    selected = self.tableView.indexPathForSelectedRow.row;
    BikeStop *bike = [BikeStop new];
    bike = [self.bikes objectAtIndex:selected];
    MVC.bike = bike;

    NSLog(@"Bike long %@", [bike objectForKey:@"longitude"]);
}

- (void) sortBikeArrayBasedOnDistance {
    NSSortDescriptor *locationDescriptor = [[NSSortDescriptor alloc] initWithKey:@"distanceFromUser" ascending:YES];
    NSArray *sortDescriptors = @[locationDescriptor];
    NSArray *toAddToMutableArray = [self.bikes sortedArrayUsingDescriptors:sortDescriptors];
    [self.bikes removeAllObjects];
    [self.bikes addObjectsFromArray:toAddToMutableArray];
//    [self getSecondsToWalkToBikesFromCurrentLocationAndBack];
}


//- (void) getSecondsToWalkToBikeFromCurrentLocationAndBack {
//    NSMutableArray *arrayOfMKMapItems = [NSMutableArray new];
//    MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
//    [arrayOfMKMapItems addObject:currentLocation];
//    for (int i = 0; i < 4; i++) {
//        BikeStop * bike = [self.bikes objectAtIndex:i];
//        MKPlacemark *placemark = bike.location;
//        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
//        [arrayOfMKMapItems addObject:mapItem];
//    }
//    [arrayOfMKMapItems addObject:currentLocation];
//    for (int i = 0; i < 5; i++) {
//        MKMapItem *mkMapItemFirst = [arrayOfMKMapItems objectAtIndex:i];
//        MKMapItem *mkMapItemSecond = [arrayOfMKMapItems objectAtIndex:(i+1)];
//        [self getSecondsToWalkBetweenMKMapItem:mkMapItemFirst SecondMKItem:mkMapItemSecond];
//        [self.tableView reloadData];
//    }
////    [self a;
//}

@end
