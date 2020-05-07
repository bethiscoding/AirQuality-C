//
//  BRMCityAirQualityController.m
//  AirQuality ObjC
//
//  Created by Bethany Morris on 5/6/20.
//

#import "BRMCityAirQualityController.h"

static NSString * const baseURLString = @"https://api.airvisual.com";
static NSString * const versionComp = @"v2";
static NSString * const countriesComp = @"countries";
static NSString * const statesComp = @"states";
static NSString * const citiesComp = @"cities";
static NSString * const cityDataComp = @"city";
static NSString * const APIKey = @"3539b3e4-7e79-4e4b-acdf-01cf02451e50";

@implementation BRMCityAirQualityController

+ (void)fetchSupportedCountries:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComp];
    NSURL *countriesURL = [versionURL URLByAppendingPathComponent:countriesComp];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:countriesURL resolvingAgainstBaseURL:true]; // No or yes??
    NSURLQueryItem *APIQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:APIKey];
    
    NSMutableArray *newQueryItems = [NSMutableArray arrayWithCapacity:[components.queryItems count]];
    [newQueryItems addObject:APIQuery];
    [components setQueryItems:newQueryItems];
    
    NSURL *finalURL = components.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            NSArray *dataArray = topLevelDictionary[@"data"];
            
            NSMutableArray *countriesArray = [NSMutableArray array];
            for (NSDictionary *dictionary in dataArray)
            {
                NSString *country = dictionary[@"country"];
                [countriesArray addObject:country];
            }
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }
            
            return completion(countriesArray);
        }
    }]resume];
}

+ (void)fetchSupportedStatesInCountry:(NSString *)country completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComp];
    NSURL *statesURL = [versionURL URLByAppendingPathComponent:statesComp];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:statesURL resolvingAgainstBaseURL:true]; // No or yes??
    NSURLQueryItem *countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    NSURLQueryItem *APIQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:APIKey];
    
    NSMutableArray *newQueryItems = [NSMutableArray arrayWithCapacity:[components.queryItems count]];
    [newQueryItems addObject:countryQuery];
    [newQueryItems addObject:APIQuery];
    [components setQueryItems:newQueryItems];
    
    NSURL *finalURL = components.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            NSArray *dataArray = topLevelDictionary[@"data"];
            
            NSMutableArray *statesArray = [NSMutableArray array];
            for (NSDictionary *dictionary in dataArray)
            {
                NSString *state = dictionary[@"state"];
                [statesArray addObject:state];
            }
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }
            
            return completion(statesArray);
        }
    }]resume];
}

+ (void)fetchSupportedCitiesInState:(NSString *)state country:(NSString *)country completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComp];
    NSURL *citiesURL = [versionURL URLByAppendingPathComponent:citiesComp];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:citiesURL resolvingAgainstBaseURL:true]; // No or yes??
    NSURLQueryItem *stateQuery = [[NSURLQueryItem alloc] initWithName:@"state" value:state];
    NSURLQueryItem *countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    NSURLQueryItem *APIQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:APIKey];
    
    NSMutableArray *newQueryItems = [NSMutableArray arrayWithCapacity:[components.queryItems count]];
    [newQueryItems addObject:stateQuery];
    [newQueryItems addObject:countryQuery];
    [newQueryItems addObject:APIQuery];
    [components setQueryItems:newQueryItems];
    
    NSURL *finalURL = components.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            NSArray *dataArray = topLevelDictionary[@"data"];
            
            NSMutableArray *citiesArray = [NSMutableArray array];
            for (NSDictionary *dictionary in dataArray)
            {
                NSString *city = dictionary[@"city"];
                [citiesArray addObject:city];
            }
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }
            
            return completion(citiesArray);
        }
    }]resume];
}

+ (void)fetchDataForCity:(NSString *)city state:(NSString *)state country:(NSString *)country completion:(void (^)(BRMCityAirQuality * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComp];
    NSURL *cityDataURL = [versionURL URLByAppendingPathComponent:cityDataComp];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:cityDataURL resolvingAgainstBaseURL:true]; // No or yes??
    NSURLQueryItem *cityQuery = [[NSURLQueryItem alloc] initWithName:@"city" value:city];
    NSURLQueryItem *stateQuery = [[NSURLQueryItem alloc] initWithName:@"state" value:state];
    NSURLQueryItem *countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    NSURLQueryItem *APIQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:APIKey];
    
    NSMutableArray *newQueryItems = [NSMutableArray arrayWithCapacity:[components.queryItems count]];
    [newQueryItems addObject:cityQuery];
    [newQueryItems addObject:stateQuery];
    [newQueryItems addObject:countryQuery];
    [newQueryItems addObject:APIQuery];
    [components setQueryItems:newQueryItems];
    
    NSURL *finalURL = components.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }
            
            BRMCityAirQuality *cityData = [[BRMCityAirQuality alloc] initWithDictionary:topLevelDictionary];
            completion(cityData);
        }
    }]resume];
}

+ (void)fetchWeatherIcon:(BRMCityAirQuality *)cityData completion:(void (^)(UIImage * _Nullable image))completion
{
    // Step one: URL
    NSURL *imageURL = [NSURL URLWithString:@"https://www.airvisual.com/images"];
    NSURL *iconURL = [imageURL URLByAppendingPathComponent:cityData.weather.iconCode];
    NSURL *finalURL = [iconURL URLByAppendingPathExtension:@"png"];
    NSLog(@"%@", finalURL);

    // Step Two: handle the datatask
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // check for error
        if (error != nil)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        // handle the response

        // handle the data
        if (!data)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        // Now we have data
        UIImage *icon = [UIImage imageWithData:data];
        completion(icon);
    }]resume];
}

@end
