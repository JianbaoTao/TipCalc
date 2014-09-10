//
//  SettingsTest.m
//  TipCalc
//
//  Created by Jianbao Tao on 9/6/14.
//  Copyright (c) 2014 ___JimTao___. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Settings.h"


@interface SettingsTest : XCTestCase

@end

@implementation SettingsTest

- (void)setUp
{
    [super setUp];
    
    // create and save an initial settings store
    NSDictionary *initStore = @{
                                LAYOUT_KEY:@(BASIC_LAYOUT),
                                THEME_KEY:@(LIGHT_THEME),
                                TIP_RATES_KEY:@[@(0.1), @(0.15), @(0.2)]
                                };
    NSMutableDictionary *store = [[NSMutableDictionary alloc] initWithDictionary:initStore];
    [Settings saveWithStore:store];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    NSMutableDictionary *settings = [Settings load];
    NSArray *rates = [Settings tipRates];
    LAYOUT_TYPE layout = [Settings layout];
    THEME_TYPE theme = [Settings theme];
    
    XCTAssertNotNil( settings );
    XCTAssertEqual([Settings layout], BASIC_LAYOUT, @"the initial layout should basic layout");
    XCTAssertEqual([rates count], 3, @"there should be 3 pre-defined tip rates");
    XCTAssertEqual(layout, BASIC_LAYOUT, @"layout should be BASIC_LAYOUT");
    XCTAssertEqual(theme, LIGHT_THEME, @"theme should be LIGHT_THEME");
}

- (void)testUpdateLayout {
    [Settings updateWithLayout:MODERN_LAYOUT];
    LAYOUT_TYPE layout = [Settings layout];
    XCTAssertEqual(layout, MODERN_LAYOUT, @"layout should be updated to MODERN_LAYOUT");
}

- (void)testUpdateTheme {
    [Settings updateWithTheme:DARK_THEME];
    THEME_TYPE theme = [Settings theme];
    XCTAssertEqual(theme, DARK_THEME, @"theme should be updated to DARK_THEME");
}

- (void)testUpdateRates {
    [Settings updateWithTipRates:@[@(0.2), @(0.21), @(0.23)]];
    NSArray *rates = [Settings tipRates];
    XCTAssertEqual([[rates objectAtIndex:1] floatValue], (float)0.21, @"the second rate should be 0.21");
}


@end
