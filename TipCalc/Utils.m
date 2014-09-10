//
//  Utils.m
//  TipCalc
//
//  Created by Jianbao Tao on 9/6/14.
//  Copyright (c) 2014 ___JimTao___. All rights reserved.
//

#import "Utils.h"
#import "Settings.h"
#import "BasicViewController.h"
#import "UIViewController+TipCalcCategory.h"

@implementation Utils

+ (UIViewController *) mainViewController {
    LAYOUT_TYPE layout = [Settings layout];
    switch (layout) {
        case BASIC_LAYOUT:
            return [[BasicViewController alloc]initWithNibName:@"BasicViewController" bundle:nil];
        default:
            return [[BasicViewController alloc]initWithNibName:@"BasicViewController" bundle:nil];
    }
}

+ (void) initNavBar: (UINavigationItem *) navItem forView: (UIViewController *) vc {
    navItem.title = @"TipCalc";
    navItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:(UIBarButtonItemStylePlain)
                                                                 target:vc action:@selector(onSettingsButton)];
}

+ (void) initWindow: (UIWindow *) window {
    // load main view controller
    UIViewController *vc = [Utils mainViewController];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    window.rootViewController = nvc;
    
    [Utils initNavBar:vc.navigationItem forView:vc];
}

+ (double) valueFromPercentageString:(NSString*) percent {
    return (double)([[percent componentsSeparatedByString:@"%"][0] intValue] * 0.01);
}

@end
