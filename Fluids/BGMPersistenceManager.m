//
//  BGMPersistenceManager.m
//  Fluids
//
//  Created by Bert Muthalaly on 7/20/14.
//  Copyright (c) 2014 Adhesive Buck. All rights reserved.
//

#import "BGMPersistenceManager.h"

@implementation BGMPersistenceManager
+ (BOOL)persistLogEntryCollection:(NSArray *)logEntries {
    NSMutableArray *resultArray;
    for (BGMLogEntry *entry in logEntries) {
        [resultArray addObject:[entry dictionaryRepresentation]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:resultArray forKey:@"logEntries"];
    return YES;
}
+ (NSArray *)retrieveLogEntryCollection {
    return (NSArray *)[[NSUserDefaults standardUserDefaults] objectForKey:@"logEntries"];
}
@end
