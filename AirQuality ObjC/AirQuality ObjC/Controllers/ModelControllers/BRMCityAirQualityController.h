//
//  BRMCityAirQualityController.h
//  AirQuality ObjC
//
//  Created by Bethany Morris on 5/6/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BRMCityAirQuality.h"
#import "BRMWeather.h"
#import "BRMPollution.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRMCityAirQualityController : NSObject

+ (void)fetchSupportedCountries:(void (^)(NSArray<NSString *> *_Nullable))completion;
+ (void)fetchSupportedStatesInCountry:(NSString *)country completion:(void (^)(NSArray<NSString *> *_Nullable))completion;
+ (void)fetchSupportedCitiesInState:(NSString *)state country:(NSString *)country completion:(void (^)(NSArray<NSString *> *_Nullable))completion;
+ (void)fetchDataForCity:(NSString *)city state:(NSString *)state country: (NSString *)country completion:(void (^)(BRMCityAirQuality * _Nullable))completion;
+ (void)fetchWeatherIcon:(BRMCityAirQuality *)cityData completion:(void (^)(UIImage * _Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
