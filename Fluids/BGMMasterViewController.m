//
//  BGMMasterViewController.m
//  Fluids
//
//  Created by Bert Muthalaly on 7/19/14.
//  Copyright (c) 2014 Adhesive Buck. All rights reserved.
//

#import "BGMMasterViewController.h"

#import "BGMEntryEditingViewController.h"
#import "BGMLogEntry.h"
#import "BGMPersistenceManager.h"

@interface BGMMasterViewController () {
    NSMutableArray *entries;
}
@end

@implementation BGMMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    entries = [[BGMPersistenceManager retrieveLogEntryCollection] mutableCopy];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [BGMPersistenceManager persistLogEntryCollection:entries];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNewLogEntry:(id<BGMLogEntryDescription>)sender {
    BGMLogEntry *entry = [[BGMLogEntry alloc] initFromDescription:sender];
    [self insertNewLogEntry:entry];
}

- (void)insertNewLogEntry:(BGMLogEntry *)entry {
    if (!entries) {
        entries = [[NSMutableArray alloc] init];
    }
    [entries insertObject:entry atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    BGMLogEntry *entry = entries[indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    cell.textLabel.text = [entry description];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:[entry drinkTime]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [entries removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showEntryEditingView"]) {
        [[segue destinationViewController] setEntryCreationDelegate:self];
    }
}

@end
