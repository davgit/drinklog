//
//  BGMDataVizViewController.m
//  Fluids
//
//  Created by Bert Muthalaly on 7/20/14.
//  Copyright (c) 2014 Adhesive Buck. All rights reserved.
//

#import "BGMDataVizViewController.h"

@interface BGMDataVizViewController ()

@end

@implementation BGMDataVizViewController

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
    id path = [[NSBundle mainBundle] pathForResource:@"public/index" ofType:@"html"];
    NSLog(@"%@", path);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
