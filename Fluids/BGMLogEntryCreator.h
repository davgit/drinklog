//
//  BGMLogEntryCreator.h
//  Fluids
//
//  Created by Bert Muthalaly on 7/19/14.
//  Copyright (c) 2014 Adhesive Buck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGMLogEntryDescription.h"

@protocol BGMLogEntryCreator <NSObject>
- (void)createNewLogEntry:(id<BGMLogEntryDescription>)sender;
@end
