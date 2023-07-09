//
//  WKPostViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2020/12/28.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "WKPostViewController.h"
#import <WebKit/WebKit.h>

@interface WKPostViewController ()<WKNavigationDelegate> {
    WKWebView *cwkWV;
}

@end

@implementation WKPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *controller = [[WKUserContentController alloc] init];

    configuration.userContentController = controller;
    
    cwkWV = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
    [cwkWV setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:cwkWV];
    
    // 기존에는 TopLayoutGuide나 bottomLayoutGuide에 연결해서 사용했으나
    // 11 이후에는 safeArea를 사용할 경우에 아래와 같이 처리해야 한다.
    if(@available(iOS 11.0, *)) {
        UILayoutGuide *safearea =  self.view.safeAreaLayoutGuide;
        
        NSLayoutConstraint *left = [cwkWV.leadingAnchor constraintEqualToAnchor:safearea.leadingAnchor]; [left setActive:YES];
        NSLayoutConstraint *top = [cwkWV.topAnchor constraintEqualToAnchor:safearea.topAnchor constant:0.0]; [top setActive:YES];
        NSLayoutConstraint *bottom = [cwkWV.bottomAnchor constraintEqualToAnchor:safearea.bottomAnchor]; [bottom setActive:YES];
        NSLayoutConstraint *right = [cwkWV.trailingAnchor constraintEqualToAnchor:safearea.trailingAnchor]; [right setActive:YES];
    }else {
        NSLayoutConstraint *lTop1 = [NSLayoutConstraint constraintWithItem:cwkWV attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.f constant:0];
        NSLayoutConstraint *lBottom1 = [NSLayoutConstraint constraintWithItem:cwkWV attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.f constant:0];
        NSLayoutConstraint *lLeft1 = [NSLayoutConstraint constraintWithItem:cwkWV attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.f constant:0];
        NSLayoutConstraint *lRight1 = [NSLayoutConstraint constraintWithItem:cwkWV attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.f constant:0];
        
        [self.view addConstraints:[NSArray arrayWithObjects: lTop1, lBottom1, lLeft1, lRight1, nil]];
    }
    
    NSDate* date = [NSDate date];
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyyMMddhhmmss"];
    NSString *regDate = [formatter stringFromDate:date];
    NSLog(@"regDate : %@", regDate);
    
    NSDictionary *dic = @{@"os":@"i",
                          @"id":@"ksos73",
                          @"regTime":regDate};

    NSMutableURLRequest *req = nil;
    if(@available(iOS 11.0, *)) { // Post
        req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/test/sPost.html", [Utility getHost]]]];
        
        [req setHTTPMethod:@"POST"];
    }else { // Get
        NSMutableString *bodyString = [NSMutableString new];
        
        for(NSString *keyName in dic) {
            [bodyString appendFormat:@"%@=%@&", keyName, [dic objectForKey:keyName]];
        }
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/test/sGet.html?%@", [Utility getHost], bodyString]];

        req = [NSMutableURLRequest requestWithURL:url];
        [req setHTTPMethod:@"GET"];
    }
    
    
    [cwkWV loadRequest:req];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
