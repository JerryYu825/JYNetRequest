//
//  BaseObject.h
//  NetRequest
//
//  Created by Jerry on 16/3/18.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseObject : NSObject

/** 错误码 */
@property(assign, nonatomic)NSInteger code;

/** 返回信息 */
@property(copy, nonatomic)NSString *msg;

/** 版本号 */
@property(copy, nonatomic)NSString *version;

/** 存放数据Data */
@property (strong, nonatomic)NSArray *data;

@end
