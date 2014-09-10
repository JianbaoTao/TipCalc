//
//  UtilsTest.m
//  TipCalc
//
//  Created by Jianbao Tao on 9/6/14.
//  Copyright (c) 2014 ___JimTao___. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Settings.h"
#import "Utils.h"

#define SETTINGS_KEY @"TestTipCalcSettings"

@interface UtilsTest : XCTestCase
@property Settings *settings;
@property NSUserDefaults *defaults;

@end

@implementation UtilsTest


- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConvertPercentToDouble {
    double value = [Utils valueFromPercentageString:@"15%"];
    XCTAssertEqual(value, 0.15, @"the value should be 0.15");
}
@end
