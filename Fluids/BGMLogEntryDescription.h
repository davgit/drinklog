//
//  BGMLogEntryDescription.h
//  Fluids
//
//  Created by Bert Muthalaly on 7/19/14.
//  Copyright (c) 2014 Adhesive Buck. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NUM_DRINK_TYPES 7
typedef enum : NSUInteger {
    Coffee,
    Water,
    Soda,
    Beer,
    Tea,
    Whiskey,
    Milk
} DrinkType;

@protocol BGMLogEntryDescription <NSObject>
@property (readonly, nonatomic, assign) DrinkType drinkType;
@property (readonly, strong, nonatomic) NSNumber* drinkAmount;
@property (readonly, strong, nonatomic) NSDate* drinkTime;
@end
