//
//  UIViewController+TipCalcCategory.m
//  TipCalc
//
//  Created by Jianbao Tao on 9/6/14.
//  Copyright (c) 2014 ___JimTao___. All rights reserved.
//

#import "UIViewController+TipCalcCategory.h"
#import "SettingsViewController.h"

@implementation UIViewController (TipCalcCategory)

- (void) onSettingsButton {
    NSLog(@"settings tapped");
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

@end
