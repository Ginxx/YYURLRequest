//
//  YYViewController.m
//  YYURLRequest
//
//  Created by G-Xi0N on 04/19/2018.
//  Copyright (c) 2018 G-Xi0N. All rights reserved.
//

#import "YYViewController.h"
#import "YYTestTarget.h"
#import <YYURLRequest/YYURLRequest.h>
#import "YYTestModel.h"

@interface YYViewController ()

@end

@implementation YYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [YYTestTarget requestUserEvent].cache(^(id cachedData) {
        NSArray *list = [YYTestModel mapArray:cachedData];
        [list enumerateObjectsUsingBlock:^(YYTestModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"cache: %@", obj.created_at);
        }];
    }).then(^(id response) {
        NSArray *list = [YYTestModel mapArray:response];
        [list enumerateObjectsUsingBlock:^(YYTestModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"success: %@", obj.created_at);
        }];
    }).error(^(NSError *error) {
        NSLog(@"error: %@", error);
    });
    
//    [[YYTestTarget requestUserEvent] completionWithSuccess:^(id response) {
//        NSArray *list = [YYTestModel mapArray:response];
//        [list enumerateObjectsUsingBlock:^(YYTestModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSLog(@"success: %@", obj.created_at);
//        }];
//    } failure:^(NSError *error) {
//
//    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
