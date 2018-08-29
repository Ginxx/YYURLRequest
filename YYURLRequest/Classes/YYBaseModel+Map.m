//
//  YYBaseModel+Map.m
//  YYURLRequest
//
//  Created by Pircate on 2018/4/19.
//

#import "YYBaseModel+Map.h"
#import <YYModel/YYModel.h>

@implementation YYBaseModel (Map)

+ (instancetype)mapObject:(id)response
{
    id result = [response yy_modelToJSONObject];
    if (!result) return nil;
    if (![result isKindOfClass:[NSDictionary class]]) return nil;
    return [self yy_modelWithDictionary:result];
}

+ (NSArray<YYBaseModel *> *)mapArray:(id)response
{
    id result = [response yy_modelToJSONObject];
    if (!result) return nil;
    if (![result isKindOfClass:[NSArray class]]) return @[];
    return [NSArray yy_modelArrayWithClass:self json:response];
}

@end
