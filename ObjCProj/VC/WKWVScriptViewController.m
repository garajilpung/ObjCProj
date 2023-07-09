//
//  WKWVScriptViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 18/03/2020.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "WKWVScriptViewController.h"
#import "NSString+Extension.h"
#import <WebKit/WebKit.h>
#import <objc/runtime.h>

@interface WKWVScriptViewController ()<WKNavigationDelegate,WKScriptMessageHandler,WKUIDelegate> {
    WKWebView *cwkWV;
}
@property (weak, nonatomic) IBOutlet UIButton *onBtn1;
@end

@implementation WKWVScriptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]
                                             init];
    
    WKUserContentController *controller = [[WKUserContentController alloc]
                                           init];
    
    [controller addScriptMessageHandler:self name:@"callbackHandler"];
    [controller addScriptMessageHandler:self name:@"jsHandler"];
    [controller addScriptMessageHandler:self name:@"jsHandler2"];
    
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
        NSLayoutConstraint *bottom = [cwkWV.bottomAnchor constraintEqualToAnchor:_onBtn1.topAnchor]; [bottom setActive:YES];
        NSLayoutConstraint *right = [cwkWV.trailingAnchor constraintEqualToAnchor:safearea.trailingAnchor]; [right setActive:YES];
        
        [self.view addConstraints:[NSArray arrayWithObjects: left, top, bottom, right, nil]];
        
    }else {
        NSLayoutConstraint *lTop1 = [NSLayoutConstraint constraintWithItem:cwkWV attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.f constant:0];
        NSLayoutConstraint *lBottom1 = [NSLayoutConstraint constraintWithItem:cwkWV attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_onBtn1 attribute:NSLayoutAttributeTop multiplier:1.f constant:0];
        NSLayoutConstraint *lLeft1 = [NSLayoutConstraint constraintWithItem:cwkWV attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.f constant:0];
        NSLayoutConstraint *lRight1 = [NSLayoutConstraint constraintWithItem:cwkWV attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.f constant:0];
        
        [self.view addConstraints:[NSArray arrayWithObjects: lTop1, lBottom1, lLeft1, lRight1, nil]];
    }

    
    cwkWV.navigationDelegate = self;
    
//    NSString *google = @"https://garajilpung.synology.me/test/iOS_KWWebView_Script.html"; // test용 URL
//    NSString *google = @"https://garajilpung.synology.me/test/appCall.html"; // test용 URL
    NSString *google = @"https://psmbtest.suhyup-bank.com:1443/ib20/mnu/PSM00426"; // test용 URL
    
//    NSString *google = @"http://192.168.1.103/push/push.html"; // test용 URL
//    NSURL *url = [[NSURL alloc] initWithString:google];
//    NSURLRequest *nsrequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:1];
    [cwkWV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:google]]];
     
     [self.view bringSubviewToFront:cwkWV];

    
    
    // setUserAgent
    __block NSString *userAgent = nil;
    
    [cwkWV evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id result, NSError * error) {
        userAgent = (NSString*)result;
//        userAgent = [userAgent stringByAppendingString:@"APP_iOS"];
        [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent": @"APP_iOS"}];
        
        NSLog(@"UserAgent %@", userAgent);
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


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    CGRect rect = _vBack.frame;
//    [cwkWV setFrame:rect];

}

- (id)inputAccessoryView {
    return nil;
}

- (void)removeInputAccessoryViewFromWKWebView:(WKWebView *)webView {
    UIView *targetView;
    
    for (UIView *view in webView.scrollView.subviews) {
        if([[view.class description] hasPrefix:@"WKContent"]) {
            targetView = view;
        }
    }
    if (!targetView) {
        return;
    }
    NSString *noInputAccessoryViewClassName = [NSString stringWithFormat:@"%@_NoInputAccessoryView", targetView.class.superclass];
    Class newClass = NSClassFromString(noInputAccessoryViewClassName);
    
    if(newClass == nil) {
        newClass = objc_allocateClassPair(targetView.class, [noInputAccessoryViewClassName cStringUsingEncoding:NSASCIIStringEncoding], 0);
        if(!newClass) {
            return;
        }
        
        Method method = class_getInstanceMethod([self class], @selector(inputAccessoryView));
        
        class_addMethod(newClass, @selector(inputAccessoryView), method_getImplementation(method), method_getTypeEncoding(method));
        
        objc_registerClassPair(newClass);
    }
    
    object_setClass(targetView, newClass);
}

#pragma mark - UIButton Event

- (IBAction)onBtn01:(id)sender {
    
    NSString* callBack = [NSString stringWithFormat:@"callJavascriptFromObjectiveC('%@')", @"1"];
    
    [cwkWV evaluateJavaScript:callBack completionHandler:^(id result, NSError * error) {
    
        if(error != nil) {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"알림" message:result preferredStyle:UIAlertControllerStyleActionSheet];
            
            UIAlertAction* ok1 = [UIAlertAction
                                  actionWithTitle:@"확인"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action)
                                  {
                                      [alertVC dismissViewControllerAnimated:YES completion:nil];
                                      
                                  }];
            [alertVC addAction:ok1];
            
            [self presentViewController:alertVC animated:YES completion:nil];
        }else {
            
        }
    }];
}

- (IBAction)onBtn02:(id)sender {
    NSString* callBack = [NSString stringWithFormat:@"callJavascriptFromObjectiveC()"];
    
    [cwkWV evaluateJavaScript:callBack completionHandler:^(id result, NSError * _Nullable error) {
        
        if(error != nil) {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"알림" message:result preferredStyle:UIAlertControllerStyleActionSheet];
            
            UIAlertAction* ok1 = [UIAlertAction
                                  actionWithTitle:@"확인"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action)
                                  {
                                      [alertVC dismissViewControllerAnimated:YES completion:nil];
                                      
                                  }];
            [alertVC addAction:ok1];
            
            [self presentViewController:alertVC animated:YES completion:nil];
        }else {
            
        }
    }];
}

- (IBAction)onBtn03:(id)sender {
    
}

- (IBAction)onBtn04:(id)sender {
    
}

- (IBAction)onBtn05:(id)sender {
    
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"0. decidePolicyForNavigationAction");
//    NSLog(@" URL : %@] ", webView.URL.absoluteString);
//    NSLog(@" navigationAction : %@] ", navigationAction.request.URL.absoluteString);
//    NSLog(@" navigationAction : %@] ", navigationAction.request.URL.scheme );
    
    NSString *urlScheme = navigationAction.request.URL.scheme;
    NSArray *arrCompare = @[@"tel", @"sms", @"facetime", @"mailto"]; // 그외 map과 아이튠즈, 유투브도 가능
    
    //https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/Introduction/Introduction.html#//apple_ref/doc/uid/TP40007899-CH1-SW1
    
    if([arrCompare containsObject:urlScheme]) {
        [[UIApplication sharedApplication] openURL:navigationAction.request.URL options:@{@"":@""} completionHandler:^(BOOL success) {

        }];
        decisionHandler(WKNavigationActionPolicyCancel);

        return;
    }
    
    if([webView.URL.absoluteString rangeOfString:@"CallAppFromJS"].location != NSNotFound) {
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"1.5. didStartProvisionalNavigation");
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

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    NSString *msgName = message.name;
    
    if([msgName isEqualToString:@"callbackHandler"]) {
        NSString* msgBody = (NSString*)(message.body);
        
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:msgName message:msgBody preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* ok1 = [UIAlertAction
                              actionWithTitle:@"확인"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action)
                              {
                                  [alertVC dismissViewControllerAnimated:YES completion:nil];
                                  
                              }];
        [alertVC addAction:ok1];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }else if([msgName isEqualToString:@"jsHandler"]){
        NSString* msgBody = (NSString*)(message.body);
        NSError *err = nil;
        
        NSDictionary *dic = [msgBody getDictionary:err];
        
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:msgName message:msgBody preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* ok1 = [UIAlertAction
                              actionWithTitle:@"확인"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action)
                              {
                                  [alertVC dismissViewControllerAnimated:YES completion:nil];
                                  
                              }];
        [alertVC addAction:ok1];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }else if([msgName isEqualToString:@"jsHandler2"]){
        NSDictionary* dic = (NSDictionary*)message.body;
        
        
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:msgName message:dic.description preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* ok1 = [UIAlertAction
                              actionWithTitle:@"확인"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action)
                              {
                                  [alertVC dismissViewControllerAnimated:YES completion:nil];
                                  
                              }];
        [alertVC addAction:ok1];
    }else {
        
    }
    
}
@end
