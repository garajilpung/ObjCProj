//
//  SessionViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 21/02/2020.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "SessionViewController.h"

@interface SessionViewController ()<NSURLSessionDelegate, NSURLSessionTaskDelegate> {
    NSURLSession *mSession;
    NSURLSessionConfiguration *mCon;
    
    NSURLSessionTask *task;
}
@property (weak, nonatomic) IBOutlet UILabel *lbContent;

@end

@implementation SessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mCon = [NSURLSessionConfiguration defaultSessionConfiguration];
    mSession = [NSURLSession sessionWithConfiguration:mCon delegate:self delegateQueue:nil];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://garajilpung.synology.me/test/em.zip"]];
    task = [mSession dataTaskWithRequest:req];
    [task resume];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma NSURLSessionDeletate
- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(nullable NSError *)error {
    NSLog(@"err %@", error.description);
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
//    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
//        if([challenge.protectionSpace.host isEqualToString:@"DomainNameOfServer.io"]){
//            NSURLCredential * credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
//            completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
//        }
//    }
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session {
    
}

#pragma NSURLSessionTaskDelegate
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task willBeginDelayedRequest:(NSURLRequest *)request completionHandler:(void (^)(NSURLSessionDelayedRequestDisposition disposition, NSURLRequest * _Nullable newRequest))completionHandler {
    
    
}

- (void)URLSession:(NSURLSession *)session taskIsWaitingForConnectivity:(NSURLSessionTask *)task {
    
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task willPerformHTTPRedirection:(NSHTTPURLResponse *)response newRequest:(NSURLRequest *)request completionHandler:(void (^)(NSURLRequest * _Nullable))completionHandler {
    
    
}

- (IBAction)onBtnSend:(id)sender {
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://garajilpung.synology.me/test/em.zip"]];
    
    NSURLSessionDataTask *dTask = [session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
        
        NSLog(@"ffff %lu", (unsigned long)data.length);
    }] ;
    [dTask resume];
    
    
}
- (IBAction)onBtnNoti:(id)sender {
}
@end
