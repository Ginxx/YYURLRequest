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
    return [YYURLRequest requestWithPath:@"users/ginxx/received_events" parameters:@{@"access_token": @"567e7c3f2fafa46e5c6fe9d6a2ea8ecf536e1494"}];
}

@end
