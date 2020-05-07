//
//  BRMPollution.h
//  AirQuality ObjC
//
//  Created by Bethany Morris on 5/6/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BRMPollution : NSObject

@property (nonatomic, readonly) NSInteger airQualityIndex;

-(instancetype)initWithAirQualityIndex:(NSInteger)airQualityIndex;

@end

@interface BRMPollution (JSONConvertible)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
