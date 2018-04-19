//
//  YYCache+Shared.m
//  YYURLRequest
//
//  Created by GorXion on 2018/4/19.
//

#import "YYCache+Shared.h"

@implementation YYCache (Shared)

+ (instancetype)sharedCache
{
    static YYCache *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *cachesDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        NSString *cachedPath = [cachesDirectory stringByAppendingPathComponent:@"YYURLRequestCache"];
        BOOL isDir;
        if (![[NSFileManager defaultManager] fileExistsAtPath:cachedPath isDirectory:&isDir]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:cachedPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        else {
            if (!isDir) {
                [[NSFileManager defaultManager] removeItemAtPath:cachedPath error:nil];
                [[NSFileManager defaultManager] createDirectoryAtPath:cachedPath withIntermediateDirectories:YES attributes:nil error:nil];
            }
        }
        cache = [[YYCache alloc] initWithPath:cachedPath];
    });
    return cache;
}

@end
