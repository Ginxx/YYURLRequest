//
//  YYURLRequest+Config.h
//  YYURLRequest_Example
//
//  Created by GorXion on 2018/4/19.
//  Copyright © 2018年 G-Xi0N. All rights reserved.
//

#import <YYURLRequest/YYURLRequest.h>

@class YYResponse;

@interface YYURLRequest (Config)

+ (instancetype)requestWithPath:(NSString *)path parameters:(NSDictionary *)parameters;

@property (nonatomic, copy, readonly) YYURLRequest *(^yy_cache)(void (^)(YYResponse *response));

@property (nonatomic, copy, readonly) YYURLRequest *(^yy_then)(void (^)(YYResponse *response));

@end
