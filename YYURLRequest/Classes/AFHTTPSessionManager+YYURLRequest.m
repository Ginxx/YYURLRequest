//
//  AFHTTPSessionManager+YYURLRequest.m
//  YYURLRequest
//
//  Created by Pircate on 2018/4/19.
//

#import "AFHTTPSessionManager+YYURLRequest.h"
#import "YYURLRequest.h"

@implementation AFHTTPSessionManager (YYURLRequest)

- (NSURLSessionDataTask *)startRequest:(YYURLRequest *)request
                               success:(void (^)(id response))success
                               failure:(void (^)(NSError *error))failure
{
    switch (request.method) {
        case YYHTTPMethodGet:
        {
            return [self GET:request.URLString parameters:request.parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
        case YYHTTPMethodHead:
        {
            return [self HEAD:request.URLString parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task) {
                !success ?: success(nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
        case YYHTTPMethodPost:
        {
            return [self POST:request.URLString parameters:request.parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
        case YYHTTPMethodUpload:
        {
            NSAssert(request.constructingBodyBlock, @"Constructing body block can not be null");
            return [self POST:request.URLString parameters:request.parameters constructingBodyWithBlock:request.constructingBodyBlock progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
        case YYHTTPMethodPut:
        {
            return [self PUT:request.URLString parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
        case YYHTTPMethodPatch:
        {
            return [self PATCH:request.URLString parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
        case YYHTTPMethodDelete:
        {
            return [self DELETE:request.URLString parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
            break;
    }
}

@end
