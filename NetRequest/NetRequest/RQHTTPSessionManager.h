//
//  RQHTTPRequestOperationManager.h
//  NetRequest
//
//  Created by Jerry on 16/3/24.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "AFNetworking.h"

@interface RQHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

/*
 *brief 检查网络状态
 */
+ (void)checkNetWorkStatus;

/*
 *brief get方法获取数据
 *param parameters 参数字典集合
 *param suburl 接口地址
 *param block  数据回调block
 */
+ (void)getInfoWithSubURL:(NSString *)subUrl
               parameters:(NSDictionary *)parameters
                    block:(void (^)(id result, NSError *error))block;

/*
 *brief post方法获取数据
 *param parameters 参数字典集合
 *param suburl 接口地址
 *param block  数据回调block
 */
+ (void)postInfoWithSubURL:(NSString *)subURL
                parameters:(NSDictionary *)parameters
                     block:(void (^)(id result, NSError *error))block;

///
+ (void)cancelHTTPRequest;
@end
