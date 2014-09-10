//
//  MainViewController.m
//  TipCalc
//
//  Created by Jianbao Tao on 9/5/14.
//  Copyright (c) 2014 ___JimTao___. All rights reserved.
//

#import "MainViewController.h"
#import "SettingsViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@end

@implementation MainViewController

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
    // Do any additional setup after loading the view from its nib.
    [self.billField becomeFirstResponder];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onSettingsButton {
    NSLog(@"settings button tapped");
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

@end
