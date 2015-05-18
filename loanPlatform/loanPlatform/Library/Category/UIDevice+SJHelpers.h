//
//  UIDevice+SJHelpers.h
//  cupid
//
//  Created by supernian on 15/1/23.
//  Copyright (c) 2015年 VISION CORE CORP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#if __IPHONE_8_0 && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
#define IF_IOS8_OR_GREATER(...) if ([[UIDevice currentDevice] wbt_systemMainVersion] >= 8) { __VA_ARGS__ }
#else
#define IF_IOS8_OR_GREATER(...)
#endif

#define SJWindow ((UIWindow*)([[UIApplication sharedApplication].delegate performSelector:@selector(window)]))
#define SJKeyWindowPortraitWidth SJWindow.bounds.size.width
#define SJKeyWindowPortraitHeight SJWindow.bounds.size.height

typedef NS_ENUM(NSUInteger, SJ_ScreenType)
{
    SJ_ScreenTypeUndefined = 0,
    SJ_ScreenTypeRetina = 2,//4&4s
    SJ_ScreenType4InchRetina = 3,//5&5s&5c
    SJ_ScreenType6 = 4,//6或者6+放大模式
    SJ_ScreenType6Plus = 5,//6+
};

@interface UIDevice (SJHelpers)


/*!
 *  判断当前屏幕类型（按分辨率分类）
 *
 *
 */
- (SJ_ScreenType)screenType;

/*!
 *  判断当前手机是否为iphone4或iphone4s
 *
 *  @return ,返回值YES代表是，否则不是
 */
- (BOOL)sj_isScreenTypeRetina;

/*!
 *  判断当前UIScreen的frame是否iPhone5分辨率
 *
 *
 */
- (BOOL)sj_is4InchRetinaDisplay;

/*!
 *  判断当前UIScreen的frame是否时480以上
 *
 *
 */
- (BOOL)sj_isLongScreen;

/*!
 *  判断当前是否为 iPhone 6
 *
 *  @discussion 布局时请尽量避免使用此方法。好的布局应当能自动适配任何屏幕宽度，而不是针对 iPhone 6 作特殊处理。此方法通过以下条件判断：1.设备是iPhone; 2.nativeScale > 2.1; 3.屏幕高度为 736。这个判断可能在苹果发布新设备后失效
 *
 *  @return
 */
- (BOOL)sj_isIPhone6;


/*!
 *  判断当前是否为 iPhone 6 Plus
 *
 *  @discussion 布局时请尽量避免使用此方法。好的布局应当能自动适配任何屏幕宽度，而不是针对 iPhone 6 Plus 作特殊处理。此方法通过以下条件判断：1.设备是iPhone; 2.nativeScale > 2.1; 3.屏幕高度为 736。这个判断可能在苹果发布新设备后失效
 *
 *  @return
 */
- (BOOL)sj_isIPhone6Plus;

/*!
 *  返回当前系统版本号
 */
- (int)sj_systemMainVersion;

/*!
 * 是否是iphone4
 */

- (BOOL)isIphone4;

/*!
 * 是否是iphone4s
 */
- (BOOL)isIphone4s;

/*!
 * 是否是iphone5
 */
- (BOOL)isIphone5;

/*!
 * 手机系统类型
 */
- (NSString *)iphoneVersion;

@end
