//
//  NetDataManager.m
//  NetRequest
//
//  Created by Jerry on 16/3/18.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "NetDataManager.h"

@implementation NetDataManager

+ (BaseObject *)indexDataManager:(id)responseObject
{
    BaseObject *baseObject = [BaseObject mj_objectWithKeyValues:responseObject];
    // 3.打印MJStatusResult模型的简单属性
    MJExtensionLog(@"code=%ld, version=%@, data=%@", baseObject.code, baseObject.version, baseObject.data);
    
    for (IndexObject *index in baseObject.data) {
        MJExtensionLog(@"column=%@, indexId=%@ needUpdate=%d type=%@", index.column, index.ID, index.needUpdate, index.type);
    }
    
    return baseObject;
}

@end
