//
//  YYResponse.h
//  YYURLRequest_Example
//
//  Created by GorXion on 2018/4/19.
//  Copyright © 2018年 G-Xi0N. All rights reserved.
//

#import <YYURLRequest/YYURLRequest.h>

@interface YYResponse : YYBaseModel

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) id result;

@end
