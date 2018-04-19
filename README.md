# YYURLRequest

[![CI Status](http://img.shields.io/travis/G-Xi0N/YYURLRequest.svg?style=flat)](https://travis-ci.org/G-Xi0N/YYURLRequest)
[![Version](https://img.shields.io/cocoapods/v/YYURLRequest.svg?style=flat)](http://cocoapods.org/pods/YYURLRequest)
[![License](https://img.shields.io/cocoapods/l/YYURLRequest.svg?style=flat)](http://cocoapods.org/pods/YYURLRequest)
[![Platform](https://img.shields.io/cocoapods/p/YYURLRequest.svg?style=flat)](http://cocoapods.org/pods/YYURLRequest)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

YYURLRequest is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YYURLRequest'
```

## Author

gaoX, gao497868860@163.com

## License

YYURLRequest is available under the MIT license. See the LICENSE file for more info.

## Usage

### Import

``` objc
   #import <YYURLRequest/YYURLRequest.h>
```

### Request with cache

``` objc
  YYURLRequest *request = [YYURLRequest requestWithBaseURL:[NSURL URLWithString:@"https://news-at.zhihu.com/api"] path:@"4/news/latest" parameters:nil];
  request.cache(^(id response) {
      YYTestModel *model = [YYTestModel mapObject:response];
      NSLog(@"cache: %@", model.stories);
  }).then(^(id response) {
      YYTestModel *model = [YYTestModel mapObject:response];
      NSLog(@"success: %@", model.stories.firstObject.title);
  }).catch(^(NSError *error) {
      NSLog(@"error: %@", error);
  });
```

### Request without cache

``` objc
  YYURLRequest *request = [YYURLRequest requestWithBaseURL:[NSURL URLWithString:@"https://news-at.zhihu.com/api"] path:@"4/news/latest" parameters:nil];
  request.then(^(id response) {
      YYTestModel *model = [YYTestModel mapObject:response];
      NSLog(@"success: %@", model.stories.firstObject.title);
  }).catch(^(NSError *error) {
      NSLog(@"error: %@", error);
  });
```
