//
//  BRMWeather.m
//  AirQuality ObjC
//
//  Created by Bethany Morris on 5/6/20.
//

#import "BRMWeather.h"

@implementation BRMWeather

- (instancetype)initWithTemperature:(NSInteger)temperature humidity:(NSInteger)humidity windSpeed:(NSInteger)windSpeed iconCode:(NSString *)iconCode
{
    self = [super init];
    
    if (self)
    {
        _temperature = temperature;
        _humidity = humidity;
        _windSpeed = windSpeed;
        _iconCode = iconCode;
    }
    return self;
}

@end

@implementation BRMWeather (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSInteger temperature = [dictionary[@"tp"] intValue];
    NSInteger humidity = [dictionary[@"hu"] intValue];
    NSInteger windSpeed = [dictionary[@"ws"] intValue];
    NSString *iconCode = dictionary[@"ic"];
    
    return [self initWithTemperature:temperature humidity:humidity windSpeed:windSpeed iconCode:iconCode];
}

@end
