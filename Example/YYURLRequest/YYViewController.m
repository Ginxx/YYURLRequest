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
#import "YYURLRequest+Config.h"
#import "YYResponse.h"
#import "YYTestModel.h"
#import "YYTestResultModel.h"

@interface YYViewController ()

@end

@implementation YYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    YYURLRequest *request = [YYURLRequest requestWithBaseURL:[NSURL URLWithString:@"https://news-at.zhihu.com/api"] path:@"4/news/latest" parameters:nil];
    request.cache(^(id response) {
        YYTestModel *model = [YYTestModel mapObject:response];
        NSLog(@"cache: %@", model.stories.firstObject.title);
    }).then(^(id response) {
        YYTestModel *model = [YYTestModel mapObject:response];
        NSLog(@"then: %@", model.stories.firstObject.title);
    }).catch(^(NSError *error) {
        NSLog(@"error: %@", error);
    });
    
//    [YYTestTarget requestUserEvent].then(^(id response) {
//        NSArray *list = [YYTestModel mapArray:response];
//        [list enumerateObjectsUsingBlock:^(YYTestModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSLog(@"success: %@", obj.created_at);
//        }];
//    }).catch(^(NSError *error) {
//         NSLog(@"error: %@", error);
//    });
    
    [YYTestTarget requestBannerList].yy_cache(^(YYResponse *response) {
        NSArray *list = [YYTestResultModel mapArray:response.result];
        YYTestResultModel *model = list.firstObject;
        NSLog(@"yy_cache: %@", model.name);
    }).yy_then(^(YYResponse *response) {
        NSArray *list = [YYTestResultModel mapArray:response.result];
        YYTestResultModel *model = list.firstObject;
        NSLog(@"yy_then: %@", model.name);
    }).catch(^(NSError *error) {
        NSLog(@"catch: %@", error);
    });
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:tap];
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapAction
{
    [self.navigationController pushViewController:[YYViewController new] animated:YES];
}

@end
