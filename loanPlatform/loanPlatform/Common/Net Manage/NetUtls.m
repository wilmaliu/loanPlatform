//
//  NetUtls.m
//  nao-ios
//
//  Created by zhoubl on 13-6-9.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#import "NetUtls.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonCryptor.h>

#define SJNETTIMEOUT 20

@interface NetUtls ()
@end

@implementation NetUtls

DEF_SINGLETON ( NetUtls );

- (id)init
{
    self = [super init];
    if (self)
    {
        self.manager = [AFHTTPRequestOperationManager manager];
        self.manager.securityPolicy.allowInvalidCertificates = YES;
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
        self.manager.requestSerializer.timeoutInterval = SJNETTIMEOUT;
    }
    return self;
}

-(void)requestWithUrl:(NSString *)baseUrl
               method:(NSString *)methodName
      paramDictionary:(NSDictionary *)dict
        withTokenFlag:(BOOL)flag
         successBlock:(void (^) (NSDictionary *dict))success
        failtureBlock:(void (^) (NSDictionary *dict))failture
{
}

//get请求
+ (AFHTTPRequestOperation *)getWithUrl:(NSString *)baseUrl
   paramDictionary:(NSDictionary *)dict
      successBlock:(void (^)(AFHTTPRequestOperation *operation, id response))success
      failureBlock:(void (^)(AFHTTPRequestOperation *operation, id response, NSError *error))failure
{
        AFHTTPRequestOperationManager *manager = [NetUtls sharedInstance].manager;
        AFHTTPRequestOperation *operation = [manager GET:baseUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSHTTPURLResponse  *response = operation.response;
            NSInteger status = response.statusCode;
            NSError *error = nil;
            switch (status / 100) {
                case 2:
                {
                    success(operation ,responseObject);
                    break;
                }
                case 3:
                {
                    break;
                }
                case 4://Forbidden
                {
                    error = [NSError errorWithDomain:@"" code:status userInfo:nil];
                    failure(operation ,responseObject,error);
                    break;
                }
                default:
                    error = [NSError errorWithDomain:@"" code:status userInfo:nil];
                    failure(operation, responseObject,error);
                    break;
            }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation,operation,error);
    }];
    return operation;
}

//post请求
+ (AFHTTPRequestOperation *)postWithUrl:(NSString *)baseUrl
    paramDictionary:(NSDictionary *)dict
       successBlock:(void (^)(AFHTTPRequestOperation *operation, id response))success
       failureBlock:(void (^)(AFHTTPRequestOperation *operation, id response, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    if ([[dict allKeys] count] > 1) {
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
    AFHTTPRequestOperation *operation = [manager POST:baseUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error = nil;
        NSHTTPURLResponse  *response = operation.response;
        NSInteger status = response.statusCode;
        switch (status / 100) {
            case 2:
            {
                success(operation, responseObject);
                break;
            }
            case 3:
            {
                break;
            }
            case 4://Forbidden
            {
                error = [NSError errorWithDomain:@"" code:status userInfo:nil];
                failure(operation, responseObject, error);
                break;
            }
            default:
                error = [NSError errorWithDomain:@"" code:status userInfo:nil];
                failure(operation, responseObject, error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, operation,error);
    }];
    
    return operation;
}

//delete请求
+ (void)deleteWithUrl:(NSString *)baseUrl
      paramDictionary:(NSDictionary *)dict
         successBlock:(void (^)(id response))success
         failureBlock:(void (^)(id response))failure
{
    AFHTTPRequestOperationManager *manager = [NetUtls sharedInstance].manager;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager DELETE:baseUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSHTTPURLResponse  *response = operation.response;
        NSInteger status = response.statusCode;
        switch (status / 100) {
            case 2:
            {
                success(responseObject);
                break;
            }
            case 3:
            {
                break;
            }
            case 4://Forbidden
            {
                failure(responseObject);
                break;
            }
            default:
                failure(responseObject);
        }
        ;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(nil);
    }];
}

//put请求
+ (void)putWithUrl:(NSString *)baseUrl
   paramDictionary:(NSDictionary *)dict
      successBlock:(void (^)(id response))success
      failureBlock:(void (^)(id response, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = SJNETTIMEOUT;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager PUT:baseUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSHTTPURLResponse  *response = operation.response;
        NSInteger status = response.statusCode;
        NSError *error = nil;
        switch (status / 100) {
            case 2:
            {
                success(responseObject);
                break;
            }
            case 3:
            {
                break;
            }
            case 4://Forbidden
            {
                error = [NSError errorWithDomain:@"" code:status userInfo:nil];
                failure(responseObject,error);
                break;
            }
            default:
                error = [NSError errorWithDomain:@"" code:status userInfo:nil];
                failure(responseObject,error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation,error);
    }];
}

@end
