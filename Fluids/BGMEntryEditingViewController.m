//
//  BGMEntryEditingViewController.m
//  Fluids
//
//  Created by Bert Muthalaly on 7/19/14.
//  Copyright (c) 2014 Adhesive Buck. All rights reserved.
//

#import "BGMEntryEditingViewController.h"
#import "BGMLogEntry.h"

@interface BGMEntryEditingViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *drinkTypePicker;
@property (weak, nonatomic) IBOutlet UILabel *drinkAmountLabel;
@property (strong, nonatomic) NSDate *currentDate;
@end

@implementation BGMEntryEditingViewController
- (NSDate *)drinkTime {
    return _currentDate;
}
- (DrinkType)drinkType {
    return (DrinkType)[self.drinkTypePicker selectedRowInComponent:0];
}
- (NSNumber *)drinkAmount {
    return [NSNumber numberWithInteger:[self.drinkAmountLabel.text integerValue]];
}

- (IBAction)drinkAmountStepperPressed:(UIStepper *)sender {
    NSInteger stepperValue = [[NSNumber numberWithFloat:sender.value] integerValue];
    self.drinkAmountLabel.text = [NSString stringWithFormat:@"%ld", (long)stepperValue];
    
}

- (IBAction)createEntry:(UIButton *)sender {
    [self.entryCreationDelegate createNewLogEntry:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    
    self.dateLabel.text = [dateFormatter stringFromDate:_currentDate];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return NUM_DRINK_TYPES; // defined in BGMLogEntry.h
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    // we're punning on the row index by casting it to its equivalent drink type value, and returning that
    return [[NSAttributedString alloc] initWithString: [BGMLogEntry descriptionForDrinkType:(DrinkType)row]];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
