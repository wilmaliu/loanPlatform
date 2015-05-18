//
//  ProgressHUD.m
//  IPhoneChinaAccCEdu
//
//  Created by zhoubl on 14-1-8.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "ProgressHUD.h"

@implementation ProgressHUD


#pragma mark -
#pragma mark Show Methods Sample

+ (void)show
{
	[SVProgressHUD show];
}

+ (void)showWithStatus:(NSString *)status
{
	[SVProgressHUD showWithStatus:status];
}

#pragma mark -
#pragma mark Auto Dismiss Methods Sample

+ (void)dismissSuccess:(NSString *)status
{
	[SVProgressHUD showSuccessWithStatus:status];
}

+ (void)dismissError:(NSString *)status
{
	[SVProgressHUD showErrorWithStatus:status];
}

#pragma mark -
#pragma mark Dismiss Methods Sample

+ (void)dismiss
{
	[SVProgressHUD dismiss];
}

@end
