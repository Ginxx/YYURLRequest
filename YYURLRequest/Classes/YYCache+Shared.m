//
//  YYCache+Shared.m
//  YYURLRequest
//
//  Created by Pircate on 2018/4/19.
//

#import "YYCache+Shared.h"

@implementation YYCache (Shared)

+ (instancetype)sharedCache
{
    static YYCache *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *cachesDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        NSString *path = [cachesDirectory stringByAppendingPathComponent:@"YYURLRequestCache"];
        cache = [[YYCache alloc] initWithPath:path];
    });
    return cache;
}

@end
