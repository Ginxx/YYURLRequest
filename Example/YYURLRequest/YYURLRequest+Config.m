//
//  YYURLRequest+Config.m
//  YYURLRequest_Example
//
//  Created by GorXion on 2018/4/19.
//  Copyright © 2018年 G-Xi0N. All rights reserved.
//

#import "YYURLRequest+Config.h"
#import <YYURLRequest/YYURLRequest.h>
#import "YYResponse.h"

#define kBaseURL [NSURL URLWithString:@"https://api.github.com/"]

@implementation YYURLRequest (Config)

+ (instancetype)requestWithPath:(NSString *)path parameters:(NSDictionary *)parameters
{
    YYURLRequest *request = [self requestWithBaseURL:kBaseURL path:path parameters:parameters];
    request.requestSerializer.timeoutInterval = 10;
    request.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", @"image/jpeg", @"image/png", nil];
    return request;
}

- (YYURLRequest *(^)(void (^)(YYResponse *)))yy_cache
{
    return ^(void (^callback)(id)) {
        return self.cache(^(id response) {
            YYResponse *resp = [YYResponse mapObject:response];
            callback(resp);
        });
    };
}

- (YYURLRequest *(^)(void (^)(YYResponse *)))yy_then
{
    return ^(void (^success)(id)) {
        return self.then(^(id response) {
            YYResponse *resp = [YYResponse mapObject:response];
            success(resp);
        });
    };
}

@end
