//
//  YYBaseModel.m
//  YYURLRequest
//
//  Created by GorXion on 2018/4/19.
//

#import "YYBaseModel.h"
#import <YYModel/YYModel.h>

@interface YYBaseModel () <NSCoding, NSCopying>

@end

@implementation YYBaseModel

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    return [self yy_modelEncodeWithCoder:aCoder];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    return [self yy_modelInitWithCoder:aDecoder];
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return [self yy_modelCopy];
}

@end
