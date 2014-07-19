//
//  BGMEntryEditingViewController.h
//  Fluids
//
//  Created by Bert Muthalaly on 7/19/14.
//  Copyright (c) 2014 Adhesive Buck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGMLogEntryCreator.h"
#import "BGMLogEntryDescription.h"

@interface BGMEntryEditingViewController : UIViewController<BGMLogEntryDescription, UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) id<BGMLogEntryCreator> entryCreationDelegate;
@end
