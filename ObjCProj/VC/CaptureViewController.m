//
//  CaptureViewController.m
//  test
//
//  Created by suhyup02 on 2018. 3. 5..
//  Copyright © 2018년 aa. All rights reserved.
//

#import "CaptureViewController.h"
#import <AVFoundation/AVFoundation.h>   //프레임워크입니다. 추가해주세요

NSString *kScreenRecordingDetectorRecordingStatusChangedNotification = @"kScreenRecordingDetectorRecordingStatusChangedNotification";


@interface CaptureViewController ()

@end

@implementation CaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(funcCapture) name:kScreenRecordingDetectorRecordingStatusChangedNotification object:nil];
    
    
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationUserDidTakeScreenshotNotification
                                                      object:nil
                                                       queue:mainQueue
                                                  usingBlock:^(NSNotification *note) {
                                                      self.title = @"캡쳐 했음";
                                                  }];
    
    NSLog(@"캡쳐 화면");
    
    NSLog(@"화면 사이즈 : %0.2f %0.2f", self.view.bounds.size.width , self.view.bounds.size.height);
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
- (IBAction)onBtnBack:(id)sender {
   [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)funcCapture {
    NSLog(@"ccw");
}
- (IBAction)onBtnCapture:(id)sender {
    [self getImageWithView:self.view];
}

- (UIImage *) getImageWithView:(UIView*)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, [UIScreen mainScreen].scale);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

@end
