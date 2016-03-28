//
//  RQHTTPRequestOperationManager.m
//  NetRequest
//
//  Created by Jerry on 16/3/24.
//  Copyright © 2016年 Jerry. All rights reserved.
//

/*
 *前言：通常来说，AFNetworking已经是高度封装的了，在用到AFNetworking发请求的类里，我们直接可以调用
 *AFNetworking的API。但是，在实际开发中，我们常常将设备、版本、和账户等信息，在接口中作为参数集中提交
 *到服务器。而网络请求异常等信息，也希望集中处理。这时，在每个调用AFNetworking的地方分别处理就比较麻烦,
 *单独封装一个网略请求类，做集中处理，会跟方便管理，也便于复用和扩展。
 *
 *注：该类中的上传图片和视频的接口，是在做某个项目时根据接口需求进行的封装，并不适用于所有视频和图片上传
 *的状况。
 */

#import "RQHTTPSessionManager.h"
#import "NetConfig.h"

@implementation RQHTTPSessionManager

+ (instancetype)sharedManager
{
    static RQHTTPSessionManager *_shareRQHTTPSessionManager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _shareRQHTTPSessionManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:BASEURL]];
        _shareRQHTTPSessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", nil];
    });
    
    return _shareRQHTTPSessionManager;
}



+ (void)checkNetWorkStatus{
    
    /**
     *  AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     *  AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     *  AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G
     *  AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络Wifi
     */
    // 如果要检测网络状态的变化, 必须要用检测管理器的单例startMoitoring
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if(status == AFNetworkReachabilityStatusNotReachable){
            
            NSLog(@"网络连接已断开，请检查您的网络！");
            
            return ;
        }
    }];
    
}


+ (void)getInfoWithSubURL:(NSString *)subUrl
               parameters:(NSDictionary *)parameters
                    block:(void (^)(id result, NSError *error))block
{
    
    [[self class] checkNetWorkStatus];
    
    NSLog(@"url = %@", [NSString stringWithFormat:@"%@%@", BASEURL, subUrl]);
    
    NSLog(@"parameter = %@", parameters);
    
    [[[self class] sharedManager] GET:subUrl
                           parameters:parameters
                             progress:^(NSProgress * _Nonnull downloadProgress) {
                                 
                             }
                              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                  
                                  if (block && responseObject)
                                  {
                                      block(responseObject, nil);
                                  }
                              }
                              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                  if (block)
                                  {
                                      block(nil, error);
                                  }
                              }];
    
}

#pragma mark -- post method
+ (void)postInfoWithSubURL:(NSString *)subURL
                parameters:(NSDictionary *)parameters
                     block:(void (^)(id result, NSError *error))block
{

    [[self class] checkNetWorkStatus];
    
    NSLog(@"urlstring = %@", [NSString stringWithFormat:@"%@%@", BASEURL, subURL]);
    
    NSLog(@"parameter = %@", parameters);
    
    [[[self class] sharedManager] POST:subURL
                            parameters:parameters
                              progress:^(NSProgress * _Nonnull downloadProgress) {
                                  
                              }
                               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                   
                                   if (block && responseObject)
                                   {
                                       block(responseObject, nil);
                                   }
                                   
                               }
                               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                   
                                   if (block)
                                   {
                                       block(nil, error);
                                   }
                               }];
    
}

//+ (void)postWithParameters:(NSDictionary *)Parameters
//                    subUrl:(NSString *)suburl
//                imageDatas:(NSArray *)imageDatas
//                     names:(NSArray *)names
//                     video:(NSData *)video
//                     block:(void (^)(NSDictionary *resultDic, NSError *error))block{
//    [[self class] checkNetWorkStatus];
//    
//    
//    
//    NSLog(@"Parameters = %@",Parameters);
//    [[[self class] sharedManager]  POST:[NSString stringWithFormat:@"%@%@",BASEURL,suburl]
//                             parameters:Parameters
//              constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//                  
//                  for (int i = 0; i<imageDatas.count; i++) {
//                      [formData appendPartWithFileData:[imageDatas objectAtIndex:i]
//                                                  name:[names objectAtIndex:i]
//                                              fileName:[NSString stringWithFormat:@"%@.jpg",[names objectAtIndex:i]]
//                                              mimeType:@"image/jpeg"];
//                      
//                  }
//                  
//                  
//                  if (video) {
//                      [formData appendPartWithFileData:video
//                                                  name:@"video"
//                                              fileName:[NSString stringWithFormat:@"%@.mp4",@"video"]
//                                              mimeType:@"video/mp4"];
//                  }
//                  
//                  
//              } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                  
//                  NSDictionary * resultDic = [[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding] objectFromJSONString];
//                  
//                  NSLog(@"operation.request.URL = %@\nresultDic = %@",operation.request.URL,resultDic);
//                  
//                  if (block && resultDic) {
//                      block(resultDic,nil);
//                  }
//                  
//              } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                  
//                  NSLog(@"error = %@",error.description);
//                  if (block) {
//                      block(nil,error);
//                  }
//                  
//              }];
//    
//    
//}


#pragma mark 取消网络请求

+ (void)cancelHTTPRequest{
    
    NSLog(@"cancelRequest");
    [[[[self class] sharedManager] operationQueue] cancelAllOperations];
    
}
@end
