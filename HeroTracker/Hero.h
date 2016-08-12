//
//  Hero.h
//  HeroTracker
//
//  Created by Komari Herring on 8/8/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *homeworld;
@property (nonatomic) NSString *powers;
@property (nonatomic) NSString *imageName;

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict; 

@end
