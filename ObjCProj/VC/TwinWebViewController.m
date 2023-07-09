//
//  TwinWebViewController.m
//  test
//
//  Created by suhyup02 on 2020/08/25.
//  Copyright © 2020 aa. All rights reserved.
//

#import "TwinWebViewController.h"
#import <WebKit/WebKit.h>
//#import "GlobalDataManager.h"

@interface TwinWebViewController ()<WKNavigationDelegate, WKUIDelegate> {
    WKWebView *mWebView1;
    WKWebView *mWebView2;
}
@property (weak, nonatomic) IBOutlet UIView *mBView1;
@property (weak, nonatomic) IBOutlet UIView *mBView2;

@end

@implementation TwinWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [GlobalDataManager sharedInstance].gwkpPool = [[WKProcessPool alloc] init];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
//    configuration.processPool = [GlobalDataManager sharedInstance].gwkpPool;
    
    WKUserContentController *controller = [[WKUserContentController alloc] init];
    configuration.userContentController = controller;
    
    CGRect rect1 = _mBView1.frame;
    CGRect rect2 = _mBView2.frame;
//
//    NSLog(@"viewDidLoad rect1 %03f %03f %03f %03f", rect1.origin.x, rect1.origin.y, rect1.size.width, rect2.size.height);
//    NSLog(@"viewDidLoad rect2 %03f %03f %03f %03f", rect2.origin.x, rect2.origin.y, rect2.size.width, rect2.size.height);
    
    mWebView1 = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
    mWebView2 = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
    mWebView1.translatesAutoresizingMaskIntoConstraints = NO;
    mWebView2.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:mWebView1];
    [self.view addSubview:mWebView2];
    
    
    [mWebView1 setBackgroundColor:[UIColor blueColor]];
    [mWebView2 setBackgroundColor:[UIColor blueColor]];
    
    NSURLRequest *req1 = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://psmbtest.suhyup-bank.com:1443/ib20/mnu/PSM00146"]];
    
    NSURLRequest *req2 = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.naver.com"]];
    
    [mWebView1 loadRequest:req1];
    [mWebView2 loadRequest:req2];
    
    NSLayoutConstraint *lTop1 = [NSLayoutConstraint constraintWithItem:mWebView1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_mBView1 attribute:NSLayoutAttributeTop multiplier:1.f constant:0];
    NSLayoutConstraint *lBottom1 = [NSLayoutConstraint constraintWithItem:mWebView1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_mBView1 attribute:NSLayoutAttributeBottom multiplier:1.f constant:0];
    NSLayoutConstraint *lLeft1 = [NSLayoutConstraint constraintWithItem:mWebView1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_mBView1 attribute:NSLayoutAttributeLeft multiplier:1.f constant:0];
    NSLayoutConstraint *lRight1 = [NSLayoutConstraint constraintWithItem:mWebView1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_mBView1 attribute:NSLayoutAttributeRight multiplier:1.f constant:0];

    [self.view addConstraints:[NSArray arrayWithObjects: lTop1, lBottom1, lLeft1, lRight1, nil]];


    NSLayoutConstraint *lTop2 = [NSLayoutConstraint constraintWithItem:mWebView2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_mBView2 attribute:NSLayoutAttributeTop multiplier:1.f constant:0];
    NSLayoutConstraint *lBottom2 = [NSLayoutConstraint constraintWithItem:mWebView2 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_mBView2 attribute:NSLayoutAttributeBottom multiplier:1.f constant:0];
    NSLayoutConstraint *lLeft2 = [NSLayoutConstraint constraintWithItem:mWebView2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_mBView2 attribute:NSLayoutAttributeLeft multiplier:1.f constant:0];
    NSLayoutConstraint *lRight2 = [NSLayoutConstraint constraintWithItem:mWebView2 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_mBView2 attribute:NSLayoutAttributeRight multiplier:1.f constant:0];

    [self.view addConstraints:[NSArray arrayWithObjects: lTop2, lBottom2, lLeft2, lRight2, nil]];
    
    
    mWebView1.navigationDelegate = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGRect rect1 = _mBView1.frame;
    CGRect rect2 = _mBView2.frame;
    
    NSLog(@"viewWillAppear rect1 %03f %03f %03f %03f", rect1.origin.x, rect1.origin.y, rect1.size.width, rect2.size.height);
    NSLog(@"viewWillAppear rect2 %03f %03f %03f %03f", rect2.origin.x, rect2.origin.y, rect2.size.width, rect2.size.height);

//    [mWebView1 setFrame:rect1];
//    [mWebView2 setFrame:rect2];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CGRect rect1 = _mBView1.frame;
    CGRect rect2 = _mBView2.frame;

    NSLog(@"viewDidAppear rect1 %03f %03f %03f %03f", rect1.origin.x, rect1.origin.y, rect1.size.width, rect2.size.height);
    NSLog(@"viewDidAppear rect2 %03f %03f %03f %03f", rect2.origin.x, rect2.origin.y, rect2.size.width, rect2.size.height);
    
//    [mWebView1 setFrame:rect1];
//    [mWebView2 setFrame:rect2];
}

#pragma onBtn

- (IBAction)onBtn:(id)sender {
    UIButton *btn = (UIButton*)sender;
    
    //tag 90, 30 load request
    switch(btn.tag) {
        case 90:
            break;
        case 30:
            break;
        case 100:
            break;
        case 40:
            break;
    }
    
    
    //tag 100, 40 clear
    
}
- (IBAction)onBtn3:(UIButton *)sender {
//    [WKWebsiteDataStore.defaultDataStore.httpCookieStore getAllCookies:^(NSArray<NSHTTPCookie *> * _Nonnull result) {
//           for (NSHTTPCookie *cookie in result) {
//               // result로 받는 쿠키 배열을 원하는대로 처리
//               // NSLog(@"Cookie <%@>", cookie);
//           }
//
//        NSDictionary *dic = [NSHTTPCookie requestHeaderFieldsWithCookies:result];
//
//        NSLog(@"Cookie <%@>", dic);
//    }];
    
    NSLog(@">>> Cookie %@", [self getCookie]);
}


#pragma getCookie
- (NSDictionary*) getCookie {
    
    
    NSLog(@"get Cookie Start");
    __block NSDictionary *dic = nil;
    
//    if (@available(iOS 11.0, *)) {
//        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
//
//        [WKWebsiteDataStore.defaultDataStore.httpCookieStore getAllCookies:^(NSArray<NSHTTPCookie *> * _Nonnull result) {
//            for (NSHTTPCookie *cookie in result) {
//                // result로 받는 쿠키 배열을 원하는대로 처리
//                // NSLog(@"Cookie <%@>", cookie);
//            }
//
//            dic = [NSHTTPCookie requestHeaderFieldsWithCookies:result];
//
//            NSLog(@"get Cookie End <%@>", dic);
//            dispatch_semaphore_signal(semaphore);
//        }];
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//    } else {
//        // Fallback on earlier versions
//    }
    
    [WKWebsiteDataStore.defaultDataStore.httpCookieStore getAllCookies:^(NSArray<NSHTTPCookie *> * _Nonnull result) {
        for (NSHTTPCookie *cookie in result) {
            // result로 받는 쿠키 배열을 원하는대로 처리
            NSLog(@"Cookie <%@>", cookie);
        }
        
        dic = [NSHTTPCookie requestHeaderFieldsWithCookies:result];
        
        NSLog(@"get Cookie End <%@>", dic);
    }];
    
    
    NSLog(@"get Cookie return");
    return dic;
}

#pragma WKWebViewDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"1. decidePolicyForNavigationAction");
    
    NSLog(@" URL : %@] ", webView.URL.absoluteString);
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    
    NSLog(@"1. decidePolicyForNavigationResponse %@", webView.URL.absoluteString);
    
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)navigationResponse.response;
    NSLog(@"%@",response.description);
    
    NSLog(@"%@",response.URL.absoluteString);
    
    NSLog(@"allHeaderFields %@",[response allHeaderFields]);
    NSArray *cookies =[NSHTTPCookie cookiesWithResponseHeaderFields:[response allHeaderFields] forURL:response.URL];
    
    NSLog(@"nsDic %@",[NSHTTPCookie requestHeaderFieldsWithCookies:cookies]);
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookies:cookies forURL:response.URL mainDocumentURL:nil];
    
    
    NSLog(@"Response cookie %@", cookies);
//    for (NSHTTPCookie *cookie in cookies) {
//        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
//    }
    
    
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"1. didCommitNavigation");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"2. didFinishNavigation");
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"3. didFailNavigation");
}
@end
