//
//  YYURLRequest.m
//  YYURLRequest
//
//  Created by GorXion on 2018/4/19.
//

#import "YYURLRequest.h"
#import "AFHTTPSessionManager+YYURLRequest.h"
#import "YYCache+Shared.h"

@interface YYURLRequest ()

@property (nonatomic, strong) NSURL *baseURL;
@property (nonatomic, copy) NSString *path;

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, assign) BOOL needsCache;

@property (nonatomic, copy) void (^failure)(NSError *);

@end

@implementation YYURLRequest

- (instancetype)initWithBaseURL:(NSURL *)baseURL
                           path:(NSString *)path
                     parameters:(NSDictionary *)parameters
{
    self = [super init];
    if (self) {
        _baseURL = baseURL;
        _path = path;
        _parameters = parameters;
    }
    return self;
}

#pragma mark - public
+ (instancetype)requestWithBaseURL:(NSURL *)baseURL
                              path:(NSString *)path
                        parameters:(NSDictionary *)parameters
{
    return [[self alloc] initWithBaseURL:baseURL path:path parameters:parameters];
}

- (YYURLRequest *(^)(void (^)(id)))cache
{
    return ^(void (^callback)(id)) {
        callback([[YYCache sharedCache] objectForKey:[self cachedKey]]);
        self.needsCache = YES;
        return self;
    };
}

- (YYURLRequest *(^)(void (^)(id)))then
{
    return ^(void (^success)(id)) {
        [self.manager startRequest:self success:^(id response) {
            !success ?: success(response);
            if (self.needsCache) [[YYCache sharedCache] setObject:response forKey:[self cachedKey]];
        } failure:^(NSError *error) {
            !self.failure ?: self.failure(error);
        }];
        return self;
    };
}

- (void (^)(void (^)(NSError *)))catch
{
    return ^(void (^failure)(NSError *)) {
        self.failure = failure;
    };
}

#pragma mark - getter
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (NSString *)URLString
{
    if (self.path.length > 0) return [self.baseURL URLByAppendingPathComponent:self.path].absoluteString;
    return self.baseURL.absoluteString;
}

- (AFHTTPRequestSerializer<AFURLRequestSerialization> *)requestSerializer
{
    return self.manager.requestSerializer;
}

- (AFHTTPResponseSerializer<AFURLResponseSerialization> *)responseSerializer
{
    return self.manager.responseSerializer;
}

- (NSString *)cachedKey
{
    return [NSString stringWithFormat:@"%@?%@", self.URLString, self.parameters];
}

@end
