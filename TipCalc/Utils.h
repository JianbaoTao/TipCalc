//
//  Utils.h
//  TipCalc
//
//  Created by Jianbao Tao on 9/6/14.
//  Copyright (c) 2014 ___JimTao___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject
+ (UIViewController *) mainViewController;
+ (void) initWindow: (UIWindow *) window;
+ (double) valueFromPercentageString:(NSString*) percent;

@end
