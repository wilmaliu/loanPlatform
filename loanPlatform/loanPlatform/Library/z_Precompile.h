//
//  z_Precompile.h
//  Template
//
//  Created by zhoubl on 13-6-3.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//
#ifndef Template_z_Precompile_h
#define Template_z_Precompile_h

#import "z_Foundation.h"
#import <FMDB/FMDB.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <AFNetworking/AFNetworking.h>
#import <RDVTabBarController/RDVTabBarController.h>
#import <iCarousel/iCarousel.h>

//检查对象是否存在
#define NodeExist(node) (node != nil && ![node isEqual:[NSNull null]])

#define RGBA(r,g,b,a)  [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

//废弃标识
#define ZDEPRECATED(_version) __attribute__ ((deprecated))

//快速添加
#define IMG(aName) [UIImage imageNamed:aName]
#define IMG_VIEW(aName) [[UIImageView alloc] initWithImage:IMG(aName)]

//状态保存
//#define GetGlobalObjectForKey(aKey) [[CoordinatingController sharedInstance].paramDictonary objectForKey:aKey]
//#define GetGlobalObjectForKeyPath(aKeyPath) [[CoordinatingController sharedInstance].paramDictonary valueForKeyPath:aKeyPath]
//#define SetGlobalObjectForKey(aObject,aKey) [[CoordinatingController sharedInstance].paramDictonary setObject:aObject forKey:aKey]
//#define RemoveObjectForKey(aObject) [[CoordinatingController sharedInstance].paramDictonary removeObjectForKey:aObject]

//Plist状态
#define GetPlistObjectForKey(aKey) [[NSUserDefaults standardUserDefaults] valueForKey:aKey]
#define SetPlistObjectForKey(aObject,aKey) [[NSUserDefaults standardUserDefaults] setValue:aObject forKey:aKey];[[NSUserDefaults standardUserDefaults] synchronize]
#define RemovePlistObjectForKey(aKey) [[NSUserDefaults standardUserDefaults] removeObjectForKey:aKey]


#endif
