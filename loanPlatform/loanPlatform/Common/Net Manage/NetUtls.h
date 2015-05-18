//
//  NetUtls.h
//  nao-ios
//
//  Created by zhoubl on 13-6-9.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface NetUtls : NSObject
@property (nonatomic,strong) AFHTTPRequestOperationManager *manager;

AS_SINGLETON ( NetUtls );

//get请求
+ (AFHTTPRequestOperation *)getWithUrl:(NSString *)baseUrl
   paramDictionary:(NSDictionary *)dict
      successBlock:(void (^)(AFHTTPRequestOperation *operation, id response))success
      failureBlock:(void (^)(AFHTTPRequestOperation *operation, id response, NSError *error))failure;

//post请求
+ (AFHTTPRequestOperation *)postWithUrl:(NSString *)baseUrl
   paramDictionary:(NSDictionary *)dict
      successBlock:(void (^)(AFHTTPRequestOperation *operation, id response))success
      failureBlock:(void (^)(AFHTTPRequestOperation *operation, id response, NSError *error))failure;

//delete请求
+ (void)deleteWithUrl:(NSString *)baseUrl
    paramDictionary:(NSDictionary *)dict
       successBlock:(void (^)(id response))success
       failureBlock:(void (^)(id response))failure;

//put请求
+ (void)putWithUrl:(NSString *)baseUrl
    paramDictionary:(NSDictionary *)dict
       successBlock:(void (^)(id response))success
       failureBlock:(void (^)(id response, NSError *error))failure;

@end
