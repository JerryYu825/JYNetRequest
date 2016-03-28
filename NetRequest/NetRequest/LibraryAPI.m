//
//  LibraryAPI.m
//  NetRequest
//
//  Created by Jerry on 16/2/15.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "LibraryAPI.h"
#import "NetRequest.h"

@interface LibraryAPI ()
{
    NSMutableDictionary *dicResqest;
}
@end

@implementation LibraryAPI

- (id)init
{
    self = [super init];
    if (self) {
        dicResqest = [[NSMutableDictionary alloc] initWithCapacity:5];
    }
    return self;
}

- (void)dealloc
{
    dicResqest = nil;
}

+ (LibraryAPI *)sharedInstance
{
    // 1
    static LibraryAPI *_sharedInstance = nil;
    
    // 2
    static dispatch_once_t oncePredicate;
    
    // 3
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc] init];
    });
    return _sharedInstance;
}

- (void)getIndexColumns:(LibraryAPIBlock)libraryAPIBlock
{
    if (libraryAPIBlock) {
        libraryAPIBlock(NetRequest *netRequest, id data, NSString *error);
    }
}

//- (NetRequest *)loadRequestWithTarger:(id)targer aKey:(id)aKey
//{
//    NetRequest *reqest = [dicResqest objectForKey:aKey];
//    if(reqest != nil)
//    {
//        [reqest stopLoadData];
//    }
//    reqest = [[NetRequest alloc] init];
//    [reqest setDelegate:targer];
//    reqest.strUserInfo = aKey;
//    [dicResqest setObject:reqest forKey:aKey];
//    return reqest;
//}
//
//#pragma mark - iPad获取首界面赛事分类
//- (void)getIndexColumns:(id)targe {
//    
//    id key = [NSString stringWithFormat:@"%d", ReqIndexColumns];
//    NetRequest *reqest = [self loadRequestWithTarger:targe aKey:key];
//    [reqest getIndexColumns:ReqIndexColumns];
//}

@end
