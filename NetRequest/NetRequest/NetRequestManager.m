//
//  NetRequestManage.m
//  NetRequest
//
//  Created by Jerry on 16/3/17.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "NetRequestManager.h"

@interface NetRequestManager ()

@property(strong, nonatomic)NSMutableDictionary *netRequestDic;

@end

@implementation NetRequestManager



+ (instancetype)manager
{
    return [[[self class] alloc] init];
}

- (AFHTTPSessionManager *)creatAFHTTPSessionManager
{
    NSURL *baseURL = [NSURL URLWithString:kBASEURL];
    NSSet *acceptableContentTypes = [NSSet setWithObject:@"text/plain"];

    //1.管理器  需要注意的是,默认提交请求的数据是二进制的,返回格式是JSON
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]
                                     initWithBaseURL:baseURL];
    manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    //2.设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //3.设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    return manager;
}

- (AFHTTPSessionManager *)creatAFHTTPSessionManagerWithURL:(NSString *)URL parameters:(id)parameters
{
    AFHTTPSessionManager *manager = [self creatAFHTTPSessionManager];
    //4.请求
    [manager GET:URL
      parameters:parameters
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
        }
         success:^(NSURLSessionDataTask * _Nonnull task,
                   id  _Nullable responseObject) {
             [NetDataManager indexDataManager:responseObject];
         }
         failure:^(NSURLSessionDataTask * _Nullable task,
                   NSError * _Nonnull error) {
             
         }];
    
    return manager;
}

- (void)getIndexDataWithColoumn:(NSString *)column
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:column forKey:kPARAMETERCOLUMN];
    [self creatAFHTTPSessionManagerWithURL:kMETHODNEWSINDEX parameters:parameters];
}


@end
