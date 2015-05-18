//
//  z_UI.h
//  Template
//
//  Created by zhoubl on 13-6-5.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "z_Precompile.h"

@interface z_UI : NSObject

//返回随即数
+ (NSInteger)getRandomNumber:(NSInteger)min maxNumber:(NSInteger)max;

//返回字节大小
+ (NSString*)getSize:(NSNumber*)number;

//返回UTF-8的编码
+ (NSString *)encode:(NSString *)s;

//测试中文
+ (BOOL )testHasChineseWord:(NSString *)testString;

//取图片的主色
+ (UIColor *)mostColor:(UIImage *)img;

@end
