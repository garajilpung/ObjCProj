//
//  ModalViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 11/03/2020.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "ModalViewController.h"
#import "ModalTestViewController.h"

@interface ModalViewController () {
    UIActivityIndicatorView *activityView;
    UIView *loadingView;
    UILabel *loadingLabel;
    
    
    UIView *vLoading;
    UIImageView *imgView;
    
    
    UIActivityIndicatorView *activityAllView;
    UIView *loadingAllView;
    UILabel *loadingAllLabel;
    
}

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    loadingView = [[UIView alloc] initWithFrame:CGRectMake(75, 155, 170, 170)];
    loadingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    loadingView.clipsToBounds = YES;
    loadingView.layer.cornerRadius =10.0;
    
    activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.frame = CGRectMake(65, 40, activityView.bounds.size.width, activityView.bounds.size.height);
    
    [loadingView addSubview:activityView];
    loadingView.center = self.view.center;
    
    loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 115,130,22)];
    [loadingLabel setBackgroundColor:[UIColor clearColor]];
    loadingLabel.textColor = [UIColor whiteColor];
    loadingLabel.adjustsFontSizeToFitWidth = YES;
    loadingLabel.textAlignment = NSTextAlignmentCenter;
    loadingLabel.text = @"Loading ....";
    [loadingView addSubview:loadingLabel];
    
    loadingAllView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    loadingAllView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    loadingAllView.clipsToBounds = YES;
    loadingAllView.layer.cornerRadius =10.0;
    
    activityAllView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityAllView.frame = CGRectMake(65, 40, activityAllView.bounds.size.width, activityAllView.bounds.size.height);
    
    [loadingAllView addSubview:activityAllView];
    loadingView.center = self.view.center;
    
    loadingAllLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 115,130,22)];
    [loadingAllLabel setBackgroundColor:[UIColor clearColor]];
    loadingAllLabel.textColor = [UIColor whiteColor];
    loadingAllLabel.adjustsFontSizeToFitWidth = YES;
    loadingAllLabel.textAlignment = NSTextAlignmentCenter;
    loadingAllLabel.text = @"Loading ....";
    [loadingAllLabel addSubview:loadingAllView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)startAnimation {
    [self.view addSubview:loadingView];
    [activityView startAnimating];
}

- (void)stopAnimation {
    [activityView stopAnimating];
    [loadingView removeFromSuperview];
}

- (IBAction)onBtn:(id)sender {
    ModalTestViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"mdTestVC"];
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

- (void)startAnimation2:(UIView*)pTarget {
    if(vLoading == nil) {
        vLoading = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 60)];
        [vLoading setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
        
        imgView = [[UIImageView alloc] init];

        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for(int i =1; i <24; i++) {
            [arr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"loading_%02d", i]]];
        }
        [imgView setAnimationImages:arr];
        [imgView setFrame:CGRectMake(0, 0, 80, 80)];
        [vLoading addSubview:imgView];
        
        
        [pTarget addSubview:vLoading];
        vLoading.center = pTarget.center;
        imgView.center = vLoading.center;
        
        [imgView startAnimating];
    }
}

- (void)stopAnimation2:(UIView*)pTarget {
    [imgView stopAnimating];
    [imgView removeFromSuperview];
    [vLoading removeFromSuperview];
    vLoading = nil;
    imgView = nil;
}

- (void)startAnimation3 {
    UIView* view = [[[UIApplication sharedApplication] delegate] window];
    
    if(vLoading == nil) {
        vLoading = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 60)];
        [vLoading setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
        
        imgView = [[UIImageView alloc] init];
        
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for(int i =1; i <24; i++) {
            [arr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"loading_%02d", i]]];
        }
        [imgView setAnimationImages:arr];
        [imgView setFrame:CGRectMake(0, 0, 80, 80)];
        [vLoading addSubview:imgView];
        
        
        [view addSubview:vLoading];
        vLoading.center = view.center;
        imgView.center = vLoading.center;
        
        [imgView startAnimating];
    }
}

- (void)stopAnimation3 {
    [imgView stopAnimating];
    [vLoading removeFromSuperview];
    imgView = nil;
    vLoading = nil;
}

- (IBAction)onBtnStart:(id)sender {
    [self startAnimation];
//    [self startAnimation2:self.view];
//    [self startAnimation3];
}

- (IBAction)onBtnStop:(id)sender {
    [self stopAnimation];
//    [self stopAnimation2:self.view];
//    [self stopAnimation3];
}

- (NSString*) sendPost1:(NSString*)pURL withData:(NSDictionary*)pDic {
    NSString* parameter = @"";
    __block NSString *ret = nil;
    
    [self startAnimation];
    
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    
    // request URL 설정
    NSURL *url = url = [NSURL URLWithString: pURL];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    for(NSString* key in pDic.allKeys) {
        parameter = [NSString stringWithFormat:@"%@&%@=%@", parameter, key, pDic[key] ];
    }
    
    // UTF8 인코딩을 사용하여 POST 문자열 매개 변수를 데이터로 변환
    NSData *postData = [parameter dataUsingEncoding:NSUTF8StringEncoding];
    [urlRequest setHTTPBody:postData];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data!=nil)
        {
            NSString *str = [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSUTF8StringEncoding];
            ret = [str copy];
            NSLog(@"post2 response %@", str);
        }
        else
        {
            NSLog(@"error");
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           [self stopAnimation];
        });
    }];
    
    // request 종료
    [dataTask resume];
    
    return ret;
}

- (NSString*) sendPost2:(NSString*)pURL withData:(NSDictionary*)pDic {
    NSString* parameter = @"";
    __block NSString *ret = nil;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startAnimation];
    });
    
    
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    
    // request URL 설정
    NSURL *url = url = [NSURL URLWithString: pURL];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    for(NSString* key in pDic.allKeys) {
        parameter = [NSString stringWithFormat:@"%@&%@=%@", parameter, key, pDic[key] ];
    }
    
    // UTF8 인코딩을 사용하여 POST 문자열 매개 변수를 데이터로 변환
    NSData *postData = [parameter dataUsingEncoding:NSUTF8StringEncoding];
    [urlRequest setHTTPBody:postData];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data!=nil)
        {
            NSString *str = [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSUTF8StringEncoding];
            ret = [str copy];
            NSLog(@"post2 response %@", str);
        }
        else
        {
            NSLog(@"error");
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           [self stopAnimation];
        });
        
    }];
    
    // request 종료
    [dataTask resume];
    
    
    return ret;
    
}

- (NSString*) sendPost3:(NSString*)pURL withData:(NSDictionary*)pDic {
    NSString* parameter = @"";
    __block NSString *ret = nil;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startAnimation];
    });
    
    
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    
    // request URL 설정
    NSURL *url = url = [NSURL URLWithString: pURL];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    for(NSString* key in pDic.allKeys) {
        parameter = [NSString stringWithFormat:@"%@&%@=%@", parameter, key, pDic[key] ];
    }
    
    // UTF8 인코딩을 사용하여 POST 문자열 매개 변수를 데이터로 변환
    NSData *postData = [parameter dataUsingEncoding:NSUTF8StringEncoding];
    [urlRequest setHTTPBody:postData];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);;
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data!=nil)
        {
            NSString *str = [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSUTF8StringEncoding];
            ret = [str copy];
            NSLog(@"post2 response %@", str);
        }
        else
        {
            NSLog(@"error");
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           [self stopAnimation];
        });
        
        dispatch_semaphore_signal(semaphore);
    }];
    
    // request 종료
    [dataTask resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return ret;
    
}

- (IBAction)onBtnSend:(id)sender {
    
    NSDate* date = [NSDate date];
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyyMMddhhmmss"];
    NSString *regDate = [formatter stringFromDate:date];
    
    NSDictionary *dic = @{@"os":@"i",
                          @"id":@"ksos73",
                          @"regTime":regDate};
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self sendPost1:@"https://garajilpung.synology.me/php/post_urlencoding.php" withData:dic];
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self sendPost1:@"https://garajilpung.synology.me/php/post_urlencoding.php" withData:dic];
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self sendPost1:@"https://garajilpung.synology.me/php/post_urlencoding.php" withData:dic];
    });
}

- (IBAction)onBtnSend2:(id)sender {
    NSDate* date = [NSDate date];
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyyMMddhhmmss"];
    NSString *regDate = [formatter stringFromDate:date];
    
    NSDictionary *dic = @{@"os":@"i",
                          @"id":@"ksos73",
                          @"regTime":regDate};
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self sendPost2:@"https://garajilpung.synology.me/php/post_urlencoding.php" withData:dic];
    });
}

- (IBAction)onBtnAllStart:(id)sender {
    [self.view addSubview:loadingAllView];
    [self.view bringSubviewToFront:loadingAllView];
    [activityAllView startAnimating];
}

- (IBAction)onBtnAllStop:(id)sender {
//    [self.activityAllView stopAnimating];
//    [self.loadingAllView removeFromSuperview];
}

- (IBAction)onbtn44:(id)sender {
    ModalTestViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"mdTestVC"];

    ModalTestViewController *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"mdTestVC"];
    
    [self.navigationController pushViewController:vc animated:NO];
    
    [self.navigationController pushViewController:vc2 animated:NO];
}
@end
