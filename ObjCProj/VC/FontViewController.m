//
//  FontViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2021/02/16.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import "FontViewController.h"
#import <WebKit/WebKit.h>

@interface FontViewController () {
    WKWebView *wk;
}


@property (weak, nonatomic) IBOutlet UILabel *lbDesc;

@end

@implementation FontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]
                                             init];
    
    WKUserContentController *controller = [[WKUserContentController alloc]
                                           init];
    
    configuration.userContentController = controller;
    
    wk = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
    [wk setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:wk];
    
    
    // 기존에는 TopLayoutGuide나 bottomLayoutGuide에 연결해서 사용했으나
    // 11 이후에는 safeArea를 사용할 경우에 아래와 같이 처리해야 한다.
    if(@available(iOS 11.0, *)) {
        UILayoutGuide *safearea =  self.view.safeAreaLayoutGuide;
        
        NSLayoutConstraint *left = [wk.leadingAnchor constraintEqualToAnchor:safearea.leadingAnchor constant:20.0f]; [left setActive:YES];
        NSLayoutConstraint *top = [wk.topAnchor constraintEqualToAnchor:safearea.topAnchor constant:20.0]; [top setActive:YES];
        NSLayoutConstraint *right = [wk.trailingAnchor constraintEqualToAnchor:safearea.trailingAnchor constant:20.0f]; [right setActive:YES];
        NSLayoutConstraint *height = [wk.heightAnchor constraintEqualToConstant:40.0f]; [height setActive:YES];
    }else {
        NSLayoutConstraint *lTop1 = [NSLayoutConstraint constraintWithItem:wk attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.f constant:0];
        NSLayoutConstraint *lLeft1 = [NSLayoutConstraint constraintWithItem:wk attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.f constant:0];
        NSLayoutConstraint *lRight1 = [NSLayoutConstraint constraintWithItem:wk attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.f constant:0];
        NSLayoutConstraint *lHeight1 = [NSLayoutConstraint constraintWithItem:wk attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:40];
        
        [self.view addConstraints:[NSArray arrayWithObjects: lTop1, lLeft1, lRight1, lHeight1, nil]];
    }
    
    NSURL *url = [NSURL URLWithString:@"https://garajilpung.synology.me/test/font.html"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    [wk loadRequest:req];
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
