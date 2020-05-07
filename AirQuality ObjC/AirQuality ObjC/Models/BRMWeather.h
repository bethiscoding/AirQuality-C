//
//  BRMWeather.h
//  AirQuality ObjC
//
//  Created by Bethany Morris on 5/6/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BRMWeather : NSObject

@property (nonatomic, readonly) NSInteger temperature;
@property (nonatomic, readonly) NSInteger humidity;
@property (nonatomic, readonly) NSInteger windSpeed;
@property (nonatomic, readonly, copy) NSString *iconCode;

-(instancetype)initWithTemperature:(NSInteger)temperature
                          humidity:(NSInteger)humidity
                         windSpeed:(NSInteger)windSpeed
                          iconCode:(NSString *)iconCode;

@end

@interface BRMWeather (JSONConvertible)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
