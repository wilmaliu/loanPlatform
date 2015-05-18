//
//  z_SystemInfo.m
//  Template
//
//  Created by zhoubl on 13-6-3.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "z_SystemInfo.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/sockio.h>
#include <net/if.h>
#include <errno.h>
#include <net/if_dl.h>
#import  <dlfcn.h>
#include <ifaddrs.h>
#include <sys/sysctl.h>
#import  <CommonCrypto/CommonCryptor.h>
#import  <SystemConfiguration/SystemConfiguration.h>
#import "sys/utsname.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>


@implementation z_SystemInfo

+ (NSString *)osVersion
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return [NSString stringWithFormat:@"%@ %@", [UIDevice currentDevice].systemName, [UIDevice currentDevice].systemVersion];
#else	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return @"";
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
}

+ (NSString *)appVersion NS_AVAILABLE_IOS(4_0)
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
#else	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return @"";
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
}

+ (NSString *)osType
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    struct utsname systemInfo;
    uname(&systemInfo);
	return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
#else	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return @"";
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
}

+ (NSString *)deviceModel NS_AVAILABLE_IOS(4_0)
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return [UIDevice currentDevice].model;
#else	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return @"";
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
}

//+ (NSString *)deviceUUID NS_AVAILABLE_IOS(4_0)
//{
//#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
//	return [UIDevice currentDevice].uniqueIdentifier;
//#else	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
//	return @"";
//#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
//}

+ (NSInteger)freeDiskSpace
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSInteger diskFreeCapacity = [[fattributes objectForKey:NSFileSystemFreeSize] intValue];
    return diskFreeCapacity;
#else	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return 0;
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
}

static const char * __jb_app = NULL;

+ (BOOL)isJailBroken NS_AVAILABLE_IOS(4_0)
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	static const char * __jb_apps[] =
	{
		"/Application/Cydia.app",
		"/Application/limera1n.app",
		"/Application/greenpois0n.app",
		"/Application/blackra1n.app",
		"/Application/blacksn0w.app",
		"/Application/redsn0w.app",
		NULL
	};
    
	__jb_app = NULL;
    
	// method 1
    for ( int i = 0; __jb_apps[i]; ++i )
    {
        if ( [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:__jb_apps[i]]] )
        {
			__jb_app = __jb_apps[i];
			return YES;
        }
    }
	
    // method 2
	if ( [[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"] )
	{
		return YES;
	}
	
	// method 3
	if ( 0 == system("ls") )
	{
		return YES;
	}
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	
    return NO;
}

+ (NSString *)jailBreaker NS_AVAILABLE_IOS(4_0)
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	if ( __jb_app )
	{
		return [NSString stringWithUTF8String:__jb_app];
	}
	else
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        
        return @"";
}

+ (NSString*)getCurrentDeviceType
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([platform hasPrefix:@"iPhone"])
    {
        return @"O";
    }
    if ([platform hasPrefix:@"iPod"])
    {
        return @"T";
    }
    if ([platform hasPrefix:@"iPad"])
    {
        return @"D";
    }
    return @"U";
}

+ (NSString*)getDeviceForSocket
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return [platform substringWithRange:NSMakeRange(0, platform.length - 2)];
}

+ (NSDictionary *)getLocalSystem
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
    
    // 当前所在地信息
    NSString *identifier = [[NSLocale currentLocale] localeIdentifier];
    NSString *displayName = [[NSLocale currentLocale] displayNameForKey:NSLocaleIdentifier value:identifier];
    [dic setObject:displayName ? : @"没取到" forKey:@"displayName"];
    
    // 系统语言
    NSArray *arLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    NSString *strLang = [arLanguages objectAtIndex:0];
    [dic setObject:strLang forKey:@"arLanguages"];
    return dic;
}

@end
