//
//  z_SystemInfo.h
//  Template
//
//  Created by zhoubl on 13-6-3.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "z_Precompile.h"

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#define IOS8_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define IOS7_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS6_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS5_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define IOS4_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"4.0"] != NSOrderedAscending )
#define IOS3_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"3.0"] != NSOrderedAscending )

#else	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
#define IOS8_OR_LATER	(NO)
#define IOS7_OR_LATER	(NO)
#define IOS6_OR_LATER	(NO)
#define IOS5_OR_LATER	(NO)
#define IOS4_OR_LATER	(NO)
#define IOS3_OR_LATER	(NO)

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

@interface z_SystemInfo : NSObject

+ (NSString *)osVersion;
+ (NSString *)osType;

+ (NSString *)appVersion	NS_AVAILABLE_IOS(4_0);
+ (NSString *)deviceModel	NS_AVAILABLE_IOS(4_0);
//+ (NSString *)deviceUUID	NS_AVAILABLE_IOS(4_0);//已失效

//越狱信息
+ (BOOL)isJailBroken		NS_AVAILABLE_IOS(4_0);
+ (NSString *)jailBreaker	NS_AVAILABLE_IOS(4_0);

//获取空余磁盘信息
+ (NSInteger)freeDiskSpace;

//返回当前设备类型，供服务端使用
+ (NSString *)getCurrentDeviceType;

//返回地区信息
+ (NSDictionary *)getLocalSystem;

//常连接机型
+ (NSString*)getDeviceForSocket;
@end
