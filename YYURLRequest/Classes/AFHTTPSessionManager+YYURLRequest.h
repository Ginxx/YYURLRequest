//
//  AFHTTPSessionManager+YYURLRequest.h
//  YYURLRequest
//
//  Created by Pircate on 2018/4/19.
//

#import <AFNetworking/AFNetworking.h>

@class YYURLRequest;

@interface AFHTTPSessionManager (YYURLRequest)

- (void)startRequest:(YYURLRequest *)request
             success:(void (^)(id response))success
             failure:(void (^)(NSError *error))failure;

@end
