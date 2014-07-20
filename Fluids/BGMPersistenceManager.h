//
//  BGMPersistenceManager.h
//  Fluids
//
//  Created by Bert Muthalaly on 7/20/14.
//  Copyright (c) 2014 Adhesive Buck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGMLogEntry.h"

@interface BGMPersistenceManager : NSObject
+ (BOOL)persistLogEntryCollection:(NSArray *)logEntries;
+ (NSArray *)retrieveLogEntryCollection;
@end
