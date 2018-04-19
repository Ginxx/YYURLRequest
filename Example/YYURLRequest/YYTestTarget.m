//
//  YYTestTarget.m
//  YYURLRequest_Example
//
//  Created by GorXion on 2018/4/19.
//  Copyright © 2018年 G-Xi0N. All rights reserved.
//

#import "YYTestTarget.h"
#import "YYURLRequest+Config.h"

@implementation YYTestTarget

+ (YYURLRequest *)requestUserEvent
{
    return [YYURLRequest requestWithPath:@"users/ginxx/received_events" parameters:@{@"access_token": @"78b8645ce7c1bb854330b1b54810cce445b48f59"}];
}

@end
