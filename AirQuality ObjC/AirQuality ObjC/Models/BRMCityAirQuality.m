//
//  BRMCityAirQuality.m
//  AirQuality ObjC
//
//  Created by Bethany Morris on 5/6/20.
//

#import "BRMCityAirQuality.h"

@implementation BRMCityAirQuality

- (instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(BRMWeather *)weather pollution:(BRMPollution *)pollution
{
    self = [super init];
    
    if (self)
    {
        _city = city;
        _state = state;
        _country = country;
        _weather = weather;
        _pollution = pollution;
    }
    return self;
}

@end

@implementation BRMCityAirQuality (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    NSDictionary *dataDict = topLevelDictionary[@"data"];
    NSString *city = dataDict[@"city"];
    NSString *state = dataDict[@"state"];
    NSString *country = dataDict[@"country"];
    NSDictionary *currentDict = dataDict[@"current"];
    BRMWeather *weather = [[BRMWeather alloc] initWithDictionary:currentDict[@"weather"]];
    BRMPollution *pollution = [[BRMPollution alloc] initWithDictionary:currentDict[@"pollution"]];
    
    return [self initWithCity:city state:state country:country weather:weather pollution:pollution];
}

@end
