//
//  SettingsViewController.m
//  TipCalc
//
//  Created by Jianbao Tao on 9/6/14.
//  Copyright (c) 2014 ___JimTao___. All rights reserved.
//

#import "SettingsViewController.h"
#import "Settings.h"

#define BASIC_LAYOUT_IMAGE @"layout_basic"
#define MODERN_LAYOUT_IMAGE @"layout_modern"


@interface SettingsViewController ()
@property NSMutableDictionary *settings;
@property (weak, nonatomic) IBOutlet UISegmentedControl *themeControl;
@property (weak, nonatomic) IBOutlet UITextField *rate1Field;
@property (weak, nonatomic) IBOutlet UITextField *rate2Field;
@property (weak, nonatomic) IBOutlet UITextField *rate3Field;
@property (weak, nonatomic) IBOutlet UIPageControl *layoutPageControl;
@property NSDictionary *layoutPageNumberDict;
@property NSDictionary *layoutImageDict;
@property (weak, nonatomic) IBOutlet UIImageView *layoutImageView;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void) initLayoutImages {
    self.layoutImageDict = @{@(BASIC_LAYOUT):[UIImage imageNamed:BASIC_LAYOUT_IMAGE],
                             @(MODERN_LAYOUT):[UIImage imageNamed:MODERN_LAYOUT_IMAGE]};
    self.layoutPageNumberDict = @{@(BASIC_LAYOUT):@(0), @(MODERN_LAYOUT):@(1)};
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.settings = [Settings load];
    [self updateRatesFromSettings];
    [self updateThemeFromSettings];
    [self initLayoutImages];
    
    self.layoutImageView.layer.borderWidth = 1.5f;
    self.layoutImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.layoutImageView.image = [self.layoutImageDict objectForKey:@([Settings layout])];
    self.layoutPageControl.numberOfPages = LAYOUT_TYPE_COUNT;
    self.layoutPageControl.currentPage = [Settings layout];
    NSLog(@"page control size: %@", self.layoutPageControl);
}

- (void) updateLayoutFromSettings {
}

- (void) updateThemeFromSettings {
    THEME_TYPE theme = [Settings theme];
    if (theme == LIGHT_THEME) {
        self.themeControl.selectedSegmentIndex = 0;
    }
    if (theme == DARK_THEME) {
        self.themeControl.selectedSegmentIndex = 1;
    }
}


- (void) updateRatesFromSettings {
    NSArray *rates = [Settings tipRates];
    self.rate1Field.text = [NSString stringWithFormat:@"%.2f",[[rates objectAtIndex:0] doubleValue]];
    self.rate2Field.text = [NSString stringWithFormat:@"%.2f",[[rates objectAtIndex:1] doubleValue]];
    self.rate3Field.text = [NSString stringWithFormat:@"%.2f",[[rates objectAtIndex:2] doubleValue]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateSettingsWithRate: (double) rate atIndex:(int) index {
    NSMutableArray *ratesFromSettings = [Settings tipRates];
    [ratesFromSettings replaceObjectAtIndex:index withObject:@(rate)];
    [Settings updateWithTipRates:ratesFromSettings];
}
- (IBAction)updateRate1Setting:(UITextField *)sender {
    double rate = sender.text.doubleValue;
    [self updateSettingsWithRate:rate atIndex:0];
}
- (IBAction)updateRate2Setting:(UITextField *)sender {
    double rate = sender.text.doubleValue;
    [self updateSettingsWithRate:rate atIndex:1];

}
- (IBAction)updateRate3Setting:(UITextField *)sender {
    double rate = sender.text.doubleValue;
    [self updateSettingsWithRate:rate atIndex:2];
}
- (IBAction)chooseLayoutWithSwipe:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swiped");
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swiped left");
    } else if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swiped right");
    }
}
- (IBAction)updateLayoutImage:(UIPageControl *)sender {
    LAYOUT_TYPE layout = (LAYOUT_TYPE) self.layoutPageControl.currentPage;
    self.layoutImageView.image = [self.layoutImageDict objectForKey:@(layout)];
}

@end
