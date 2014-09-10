//
//  BasicViewController.m
//  TipCalc
//
//  Created by Jianbao Tao on 9/6/14.
//  Copyright (c) 2014 ___JimTao___. All rights reserved.
//

#import "BasicViewController.h"
#import "Settings.h"
#import "Utils.h"

@interface BasicViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *splitLabel;
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ratesControl;
@property (weak, nonatomic) IBOutlet UITextField *splitField;

@end

@implementation BasicViewController

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
    self.splitField.text = @"1";
    [self.billField becomeFirstResponder];
    [self updateRateControl];
}

- (void) viewWillAppear:(BOOL)animated {
    [self updateRateControl];
    [self updateLabels];
}

- (void) updateRateControl {
    NSArray *ratesInSettings = [Settings tipRates];
    for( int i = 0; i < self.ratesControl.numberOfSegments; i++) {
        double rate = [[ratesInSettings objectAtIndex:i] doubleValue];
        [self.ratesControl setTitle:[self rateToSegmentText:rate] forSegmentAtIndex:i];
    }
    self.ratesControl.selectedSegmentIndex = [Settings lastTipRateSegmentIndex];
}

- (NSString *) rateToSegmentText:(double) rate {
    return [NSString stringWithFormat:@"%d%%", (int)(rate * 100)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)updateLabels {
    double bill = self.billField.text.doubleValue;
    double tip = bill * [self tipRate];
    double total = bill  + tip;
    double split = total / self.splitField.text.doubleValue;
    self.tipLabel.text = [NSString stringWithFormat:@"%.2f", tip];
    self.splitLabel.text = [NSString stringWithFormat:@"%.2f", split];
}

- (IBAction)updateValuesAction:(id)sender {
    [self updateLabels];
    [self updateLastTipRateInSettings];
}

- (void) updateLastTipRateInSettings {
    int index = self.ratesControl.selectedSegmentIndex;
    [Settings updateWithLastTipRateSegmentIndex:index];
}

- (double) tipRate {
    NSArray *ratesInSettings = [Settings tipRates];
    NSLog(@"rates in settings: %@", ratesInSettings);
    return [[ratesInSettings objectAtIndex:self.ratesControl.selectedSegmentIndex] doubleValue];
}

- (int) splitNumber {
    return [self.splitField.text intValue];
}

@end
