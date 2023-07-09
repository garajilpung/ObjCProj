//
//  UIWebViewScrpitViewController.m
//  test
//
//  Created by suhyup02 on 2019. 4. 10..
//  Copyright © 2019년 aa. All rights reserved.
//

#import "UIWebViewScrpitViewController.h"
@import WebKit;

@interface UIWebViewScrpitViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *mWebView;

@end

@implementation UIWebViewScrpitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSURL *url1 = [[NSURL alloc] initWithString:@"https://garajilpung.synology.me/test/iOS_UIWebVeiew_Script.html"];
    NSURL *url1 = [[NSURL alloc] initWithString:@"https://garajilpung.synology.me/test/iOS_UIWebVeiew_Script.php"];
    NSMutableURLRequest *nsrequest1 = [NSMutableURLRequest requestWithURL:url1];
    
    [nsrequest1 setHTTPMethod:@"POST"];
    [nsrequest1 setValue:@"true" forHTTPHeaderField:@"x-custom-header"];
    [nsrequest1 setValue:@"12341234" forHTTPHeaderField:@"x-Phone-Number"];
    
    [_mWebView loadRequest:nsrequest1];
    _mWebView.delegate = self;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onBtn1:(UIButton *)sender {
//    [_mWebView stringByEvaluatingJavaScriptFromString:@"callJavascriptFromObjectiveC();"];
    
    // parameter 추가한 버전
    NSString *func = [NSString stringWithFormat:@"callNativeToJavaScript('%@', '%@')", @"알림", @"Obj-C에서 호출됨"];
    
    [_mWebView stringByEvaluatingJavaScriptFromString:func];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
 
    
    if ([[[request URL] absoluteString] hasPrefix:@"jscall:"]) {
        NSString *requestString = [[request URL] absoluteString];
        NSArray *components = [requestString componentsSeparatedByString:@"://"];
        NSString *functionName = [components objectAtIndex:1];
        
        
        if ([functionName isEqualToString:@"callObjectiveCFromJavascript"]) {
            [self performSelector:@selector(callObjectiveCFromJavascript)];
        }else if ([functionName isEqualToString:@"callJavaScriptToNative"]) {
            
//            NSLog(@"Title [%@]", );
//            NSLog(@"Message [%@]", );
            
            //[self performSelector:@selector(callObjectiveCFromJavascript)];
        }
        
        
        
        return NO;
    }
    
    return YES;
}

- (void)callObjectiveCFromJavascript {
    NSLog(@"called objective-c from javascript");
}


@end
