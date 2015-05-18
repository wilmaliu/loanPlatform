//
//  z_DateTime.m
//  Template
//
//  Created by zhoubl on 13-6-3.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "z_DateTime.h"

@implementation z_DateTime

/**
 *	@brief	格式化时间为字符串
 *
 *	@param 	date 	NSDate系统时间类型
 *
 *	@return	返回默认格式yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)encodeTime:(NSDate *)date

{
    @try {
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        return [formatter stringFromDate:date];
    }
    @catch (NSException *exception) {
        return @"";
    }
    @finally {
    }
}

/**
 *	@brief	字符串格式化为时间格式
 *
 *	@param 	dateString 	默认格式yyyy-MM-dd HH:mm:ss
 *
 *	@return	返回时间格式
 */
+ (NSDate *)dencodeTime:(NSString *)dateString

{
    @try {
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        return [formatter dateFromString:dateString];
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
    }
    
}
+ (NSDate *)dencodeTime2:(NSString *)dateString

{
    @try {
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        return [formatter dateFromString:dateString];
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
    }
    
}

/**
 *	@brief	离现在时间相差时间
 *
 *	@param 	date 	时间格式
 *
 *	@return	返回字符串
 */
+ (NSString *)timeSinceNow:(NSDate *)date

{
    @try
    {
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        NSTimeInterval interval = 0 - [date timeIntervalSinceNow];
        
        if (interval < (24 * 60 * 60))
        {
            return [[self class] encodeTime:date format:@"HH:mm:ss"];
        }
        else
        {
            // 具体时间
            [formatter setDateFormat:@"yyyy-MM-dd"];
            return [formatter stringFromDate:date];
        }
    }
    @catch (NSException *exception)
    {
        return @"";
    }
    @finally
    {
    }
}
+ (NSString *)timeSinceNow2:(NSDate *)date

{
    @try {
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        //NSTimeInterval interval = 0 - [date timeIntervalSinceNow];
        
        // 具体时间
        [formatter setDateFormat:@"yyyy/MM/dd"];
        return [formatter stringFromDate:date];
        
    }
    @catch (NSException *exception) {
        return @"";
    }
    @finally {
    }
}

/**
 *	@brief	格式化时间为字符串
 *
 *	@param 	date 	时间
 *	@param 	format 	格式化字符串
 *
 *	@return	返回时间字符串
 */
+ (NSString *)encodeTime:(NSDate *)date format:(NSString *)format

{
    @try {
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat:format];
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
        return [formatter stringFromDate:date];
    }
    @catch (NSException *exception) {
        return @"";
    }
    @finally {
    }
    
}

/**
 *	@brief  格式化成时间格式
 *
 *	@param 	dateString 	时间字符串
 *	@param 	format 	格式化字符串
 *
 *	@return	返回时间格式
 */
+ (NSDate *)dencodeTime:(NSString *)dateString format:(NSString *)format

{
    @try {
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat:format];
        return [formatter dateFromString:dateString];
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
    }
    
}

+ (NSDictionary *)timeSinceNowWithAgoParam:(NSDate *)date
{
    @try {
        NSTimeInterval interval = 0 - [date timeIntervalSinceNow];
        
        if (interval < 60) {
            // 几秒前
            return @{@"time":@"1",@"param":[NSString stringWithFormat:@"%@",NSLocalizedString(@"Minute Ago Short_", nil)]};
        } else if (interval < (60 * 60)) {
            // 几分钟前
            return @{@"time":[NSString stringWithFormat:@"%u", (int)(interval / 60)],@"param":(int)(interval / 60) <= 1 ? NSLocalizedString(@"Minute Ago Short_",nil) : NSLocalizedString(@"Minute Ago Short", nil)};
        } else if (interval < (24 * 60 * 60)) {
            // 几小时前
            return @{@"time":[NSString stringWithFormat:@"%u", (int)(interval / 60 / 60)],@"param": (int)(interval / 60 / 60) <= 1 ? NSLocalizedString(@"Hours Ago Short_", nil) : NSLocalizedString(@"Hours Ago Short", nil)};
        }
        else
        {
            if ((int)(interval / 60 / 60 / 24) > 30) {
                return @{@"time":@" ",@"param":@" "};
            }
            return @{@"time":[NSString stringWithFormat:@"%u", (int)(interval / 60 / 60 / 24)],@"param": (int)(interval / 60 / 60 / 24) <= 1 ?NSLocalizedString(@"Day Ago Short_", nil) : NSLocalizedString(@"Day Ago Short", nil)};
        }
    }
    @catch (NSException *exception) {
        return @{@"time":@" ",@"param":@" "};
    }
    @finally {
    }
}

+ (NSDictionary *)timeSinceNowWithAgoParamBefore30:(NSDate *)date
{
    @try {
        NSTimeInterval interval = 0 - [date timeIntervalSinceNow];
        
        if (interval < 60) {
            // 几秒前
            return @{@"time":@"1",@"param":[NSString stringWithFormat:@"%@",NSLocalizedString(@"Minute Ago Short_", nil)]};
        } else if (interval < (60 * 60)) {
            // 几分钟前
            return @{@"time":[NSString stringWithFormat:@"%u", (int)(interval / 60)],@"param":(int)(interval / 60) <= 1 ? NSLocalizedString(@"Minute Ago Short_",nil) : NSLocalizedString(@"Minute Ago Short", nil)};
        } else if (interval < (24 * 60 * 60)) {
            // 几小时前
            return @{@"time":[NSString stringWithFormat:@"%u", (int)(interval / 60 / 60)],@"param": (int)(interval / 60 / 60) <= 1 ? NSLocalizedString(@"Hours Ago Short_", nil) : NSLocalizedString(@"Hours Ago Short", nil)};
        }
        else
        {
            if ((int)(interval / 60 / 60 / 24) > 30) {
                return @{@"time":@"-1",@"param":@"-1"};
            }
            return @{@"time":[NSString stringWithFormat:@"%u", (int)(interval / 60 / 60 / 24)],@"param":(int)(interval / 60 / 60 / 24) <= 1 ?NSLocalizedString(@"Day Ago Short_", nil) : NSLocalizedString(@"Day Ago Short", nil)};
        }
    }
    @catch (NSException *exception) {
        return @{@"time":@"-1",@"param":@"S"};
    }
    @finally {
    }
}

+ (NSString *)timeSinceNowWithAgo:(NSDate *)date

{
    @try {
//        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        NSTimeInterval interval = 0 - [date timeIntervalSinceNow];
        
        if (interval < 60) {
            // 几秒前
            return [NSString stringWithFormat:@"1%@",NSLocalizedString(@"just", @"just")];
        } else if (interval < (60 * 60)) {
            // 几分钟前
            return [NSString stringWithFormat:@"%u%@", (int)(interval / 60),NSLocalizedString(@"minutes", @"minutes")];
        } else if (interval < (24 * 60 * 60)) {
            // 几小时前
            return [NSString stringWithFormat:@"%u%@", (int)(interval / 60 / 60),NSLocalizedString(@"hours_ago", @"hours_ago")];
        }
        else
        {
            return [NSString stringWithFormat:@"%u%@", (int)(interval / 60 / 60 / 24),NSLocalizedString(@"days_ago", nil)];
        }
//        else if (interval < (2 * 24 * 60 * 60)) {
//            // 昨天
//            [formatter setDateFormat:@"昨天 HH:mm"];
//            return [formatter stringFromDate:date];
//        } else if (interval < (3 * 24 * 60 * 60)) {
//            // 前天
//            [formatter setDateFormat:@"前天 HH:mm"];
//            return [formatter stringFromDate:date];
//        } else {
//            // 具体时间
//            [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
//            return [formatter stringFromDate:date];
//        }
    }
    @catch (NSException *exception) {
        return @"";
    }
    @finally {
    }
}

+ (NSInteger )getCurrentWeek
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger unitFlags = NSWeekCalendarUnit|NSWeekdayCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags
                                          fromDate:[NSDate dateWithTimeIntervalSinceNow:3600*24*7]];
    //周日为1
    NSInteger week = [comps weekday] == 1 ? 7 : [comps weekday] - 1;
    return week;
}

+ (double)getCurrentInterfaceDays:(NSString *)key
{
    double days = 1000;
    id obj = GetPlistObjectForKey(key);
    if (obj)
    {
        NSTimeInterval time = [[NSDate date] timeIntervalSinceDate:obj];
        days = ((double)time) / 3600.0;
    }
    return days;
}

+ (NSString *)get1970TimerInterval
{
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%lld", (long long)[datenow timeIntervalSince1970] * 1000];
    return timeSp;
}
@end
