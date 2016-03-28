//
//  LibraryAPI.h
//  NetRequest
//
//  Created by Jerry on 16/2/15.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NetRequest.h"


@interface LibraryAPI : NSObject
//
///**
// *  数据返回后的Block回调方法
// *
// *  @param netRequest  self本身
// *  @param date        返回数据
// *  @param error       错误信息
// */
typedef void (^LibraryAPIBlock)(NetRequest *netRequest, id data, NSString *error);
//@property (nonatomic, copy) LibraryAPIBlock libraryAPIBlock;

//+ (LibraryAPI *)sharedInstance;

#pragma mark - iPad获取首界面赛事分类
- (void)getIndexColumns:(LibraryAPIBlock)libraryAPIBlock;


@end
