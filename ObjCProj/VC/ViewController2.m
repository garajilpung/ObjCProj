//
//  ViewController2.m
//  test
//
//  Created by suhyup02 on 2018. 3. 28..
//  Copyright © 2018년 aa. All rights reserved.
//

#import "ViewController2.h"

#import <WebKit/WebKit.h>

@interface ViewController2 () <WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler>

@property (nonatomic, retain) WKWebView *mWebView;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]
                                             init];
    
    WKUserContentController *controller = [[WKUserContentController alloc]
                                           init];
    
    [controller addScriptMessageHandler:self name:@"observe"];
    configuration.userContentController = controller;
    
//    _mWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20) configuration:configuration];
    _mWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
//    _mWebView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    [_mWebView.configuration.userContentController addUserScript:userScript];
//    _mWebView.UIDelegate = self;
    _mWebView.navigationDelegate = self;
    [self.view addSubview:_mWebView];
    
    // request
    
//    NSString *google = @"http://www.google.com";
//    NSString *google = @"http://garajilpung.synology.me/appCall.html";
//    NSString *google = @"https://psmbtest.suhyup-bank.com:1443/ib20/mnu/PSM00416";

//    NSString *google = @"http://garajilpung.synology.me/test/localLoad.html"; // test용 URL
    NSString *google = @"http://garajilpung.synology.me/test/appCall.html"; // test용 URL
    NSURL *url = [[NSURL alloc] initWithString:google];
    NSURLRequest *nsrequest = [NSURLRequest requestWithURL:url];
    [_mWebView loadRequest:nsrequest];

    
    /*
    // local 데이터르 html 로드 방법, 로컬로 읽는 Html에서는 로컬 데이터르 읽어 webpage를 작성할 수 있다.
    NSString *pathB = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:pathB];
    [_mWebView loadHTMLString:[NSString stringWithFormat:@"<html><body><img src=\"xImg_a.png\"><img src=\"https://garajilpung.synology.me/test/icon.jpg\"></body></html>"] baseURL:baseURL];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    /*
     https://psmbtest.suhyup-bank.com:1443/ib20/mnu/CallAppFromJS?cmd=doNHwInfo&callback=ExtApp.doNHwInfoCallback
     
     */
    // Log out the message received
    NSLog(@"Received event body %@", message.body);
    NSLog(@"Received event name %@", message.name);

    WKFrameInfo *frameInfo = message.frameInfo;

    NSLog(@"Received event absoluteString %@", frameInfo.request.URL.absoluteString);
//
//    // Then pull something from the device using the message body
//    NSString *version = [[UIDevice currentDevice] valueForKey:message.body];
//
//    // Execute some JavaScript using the result
//    NSString *exec_template = @"set_headline(\"received: %@\");";
//    NSString *exec = [NSString stringWithFormat:exec_template, version];
//    [_mWebView evaluateJavaScript:exec completionHandler:nil];
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"decidePolicyForNavigationAction");
    
    NSArray* list = [navigationAction.request.URL.absoluteString componentsSeparatedByString:@"?&"];
    
    NSLog(@"navigationAction.request.URL: %@", navigationAction.request.URL);
    
    // cancel or allow requests
    
//    if (([[NSString stringWithFormat:@"%@", navigationAction.request.URL] isEqualToString: @"https://www.bing.com"])){
//        
//        decisionHandler(WKNavigationActionPolicyCancel);
//        
//    } else {
//        
//        decisionHandler(WKNavigationActionPolicyAllow);
//        
// 
//    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    NSLog(@"decidePolicyForNavigationResponse");
    
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"didStartProvisionalNavigation");
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"didReceiveServerRedirectForProvisionalNavigation");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"didFailProvisionalNavigation%@", error.description);
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"didCommitNavigation");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"didFinishNavigation");
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"didFailNavigation %@", error.description);
}

- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
    NSLog(@"didReceiveAuthenticationChallenge");

//    SecTrustRef serverTrust = challenge.protectionSpace.serverTrust;
//    CFDataRef exceptions = SecTrustCopyExceptions (serverTrust);
//    SecTrustSetExceptions (serverTrust, exceptions);
//    CFRelease (exceptions);
//
//    completionHandler (NSURLSessionAuthChallengeUseCredential, [NSURLCredential credentialForTrust:serverTrust]);
    
    completionHandler(NSURLSessionAuthChallengeUseCredential, nil);
}

- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    NSLog(@"webViewWebContentProcessDidTerminate");
}
@end
