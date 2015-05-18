//
//  z_DateTime.h
//  Template
//
//  Created by zhoubl on 13-6-3.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "z_Precompile.h"

@interface z_DateTime : NSObject

/*时间处理*/
+ (NSString *)encodeTime:(NSDate *)date;                                    //转换NSDate格式为字符串"yyyy-MM-dd HH:mm:ss"
+ (NSDate *)dencodeTime:(NSString *)dateString;                             //转换字符串为"yyyy-MM-dd HH:mm:ss"格式到NSDate
+ (NSDate *)dencodeTime2:(NSString *)dateString;            
+ (NSString *)encodeTime:(NSDate *)date format:(NSString *)format;          //装换NSDate格式到NString
+ (NSDate *)dencodeTime:(NSString *)dateString format:(NSString *)format;   //转换NString到NSdate
+ (NSString *)timeSinceNow:(NSDate *)date;                                  //从现在到某天的时间
+ (NSString *)timeSinceNow2:(NSDate *)date;
+ (NSString *)timeSinceNowWithAgo:(NSDate *)date;
+ (NSDictionary *)timeSinceNowWithAgoParam:(NSDate *)date;
+ (NSDictionary *)timeSinceNowWithAgoParamBefore30:(NSDate *)date;


//获取周几
+ (NSInteger )getCurrentWeek;

+ (double)getCurrentInterfaceDays:(NSString *)key;

+ (NSString *)get1970TimerInterval;

@end
