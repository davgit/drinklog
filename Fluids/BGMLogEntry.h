//
//  BGMLogEntry.h
//  Fluids
//
//  Created by Bert Muthalaly on 7/19/14.
//  Copyright (c) 2014 Adhesive Buck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGMLogEntryDescription.h"

@interface BGMLogEntry : NSObject
@property (nonatomic, assign) DrinkType drinkType;
@property (strong, nonatomic) NSNumber* drinkAmount;
@property (strong, nonatomic) NSDate* drinkTime;
+ (NSString *) descriptionForDrinkType:(DrinkType)drinkType;
- (id) initFromDescription:(id<BGMLogEntryDescription>)description;
- (NSDictionary *)dictionaryRepresentation;
@end
