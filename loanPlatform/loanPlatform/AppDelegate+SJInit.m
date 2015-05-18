//
//  AppDelegate+SJInit.m
//  loanPlatform
//
//  Created by zhoubl on 15/5/18.
//  Copyright (c) 2015年 Pencil Vase Corp. All rights reserved.
//

#import "AppDelegate+SJInit.h"

@implementation AppDelegate (SJInit)

- (void)initStatusBar:(UIApplication *)application
{
    //Right, that is the point
    if (IOS8_OR_LATER)
    {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge |UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert) categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    else
    {
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound];
    }
    [application setApplicationIconBadgeNumber:0];
}

@end
