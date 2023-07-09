//
//  RootViewController.m
//  test
//
//  Created by suhyup02 on 2019. 3. 18..
//  Copyright © 2019년 aa. All rights reserved.
//

#import "RootViewController.h"
#import <WebKit/WebKit.h>

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    if (@available(iOS 12.0, *)) {
        [WKWebsiteDataStore.defaultDataStore.httpCookieStore getAllCookies:^(NSArray<NSHTTPCookie *> * _Nonnull result) {
           for (NSHTTPCookie *cookie in result) {
               [WKWebsiteDataStore.defaultDataStore.httpCookieStore deleteCookie:cookie completionHandler:nil];
           }
        }];
    }else {
        // 원하는 캐쉬데이터 삭제
        NSSet* nSet= [NSSet setWithArray:@[WKWebsiteDataTypeCookies, WKWebsiteDataTypeDiskCache, WKWebsiteDataTypeMemoryCache]];
        NSDate *nDate=[NSDate dateWithTimeIntervalSince1970:0];
        [WKWebsiteDataStore.defaultDataStore removeDataOfTypes:nSet modifiedSince:nDate completionHandler:^{
            //delete callback
        }];
        
        //모든 캐시데이터 삭제
//        [WKWebsiteDataStore.defaultDataStore fetchDataRecordsOfTypes:WKWebsiteDataStore.allWebsiteDataTypes completionHandler:^(NSArray<WKWebsiteDataRecord *> * records) {
//            for(WKWebsiteDataRecord *record in records){
//                [WKWebsiteDataStore.defaultDataStore removeDataOfTypes:record.dataTypes forDataRecords:@[record] completionHandler:^{
//                    //delete callback
//                }];
//            }
//        }];
    }

    //UserAgent 설정
    NSString *userAgent = [NSMutableString stringWithFormat:@"Mozilla/5.0 (iPhone; CPU iPhone OS %@ like Mac OS X) AppleWebKit/604.5.6 (KHTML, like Gecko) Mobile/15D100", @"11"];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent": userAgent}];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
//    NSLog(@" %0.2f, %0.2f", size.width, size.height);
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
//    NSLog(@"NavigationController [%@]", NSStringFromClass(self.topViewController.class));
    
    
    return self.topViewController.supportedInterfaceOrientations;
}

- (BOOL)shouldAutorotate
{
//    NSLog(@"NavigationController [%@]", NSStringFromClass(self.topViewController.class));
    
    return self.topViewController.shouldAutorotate;
}

@end
