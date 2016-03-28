//
//  NetRequestManage.h
//  NetRequest
//
//  Created by Jerry on 16/3/17.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetRequest.h"

@interface NetRequestManager : NSObject

typedef void (^DownloadProgressBlock)(NSProgress *downloadProgress);
@property(copy, nonatomic)DownloadProgressBlock downloadProgressBlock;

+ (instancetype)sharedInstance;

+ (instancetype)manager;

- (AFHTTPSessionManager *)creatAFHTTPSessionManager;

- (void)getIndexDataWithColoumn:(NSString *)column;

- (NSURLSessionDataTask *)GET:(NSString *)URLString;

@end
