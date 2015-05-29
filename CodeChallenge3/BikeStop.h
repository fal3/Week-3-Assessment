//
//  BikeStop.h
//  CodeChallenge3
//
//  Created by alex fallah on 5/29/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSArray;

@interface BikeStop : NSDictionary

@property (nonatomic, retain) NSDecimalNumber *id;
@property (nonatomic, retain) NSString *stationName;
@property (nonatomic, retain) NSDecimalNumber *availableDocks;
@property (nonatomic, retain) NSDecimalNumber *totalDocks;
@property (nonatomic, retain) NSDecimalNumber *latitude;
@property (nonatomic, retain) NSDecimalNumber *longitude;
@property (nonatomic, retain) NSString *statusValue;
@property (nonatomic, retain) NSDecimalNumber *statusKey;
@property (nonatomic, retain) NSDecimalNumber *availableBikes;
@property (nonatomic, retain) NSString *stAddress1;
@property (nonatomic, retain) NSString *stAddress2;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *postalCode;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *altitude;
@property (nonatomic, assign) BOOL testStation;
@property (nonatomic, retain) NSNull *lastCommunicationTime;
@property (nonatomic, retain) NSString *landMark;

- (id) initWithJSONDictionary:(NSDictionary *)dic;
- (void) parseJSONDictionary:(NSDictionary *)dic;

@end
