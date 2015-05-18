//
//  z_AppStore.m
//  Template
//
//  Created by zhoubl on 13-6-5.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "z_AppStore.h"

@implementation z_AppStore


/**
 *	@brief	跳转到APPSTORE软件下载页面
 *
 *	@param 	appid 	APPID
 */
+ (void)goToAppStoreHomePage:(NSInteger)appid

{
    NSString *str = [NSString stringWithFormat:@"itms-apps://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%ld", (long)appid];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

/**
 *	@brief	跳转到APPSTORE软件评论页面
 *
 *	@param 	appid 	APPID
 */
+ (void)goToAppStoreCommentPage:(NSInteger)appid

{
    NSString *str = [NSString stringWithFormat: @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%ld", (long)appid ];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

/**
 *	@brief	发短信
 *
 *	@param 	phoneNumber 	手机号码
 */
+ (void)goToSmsPage:(NSString*)phoneNumber

{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",phoneNumber]]];
}

/**
 *	@brief	打开网页
 *
 *	@param 	url 	网页地址
 */
+ (void)openBrowse:(NSString*)url
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

/**
 *	@brief	发送邮件
 *
 *	@param 	email 	email地址
 */
+ (void)openEmail:(NSString*)email;

{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:%@",email]]];
}
/**
 *	@brief	打电话页面
 *
 *	@param 	phoneNumber 	电话号码
 */

+(void)gotoTel:(NSString *)phoneNumber{
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://18911938589"]];
    
}

@end
