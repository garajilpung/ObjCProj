//
//  ShakeViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2022/01/19.
//  Copyright © 2022 garajilpung. All rights reserved.
//

#import "ShakeViewController.h"

@interface ShakeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;

@end

@implementation ShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _lb1.text = @"모션 준비중";
    _lb2.text = @"모션 준비중";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Motion Event

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"모션 시작");
    if(motion == UIEventSubtypeMotionShake) {
        _lb1.text = @"흔들기 모션 중";
        _lb2.text = @"흔들기 모션 시작됨";
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"모션 종료");
    if(motion == UIEventSubtypeMotionShake) {
        NSLog(@"흔들기 종료");
        _lb1.text = @"흔들기 모션 종료";
    }
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"모션 취소");
    if(motion == UIEventSubtypeMotionShake) {
        NSLog(@"흔들기 취소");
        _lb1.text = @"흔들기 모션 취소";
    }
}

@end
