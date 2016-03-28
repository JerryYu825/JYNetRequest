//
//  RQParameterManager.h
//  TencentNBA
//
//  Created by Jerry on 16/3/23.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RQParameterManager : NSObject

/**
 *  创建公共参数
 *  注：公共参数为每次访问接口必须带的参数
 */
+ (NSMutableDictionary *)createPublicParameters;

/**
 *  创建公共参数
 *  注：公共参数为每次访问接口必须带的参数
 */
+ (NSMutableDictionary *)setIndexParameterWithColumn:(NSString *)column;

+ (NSMutableDictionary *)setItemParameterWithColumn:(NSString *)column articleIds:(NSString *)articleIds;

@end
