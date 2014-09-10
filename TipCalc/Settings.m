//
//  Settings.m
//  TipCalc
//
//  Created by Jianbao Tao on 9/6/14.
//  Copyright (c) 2014 ___JimTao___. All rights reserved.
//


#import "Settings.h"

@implementation Settings

+ (NSMutableDictionary *) createInitStore {
    NSMutableDictionary *store = [[NSMutableDictionary alloc] init];
    [store setObject:@[@(0.1), @(0.15), @(0.2)] forKey:TIP_RATES_KEY];
    [store setObject:@(BASIC_LAYOUT) forKey:LAYOUT_KEY];
    [store setObject:@(LIGHT_THEME) forKey:THEME_KEY];
    return store;
}

+ (NSMutableDictionary *)load {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary * storeDict =  [(NSDictionary *)[defaults objectForKey:STORE_KEY] mutableCopy];
    if (!storeDict) {
        storeDict = [Settings createInitStore];
    }
    return storeDict;
}

+ (void) saveWithStore:(NSMutableDictionary *) store {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:store forKey:STORE_KEY];
    [defaults synchronize];
}

+ (LAYOUT_TYPE) layout {
    NSMutableDictionary * storeDict = [Settings load];
    LAYOUT_TYPE layout = [[storeDict objectForKey:LAYOUT_KEY] integerValue];
    return layout;   
}

+ (THEME_TYPE) theme {
    NSMutableDictionary * storeDict = [Settings load];
    THEME_TYPE theme = [[storeDict objectForKey:THEME_KEY] integerValue];
    return theme;
}

+ (NSMutableArray *) tipRates {
    NSMutableDictionary * storeDict = [Settings load];
    
    return [[storeDict objectForKey:TIP_RATES_KEY] mutableCopy];
}

+ (void) updateWithTipRates:(NSArray *) rates {
    NSMutableDictionary * storeDict = [Settings load];
    [storeDict setObject:[rates mutableCopy] forKey:TIP_RATES_KEY];
    [Settings saveWithStore: storeDict];
}

+ (void) updateWithLayout:(LAYOUT_TYPE) layout {
    NSMutableDictionary * storeDict = [Settings load];
    [storeDict setObject:@(layout) forKey:LAYOUT_KEY];
    [Settings saveWithStore: storeDict];
}

+ (void) updateWithTheme:(THEME_TYPE) theme {
    NSMutableDictionary * storeDict = [Settings load];
    [storeDict setObject:@(theme) forKey:THEME_KEY];
    [Settings saveWithStore: storeDict];
}

+ (void) updateWithLastTipRateSegmentIndex:(int) index {
     NSMutableDictionary * storeDict = [Settings load];
    [storeDict setObject:@(index) forKey:LAST_TIP_RATE_KEY];
    [Settings saveWithStore: storeDict];    
}

+ (int) lastTipRateSegmentIndex {
    NSMutableDictionary * storeDict = [Settings load];
    id value = [storeDict objectForKey:LAST_TIP_RATE_KEY];
    if( value ) {
        return [value intValue];
    }
    return 0;
}

@end
