//
//  UIDevice+SJHelpers.m
//  cupid
//
//  Created by supernian on 15/1/23.
//  Copyright (c) 2015年 VISION CORE CORP. All rights reserved.
//

#import "UIDevice+SJHelpers.h"
#import <sys/utsname.h>

@implementation UIDevice (SJHelpers)

- (SJ_ScreenType)screenType
{
    static SJ_ScreenType screenType = SJ_ScreenTypeUndefined;
    if (screenType == SJ_ScreenTypeUndefined) {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        int height = MAX(screenBounds.size.width, screenBounds.size.height);
        int width = MIN(screenBounds.size.width, screenBounds.size.height);
        
        if (height == 480 && width == 320) {
            screenType = SJ_ScreenTypeRetina;
        } else if (height == 568 && width == 320){
            screenType = SJ_ScreenType4InchRetina;
        } else if (height == 667 && width == 375){
            screenType = SJ_ScreenType6;
        } else if (height == 736 && width == 414){
            screenType = SJ_ScreenType6Plus;
        }
    }
    return screenType;
}

- (BOOL)sj_isScreenTypeRetina
{
    return [self screenType] == SJ_ScreenTypeRetina;
}

- (BOOL)sj_is4InchRetinaDisplay
{
    return [self screenType] == SJ_ScreenType4InchRetina;
}

- (BOOL)sj_isLongScreen
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    return MAX(screenBounds.size.width, screenBounds.size.height) > 480;
}

- (BOOL)sj_isIPhone6Plus
{
    return [self screenType] == SJ_ScreenType6Plus;
}

- (BOOL)sj_isIPhone6
{
    return [self screenType] == SJ_ScreenType6;
}

static int systemMainVersion = 0;
- (int)sj_systemMainVersion
{
    if (systemMainVersion > 0) {
        return systemMainVersion;
    }
    systemMainVersion = [self systemVersion].intValue;
    return systemMainVersion;
}

- (BOOL)isIphone4
{
    return [[self iphoneVersion] isEqualToString:@"iPhone3,1"];
}

- (BOOL)isIphone4s
{
    return [[self iphoneVersion] isEqualToString:@"iPhone4,1"];
}

- (BOOL)isIphone5
{
    return [[self iphoneVersion] isEqualToString:@"iPhone5,1"];
}

- (NSString *)iphoneVersion
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceString;
}

@end
