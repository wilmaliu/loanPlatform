//
//  z_AppStore.h
//  Template
//
//  Created by zhoubl on 13-6-5.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "z_Precompile.h"

@interface z_AppStore : NSObject

+ (void)goToAppStoreHomePage:(NSInteger)appid;      //跳转到电子市场页面
+ (void)goToAppStoreCommentPage:(NSInteger)appid;   //跳转到电子市场评论页面
+ (void)goToSmsPage:(NSString*)phoneNumber;         //跳到短信页面
+ (void)openBrowse:(NSString*)url;                  //打开浏览器
+ (void)openEmail:(NSString*)email;                 //打开浏览器
+(void)gotoTel:(NSString *)phoneNumber;            //跳转至打电话页面
@end
