//
//  ProgressHUD.h
//
//
//  Created by zhoubl on 14-1-8.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgressHUD : NSObject

//显示-普通等待
+ (void)show;

//显示-带文字等待
+ (void)showWithStatus:(NSString *)status;

//成功图标+文字，自动隐藏
+ (void)dismissSuccess:(NSString *)status;

//失败图标+文字，自动隐藏
+ (void)dismissError:(NSString *)status;

//其它图标待后续添加

//隐藏
+ (void)dismiss;

@end
