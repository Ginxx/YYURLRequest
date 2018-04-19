//
//  YYTestModel.h
//  YYURLRequest_Example
//
//  Created by GorXion on 2018/4/19.
//  Copyright © 2018年 G-Xi0N. All rights reserved.
//

#import <YYURLRequest/YYURLRequest.h>

@class YYTestResultModel;

@interface YYTestModel : YYBaseModel

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, strong) NSArray<YYTestResultModel *> *stories;

@end
