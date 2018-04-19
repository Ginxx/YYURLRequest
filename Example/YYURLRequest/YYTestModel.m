//
//  YYTestModel.m
//  YYURLRequest_Example
//
//  Created by GorXion on 2018/4/19.
//  Copyright © 2018年 G-Xi0N. All rights reserved.
//

#import "YYTestModel.h"
#import "YYTestResultModel.h"

@implementation YYTestModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"stories": [YYTestResultModel class]};
}

@end
