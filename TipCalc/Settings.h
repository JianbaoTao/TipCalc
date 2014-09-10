//
//  Settings.h
//  TipCalc
//
//  Created by Jianbao Tao on 9/6/14.
//  Copyright (c) 2014 ___JimTao___. All rights reserved.
//

#import <Foundation/Foundation.h>
#define TIP_RATES_KEY @"tip rates"
#define LAYOUT_KEY @"layout"
#define THEME_KEY @"theme"
#define STORE_KEY @"TipCalc Settings"
#define LAST_TIP_RATE_KEY @"last tip rate"

typedef NS_ENUM(NSInteger, LAYOUT_TYPE) {
    BASIC_LAYOUT,
    MODERN_LAYOUT,
    LAYOUT_TYPE_COUNT
};

typedef NS_ENUM(NSInteger, THEME_TYPE) {
    LIGHT_THEME,
    DARK_THEME,
    THEME_TYPE_COUNT
};

@interface Settings : NSObject
+ (NSMutableDictionary *)load;

// getters
+ (LAYOUT_TYPE) layout;
+ (THEME_TYPE) theme;
+ (NSMutableArray *) tipRates;
+ (int) lastTipRateSegmentIndex;

// setters
+ (void) saveWithStore:(NSMutableDictionary *) store;
+ (void) updateWithLayout:(LAYOUT_TYPE) layout;
+ (void) updateWithTheme:(THEME_TYPE) theme;
+ (void) updateWithTipRates:(NSArray *) rates;
+ (void) updateWithLastTipRateSegmentIndex:(int) index;

@end

