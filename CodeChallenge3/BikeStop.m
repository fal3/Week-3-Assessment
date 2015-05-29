#import "BikeStop.h"



@implementation BikeStop : NSDictionary


- (id) initWithJSONDictionary:(NSDictionary *)dic
{
    if(self = [super init])
    {
        [self parseJSONDictionary:dic];
    }

    return self;
}

- (void) parseJSONDictionary:(NSDictionary *)dic
{
    // PARSER
    id id_ = [dic objectForKey:@"id"];
    if([id_ isKindOfClass:[NSNumber class]])
    {
        self.id = id_;
    }

    id stationName_ = [dic objectForKey:@"stationName"];
    if([stationName_ isKindOfClass:[NSString class]])
    {
        self.stationName = stationName_;
    }

    id availableDocks_ = [dic objectForKey:@"availableDocks"];
    if([availableDocks_ isKindOfClass:[NSNumber class]])
    {
        self.availableDocks = availableDocks_;
    }

    id totalDocks_ = [dic objectForKey:@"totalDocks"];
    if([totalDocks_ isKindOfClass:[NSNumber class]])
    {
        self.totalDocks = totalDocks_;
    }

    id latitude_ = [dic objectForKey:@"latitude"];
    if([latitude_ isKindOfClass:[NSNumber class]])
    {
        self.latitude = latitude_;
    }

    id longitude_ = [dic objectForKey:@"longitude"];
    if([longitude_ isKindOfClass:[NSNumber class]])
    {
        self.longitude = longitude_;
    }

    id statusValue_ = [dic objectForKey:@"statusValue"];
    if([statusValue_ isKindOfClass:[NSString class]])
    {
        self.statusValue = statusValue_;
    }

    id statusKey_ = [dic objectForKey:@"statusKey"];
    if([statusKey_ isKindOfClass:[NSNumber class]])
    {
        self.statusKey = statusKey_;
    }

    id availableBikes_ = [dic objectForKey:@"availableBikes"];
    if([availableBikes_ isKindOfClass:[NSNumber class]])
    {
        self.availableBikes = availableBikes_;
    }

    id stAddress1_ = [dic objectForKey:@"stAddress1"];
    if([stAddress1_ isKindOfClass:[NSString class]])
    {
        self.stAddress1 = stAddress1_;
    }

    id stAddress2_ = [dic objectForKey:@"stAddress2"];
    if([stAddress2_ isKindOfClass:[NSString class]])
    {
        self.stAddress2 = stAddress2_;
    }

    id city_ = [dic objectForKey:@"city"];
    if([city_ isKindOfClass:[NSString class]])
    {
        self.city = city_;
    }

    id postalCode_ = [dic objectForKey:@"postalCode"];
    if([postalCode_ isKindOfClass:[NSString class]])
    {
        self.postalCode = postalCode_;
    }

    id location_ = [dic objectForKey:@"location"];
    if([location_ isKindOfClass:[NSString class]])
    {
        self.location = location_;
    }

    id altitude_ = [dic objectForKey:@"altitude"];
    if([altitude_ isKindOfClass:[NSString class]])
    {
        self.altitude = altitude_;
    }

    id testStation_ = [dic objectForKey:@"testStation"];
    if([testStation_ isKindOfClass:[NSNumber class]])
    {
        self.testStation = [testStation_ boolValue];
    }
    
    id lastCommunicationTime_ = [dic objectForKey:@"lastCommunicationTime"];
    if([lastCommunicationTime_ isKindOfClass:[NSNull class]])
    {
        self.lastCommunicationTime = lastCommunicationTime_;
    }
    
    id landMark_ = [dic objectForKey:@"landMark"];
    if([landMark_ isKindOfClass:[NSString class]])
    {
        self.landMark = landMark_;
    }
    
    
}


@end
