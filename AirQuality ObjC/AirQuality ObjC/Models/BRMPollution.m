//
//  BRMPollution.m
//  AirQuality ObjC
//
//  Created by Bethany Morris on 5/6/20.
//

#import "BRMPollution.h"

@implementation BRMPollution

- (instancetype)initWithAirQualityIndex:(NSInteger)airQualityIndex
{
    self = [super init];
    
    if (self)
    {
        _airQualityIndex = airQualityIndex;
    }
    return self;
}

@end

@implementation BRMPollution (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSInteger airQualityIndex = [dictionary[@"aqius"] intValue];
    
    return [self initWithAirQualityIndex:airQualityIndex];
}

@end
