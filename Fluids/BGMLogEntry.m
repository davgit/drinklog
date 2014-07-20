//
//  BGMLogEntry.m
//  Fluids
//
//  Created by Bert Muthalaly on 7/19/14.
//  Copyright (c) 2014 Adhesive Buck. All rights reserved.
//

#import "BGMLogEntry.h"

@implementation BGMLogEntry
- (id) initFromDescription:(id<BGMLogEntryDescription>)description {
    if (self = [super init]) {
        _drinkAmount = description.drinkAmount;
        _drinkTime = description.drinkTime;
        _drinkType = description.drinkType;
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *resultDictionary;
    [resultDictionary setObject:self.drinkTime forKey:@"drinkTime"];
    [resultDictionary setObject:self.drinkAmount forKey:@"drinkAmount"];
    [resultDictionary setObject:[NSNumber numberWithInt:self.drinkType] forKey:@"drinkType"];
    return resultDictionary;
}

- (id) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        _drinkAmount = [dictionary objectForKey:@"drinkAmount"];
        _drinkTime = [dictionary objectForKey:@"drinkTime"];
        _drinkType = [[dictionary objectForKey:@"drinkType"] intValue];
    }
    return self;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"%@ cups of %@", self.drinkAmount, [BGMLogEntry descriptionForDrinkType:self.drinkType]];
}

+ (NSString *) descriptionForDrinkType:(DrinkType)drinkType {
    switch (drinkType) {
        case Beer:
            return @"beer";
        case Coffee:
            return @"coffee";
        case Whiskey:
            return @"whiskey";
        case Tea:
            return @"tea";
        case Milk:
            return @"milk";
        case Soda:
            return @"soda";
        case Water:
            return @"water";
        default:
            return @"unknown";
    }
}

@end
