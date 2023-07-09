//
//  GDCViewController.m
//  test
//
//  Created by suhyup02 on 2019. 4. 12..
//  Copyright © 2019년 aa. All rights reserved.
//

#import "GDCViewController.h"

@interface GDCViewController ()

@end

@implementation GDCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self queue1];
    
    [self queue2];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// 직별큐
- (void) queue1 {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"Done: %d", 1);
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"Done: %d", 2);
    });
    // 여기서 queue에 쌓인 태스크가 전부 끝날때까지 메인스레드는 대기한다.
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"Done: %d", 3);
    });
}

// 병렬큐
- (void) queue2 {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"Done: %d", 1);
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"Done: %d", 2);
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"Done: %d", 3);
    });
    
    // 이지점에서 쌓인큐를 종료됨과 동시에 호출된다.
    // dispatch_group_wait은 포함 되지 않는다.
    dispatch_group_notify(group, queue, ^{
        NSLog(@"All tasks are done!");
    });
    
    NSLog(@"do something...");
    [NSThread sleepForTimeInterval:1];
    NSLog(@"waiting...");
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    // 여기서 약간 기다려주지 안흥면 notify처리전에 프로그램의 끝나버리므로..약간 딜레이를
    [NSThread sleepForTimeInterval:1];
}
@end
