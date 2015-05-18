//
//  z_Log.h
//  日志输出
//
//
//  Created by zhoubl on 13-6-3.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "z_Precompile.h"

/*
 Clog 日志控制台输出 
 TLog 文件输出
 */

#if DEBUG
    #define CLog(frmt, ...) NSLog(@"%s " frmt, __FUNCTION__,##__VA_ARGS__)
#else
    #define CLog(format, ...)
    #define NSLog(format, ...)
#endif

@interface z_Log : NSObject

+ (NSString *)replaceUnicode:(NSString *)unicodeStr;

@end
