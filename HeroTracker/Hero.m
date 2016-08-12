//
//  Hero.m
//  HeroTracker
//
//  Created by Komari Herring on 8/8/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "Hero.h"

@implementation Hero

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict
{
    Hero *aHero = nil;
    
    if (heroDict)
    {
        aHero = [[Hero alloc] init];
        
        aHero.name = [heroDict objectForKey:@"name"];
        
        aHero.homeworld = heroDict[@"homeworld"];
        
        aHero.powers = heroDict[@"powers"];
        
        aHero.imageName = heroDict[@"heroImage"];
    }
    
    return aHero; 
}
@end
