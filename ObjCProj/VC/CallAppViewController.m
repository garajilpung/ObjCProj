//
//  CallAppViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2020/11/25.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "CallAppViewController.h"

@interface CallAppViewController ()

@end

@implementation CallAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    
    // 내가 호출할 앱에 대한 스키마를 내앱 내부에 추가해야만 적용된다.
    // 프로젝트의 info 에서 LSApplicationQueriesSchemes = Array 해서 스키마들을 추가한다.
    
    //하이브리드 앱에서 웹뷰가 있다면 등록하지 않고도 사용할 수 있지만(UIWebView 에서만 가능)
    //WKWebView에서는 tel, sms, mailto, facetime등의 기본 기능도 따로 추가해야 한다.(scheme 처리를 한다.)
    
    //WebView에서는 scheme 체크만 가능하면 상대방 앱에 대한 처리가 가능해진다.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onBtnPSMB:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"suhyuppsmb://"];
    
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        NSLog(@"앱이 존재 합니다.");
        [[UIApplication sharedApplication] openURL:url options:@{@"":@""} completionHandler:^(BOOL success) {
            
        }];
    }else {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"알림" message:@"수협 개인 앱이 없습니다." preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* ok1 = [UIAlertAction
                              actionWithTitle:@"확인"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action)
                              {
                                  [alertVC dismissViewControllerAnimated:YES completion:nil];
                                  
                              }];
        [alertVC addAction:ok1];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }
}

- (IBAction)onBtnBSMB:(id)sender {
    NSURL *url = [NSURL URLWithString:@"suhyupbsmb://"];
    
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        NSLog(@"앱이 존재 합니다.");
        [[UIApplication sharedApplication] openURL:url options:@{@"":@""} completionHandler:^(BOOL success) {
            
        }];
    }else {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"알림" message:@"수협 기업 앱이 없습니다." preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* ok1 = [UIAlertAction
                              actionWithTitle:@"확인"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action)
                              {
                                  [alertVC dismissViewControllerAnimated:YES completion:nil];
                                  
                              }];
        [alertVC addAction:ok1];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }
}

- (IBAction)onBtnPESMB:(id)sender {
    NSURL *url = [NSURL URLWithString:@"suhyuppesmb://"];
    
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        NSLog(@"앱이 존재 합니다.");
        [[UIApplication sharedApplication] openURL:url options:@{@"":@""} completionHandler:^(BOOL success) {
            
        }];
    }else {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"알림" message:@"헤이뱅 앱이 없습니다." preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* ok1 = [UIAlertAction
                              actionWithTitle:@"확인"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action)
                              {
                                  [alertVC dismissViewControllerAnimated:YES completion:nil];
                                  
                              }];
        [alertVC addAction:ok1];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }
}
@end
