//
//  z_Sandbox.h
//  Template
//
//  Created by zhoubl on 13-6-3.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "z_Precompile.h"
#import "z_Sandbox.h"

@interface z_Sandbox : NSObject

+ (NSString *)appPath;		// 程序目录，不能存任何东西
+ (NSString *)docPath;		// 文档目录，需要ITUNES同步备份的数据存这里
+ (NSString *)libPrefPath;	// 配置目录，配置文件存这里
+ (NSString *)libCachePath;	// 缓存目录，系统永远不会删除这里的文件，ITUNES会删除
+ (NSString *)libDBPath;    // 图片及数据库目录
+ (NSString *)libResource;  // 资源目录
+ (NSString *)tmpPath;		// 缓存目录，APP退出后，系统可能会删除这里的内容
+ (NSString *)documentPath:(NSString*)fileName;          //返回完整的documentPath下文件路径
+ (NSString *)cachesFilePath:(NSString*)fileName;        //返回完整的cachePath下文件路径

+ (void)makeDirs:(NSString *)dir;                       //创建文件

+ (BOOL)fileExists:(NSString *)fullPathName;            //文件路径是否存在
+ (BOOL)remove:(NSString *)fullPathName;                //根据文件路径删除文件
+ (BOOL)fileExistInDocumentPath:(NSString*)fileName;    //documentPath路径是否存在
+ (BOOL)deleteDocumentFile:(NSString*)fileName;         //删除documentPath路径下文件
+ (BOOL)fileExistInCachesPath:(NSString*)fileName;      //cachePath路径是否存在
+ (BOOL)deleteCachesFile:(NSString*)fileName;           //删除cachePath下文件路径
+ (BOOL)touch:(NSString *)path;

@end
