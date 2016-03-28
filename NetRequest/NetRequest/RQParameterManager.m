//
//  ParameterManager.m
//  TencentNBA
//
//  Created by Jerry on 16/3/23.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "RQParameterManager.h"
#import "AFNetworking.h"
#import "AppDelegate.h"

#import "RQParameterConfig.h"

@implementation RQParameterManager

/**
 *  创建公共参数
 *  注：公共参数为每次访问接口必须带的参数
 */
+ (NSMutableDictionary *)createPublicParameters
{
    __block  NSString *network = @"WiFi";
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status)
        {
            case AFNetworkReachabilityStatusNotReachable:
            {
                network = @"Not Reachable";
                
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                network = @"WiFi";
                
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                network = @"WWAN";
                
                break;
            }
            default:
                network = @"Unknown";
                
                break;
        }
        
    }];
    
    //客户端来源
    NSString *from = @"app";//isPad?@"pad":@"app";
    
    //获取屏幕大小
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    //获取APP Guid
//    AppDelegate *appDelegate = (AppDelegate*)[UIApplication
//                                              sharedApplication].delegate;
    NSString *guid = @"111";//appDelegate.strUDID;
    
    //获取APP版本
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    NSMutableDictionary *publicParameters = [NSMutableDictionary dictionary];
    [publicParameters setObject:from forKey:PARAMETER_FROM];
    [publicParameters setObject:from forKey:PARAMETER_OS];
    [publicParameters setObject:guid forKey:PARAMETER_GUID];
    [publicParameters setObject:guid forKey:PARAMETER_DEVICEID];
    [publicParameters setObject:appVersion forKey:PARAMETER_APPVID];
    [publicParameters setObject:[NSNumber numberWithDouble:screenRect.size.height] forKey:PARAMETER_HEIGHT];
    [publicParameters setObject:[NSNumber numberWithDouble:screenRect.size.width] forKey:PARAMETER_WIDTH];
    [publicParameters setObject:network forKey:PARAMETER_NETWORK];
    
    return publicParameters;
}


+ (NSMutableDictionary *)setIndexParameterWithColumn:(NSString *)column
{
    NSMutableDictionary *parameters = [self createPublicParameters];
    [parameters setObject:column forKey:PARAMETER_COLUMN];
    return parameters;
}

+ (NSMutableDictionary *)setItemParameterWithColumn:(NSString *)column articleIds:(NSString *)articleIds
{
    NSMutableDictionary *parameters = [self createPublicParameters];
    [parameters setObject:column forKey:PARAMETER_COLUMN];
    [parameters setObject:articleIds forKey:PARAMETER_ARTICLEIDS];

    return parameters;
}

@end
