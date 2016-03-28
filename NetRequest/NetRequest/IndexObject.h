//
//  IndexObject.h
//  NetRequest
//
//  Created by Jerry on 16/3/18.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndexObject : NSObject

/** 列 */
@property(copy, nonatomic)NSString *column;

/** id */
@property(copy, nonatomic)NSString *ID;

/** 是否需要更新 */
@property(assign, nonatomic)BOOL needUpdate;

/** 类型 */
@property(copy, nonatomic)NSString *type;

@end
