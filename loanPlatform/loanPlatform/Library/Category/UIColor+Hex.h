//
//  UIColor+Hex.h
//  cupid
//
//  Created by wanglanshou on 15/1/30.
//  Copyright (c) 2015年 VISION CORE CORP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

@end
