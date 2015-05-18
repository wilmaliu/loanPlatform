//
//  z_MD5.m
//  Template
//
//  Created by zhoubl on 13-6-5.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "z_MD5.h"
#import "NSString+MD5.h"

@implementation z_MD5

+ (NSString *)keyValueWithMD5:(NSString *)pkey,...
{
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:7];
    id arg;
    va_list argList;
    va_start(argList,pkey);
    while ((arg = va_arg(argList,id)))
    {
        [arr addObject:arg];
    }
    va_end(argList);
    
    NSString *keyStr = [NSString stringWithFormat:@"%@%@",pkey,[arr componentsJoinedByString:@""]];

    return [keyStr md5UsingEncoding:NSUTF8StringEncoding];
}

@end
