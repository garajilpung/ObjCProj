//
//  CompareWebviewViewController.m
//  ObjCProj
//
//  Created by SMG on 2020/12/12.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "CompareWebviewViewController.h"
#import <WebKit/WebKit.h>
#import "NSString+Extension.h"

@interface CompareWebviewViewController () <WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate> {
    WKWebView *m_WKwv;
    UILayoutGuide *safearea;
}
@property (weak, nonatomic) IBOutlet UIWebView *m_Uwv;
@property (weak, nonatomic) IBOutlet UIView *m_bv;

@end

@implementation CompareWebviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _m_Uwv.scrollView.bounces = NO;
    
    safearea = self.view.safeAreaLayoutGuide;
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *controller = [[WKUserContentController alloc] init];
    
    [controller addScriptMessageHandler:self name:@"jscall"];
    configuration.userContentController = controller;
    
    m_WKwv = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
    m_WKwv.scrollView.bounces = NO;
    m_WKwv.UIDelegate = self;
    m_WKwv.navigationDelegate = self;
    m_WKwv.translatesAutoresizingMaskIntoConstraints = false;
    [_m_bv addSubview:m_WKwv];
    
    if(@available(iOS 11.0, *)) {
        NSLayoutConstraint *left = [m_WKwv.leftAnchor constraintEqualToAnchor:_m_bv.leftAnchor]; [left setActive:YES];
        NSLayoutConstraint *top = [m_WKwv.topAnchor constraintEqualToAnchor:_m_bv.topAnchor]; [top setActive:YES];
        NSLayoutConstraint *bottom = [m_WKwv.bottomAnchor constraintEqualToAnchor:_m_bv.bottomAnchor]; [bottom setActive:YES];
        NSLayoutConstraint *right = [m_WKwv.rightAnchor constraintEqualToAnchor:_m_bv.rightAnchor]; [right setActive:YES];
    }else {
//        NSLayoutConstraint *lTop1 = [NSLayoutConstraint constraintWithItem:cwkWV attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.f constant:0];
//        NSLayoutConstraint *lBottom1 = [NSLayoutConstraint constraintWithItem:cwkWV attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_onBtn1 attribute:NSLayoutAttributeTop multiplier:1.f constant:0];
//        NSLayoutConstraint *lLeft1 = [NSLayoutConstraint constraintWithItem:cwkWV attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.f constant:0];
//        NSLayoutConstraint *lRight1 = [NSLayoutConstraint constraintWithItem:cwkWV attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.f constant:0];
//
//        [self.view addConstraints:[NSArray arrayWithObjects: lTop1, lBottom1, lLeft1, lRight1, nil]];
    }
    
    NSString *strURL = [NSString stringWithFormat:@"%@/test/iOS_WebView.html", [Utility getHost]];
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    [_m_Uwv loadRequest: request];
    [m_WKwv loadRequest: request];
    
    NSString *userAgent = [_m_Uwv stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    NSLog(@"UIWebView [%@]", userAgent);
    
    [m_WKwv evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id result, NSError * _Nullable error) {
        NSString* userAgent = (NSString*)result;
        NSLog(@"WKWebView [%@]", userAgent);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UIWebView script
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
 
    NSString* abUrl = request.URL.absoluteString;
    
    if ([abUrl hasPrefix:@"jscall://"]) {
        NSLog(@"UIWebView shouldStartLoadWithRequest");
        
        NSString *cmd = request.URL.host;
        
        NSLog(@"cmd %@", cmd);
        NSLog(@"query %@",request.URL.query);
        
        return NO;
    }
    
    return YES;
}

#pragma mark - WkWebView script
- (void)userContentController:(nonnull WKUserContentController *)userContentController didReceiveScriptMessage:(nonnull WKScriptMessage *)message {
    NSString *msgName = message.name;
    NSError *err;
    NSDictionary* dic = [message.body getDictionary:err];
    
    NSLog(@"WKWebview userContentController");
    if([msgName isEqualToString:@"jscall"]){
        NSString* cmd = dic[@"cmd"];
        NSString* callback = dic[@"callback"];
        
        NSLog(@"cmd [%@]", cmd);
        NSLog(@"callback [%@]", callback);
    }
}

@end
