//
//  YYURLRequest.h
//  YYURLRequest
//
//  Created by Pircate on 2018/4/19.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFURLRequestSerialization.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import <AFNetworking/AFSecurityPolicy.h>
#import "YYBaseModel.h"
#import "YYBaseModel+Map.h"

typedef NS_ENUM(NSInteger, YYHTTPMethod) {
    YYHTTPMethodGet = 0,
    YYHTTPMethodHead,
    YYHTTPMethodPost,
    YYHTTPMethodUpload,
    YYHTTPMethodPut,
    YYHTTPMethodPatch,
    YYHTTPMethodDelete
};

@interface YYURLRequest : NSObject

@property (nonatomic, copy, readonly) NSString *URLString;
@property (nonatomic, copy, readonly) NSDictionary<NSString *, id> *parameters;

@property (nonatomic, assign) YYHTTPMethod method;

@property (nonatomic, strong) AFHTTPRequestSerializer<AFURLRequestSerialization> *requestSerializer;

@property (nonatomic, strong) AFHTTPResponseSerializer<AFURLResponseSerialization> *responseSerializer;

@property (nonatomic, strong) AFSecurityPolicy *securityPolicy;

@property (nonatomic, copy) void (^constructingBodyWithBlock)(id<AFMultipartFormData> formData);

+ (instancetype)requestWithBaseURL:(NSURL *)baseURL
                              path:(NSString *)path
                        parameters:(NSDictionary *)parameters;

@property (nonatomic, copy, readonly) YYURLRequest *(^cache)(void (^)(id response));

@property (nonatomic, copy, readonly) YYURLRequest *(^then)(void (^)(id response));

@property (nonatomic, copy, readonly) void (^catch)(void (^)(NSError *error));

@end
