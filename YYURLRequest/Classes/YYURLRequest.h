//
//  YYURLRequest.h
//  YYURLRequest
//
//  Created by GorXion on 2018/4/19.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFURLRequestSerialization.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import "YYBaseModel.h"
#import "YYBaseModel+Map.h"

typedef NS_ENUM(NSInteger, YYHTTPMethod) {
    YYHTTPMethodGet = 0,
    YYHTTPMethodPost,
    YYHTTPMethodUpload
};

@interface YYURLRequest : NSObject

@property (nonatomic, copy, readonly) NSString * URLString;
@property (nonatomic, copy, readonly) NSDictionary<NSString *, id> * parameters;

@property (nonatomic, assign) YYHTTPMethod method;

@property (nonatomic, strong) AFHTTPRequestSerializer<AFURLRequestSerialization> *requestSerializer;
@property (nonatomic, strong) AFHTTPResponseSerializer<AFURLResponseSerialization> *responseSerializer;

@property (nonatomic, strong) void (^constructingBodyWithBlock)(id<AFMultipartFormData> formData);



+ (instancetype)requestWithBaseURL:(NSURL *)baseURL
                              path:(NSString *)path
                        parameters:(NSDictionary *)parameters;

@property (nonatomic, copy) YYURLRequest *(^cache)(void (^)(id cachedData));

@property (nonatomic, copy) YYURLRequest *(^then)(void (^)(id response));

@property (nonatomic, copy) void (^error)(void (^)(NSError *error));

- (void)completionWithSuccess:(void (^)(id response))success
                      failure:(void (^)(NSError *error))failure;

@end
