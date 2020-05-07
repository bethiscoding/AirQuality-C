//
//  BRMCityAirQuality.h
//  AirQuality ObjC
//
//  Created by Bethany Morris on 5/6/20.
//

#import <Foundation/Foundation.h>
#import "BRMWeather.h"
#import "BRMPollution.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRMCityAirQuality : NSObject

@property (nonatomic, readonly, copy) NSString *city;
@property (nonatomic, readonly, copy) NSString *state;
@property (nonatomic, readonly, copy) NSString *country;
@property (nonatomic, readonly) BRMWeather *weather;
@property (nonatomic, readonly) BRMPollution *pollution;

-(instancetype)initWithCity:(NSString *)city
                      state:(NSString *)state
                    country:(NSString *)country
                    weather:(BRMWeather *)weather
                  pollution:(BRMPollution *)pollution;

@end

@interface BRMCityAirQuality (JSONConvertible)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
