//
//  AFHTTPSessionManager+YYURLRequest.m
//  YYURLRequest
//
//  Created by Pircate on 2018/4/19.
//

#import "AFHTTPSessionManager+YYURLRequest.h"
#import "YYURLRequest.h"

@implementation AFHTTPSessionManager (YYURLRequest)

- (void)startRequest:(YYURLRequest *)request
             success:(void (^)(id response))success
             failure:(void (^)(NSError *error))failure
{
    switch (request.method) {
        case YYHTTPMethodGet:
        {
            [self GET:request.URLString parameters:request.parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
        case YYHTTPMethodHead:
        {
            [self HEAD:request.URLString parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task) {
                !success ?: success(nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
        case YYHTTPMethodPost:
        {
            [self POST:request.URLString parameters:request.parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
        case YYHTTPMethodUpload:
        {
            [self POST:request.URLString parameters:request.parameters constructingBodyWithBlock:request.constructingBodyWithBlock progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
        case YYHTTPMethodPut:
        {
            [self PUT:request.URLString parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
        case YYHTTPMethodPatch:
        {
            [self PATCH:request.URLString parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
        case YYHTTPMethodDelete:
        {
            [self DELETE:request.URLString parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
    }
}

@end
