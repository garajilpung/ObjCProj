//
//  LayoutViewController.m
//  test
//
//  Created by suhyup02 on 28/01/2020.
//  Copyright © 2020 aa. All rights reserved.
//

#import "LayoutViewController.h"

@interface LayoutViewController ()

@end

@implementation LayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *p[9];
    
    for(int i =0; i <9; i++) {
        p[i] = [UILabel new];
        p[i].translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.view addSubview:p[i]];
        
        NSLayoutConstraint *lbWidth = [NSLayoutConstraint constraintWithItem:p[i] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:80];
        NSLayoutConstraint *lbHeight = [NSLayoutConstraint constraintWithItem:p[i] attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:80];
        
        [p[i] addConstraints:[NSArray arrayWithObjects: lbWidth, lbHeight, nil]];
    }
    
    // 좌상단 index = 0;
    NSLayoutConstraint *px = [NSLayoutConstraint constraintWithItem:p[0] attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeft multiplier:1.f constant:0];
    NSLayoutConstraint *py = [NSLayoutConstraint constraintWithItem:p[0] attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.f constant:0];
    
    [p[0] setBackgroundColor:[UIColor redColor]];
    [self.view addConstraints:[NSArray arrayWithObjects:px, py, nil]];

    //    // 가운데상단 index = 1;
    px = [NSLayoutConstraint constraintWithItem:p[1] attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0];
    py = [NSLayoutConstraint constraintWithItem:p[1] attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.f constant:0];

    [p[1] setBackgroundColor:[UIColor blueColor]];
    [self.view addConstraints:[NSArray arrayWithObjects:px, py, nil]];

    // 우상단 index = 2;
    px = [NSLayoutConstraint constraintWithItem:p[2] attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeRight multiplier:1.f constant:0];
    py = [NSLayoutConstraint constraintWithItem:p[2] attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.f constant:0];

    [p[2] setBackgroundColor:[UIColor greenColor]];
    [self.view addConstraints:[NSArray arrayWithObjects:px, py, nil]];

    // 좌중단 index = 3;
    px = [NSLayoutConstraint constraintWithItem:p[3] attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeft multiplier:1.f constant:0];
    py = [NSLayoutConstraint constraintWithItem:p[3] attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0];
    
    [p[3] setBackgroundColor:[UIColor yellowColor]];
    [self.view addConstraints:[NSArray arrayWithObjects:px, py, nil]];

    // 가운데중단 index = 4;
    px = [NSLayoutConstraint constraintWithItem:p[4] attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0];
    py = [NSLayoutConstraint constraintWithItem:p[4] attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0];
    
    [p[4] setBackgroundColor:[UIColor grayColor]];
    [self.view addConstraints:[NSArray arrayWithObjects:px, py, nil]];
    
    // 우중단 index = 5;
    px = [NSLayoutConstraint constraintWithItem:p[5] attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeRight multiplier:1.f constant:0];
    py = [NSLayoutConstraint constraintWithItem:p[5] attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0];
    
    [p[5] setBackgroundColor:[UIColor cyanColor]];
    [self.view addConstraints:[NSArray arrayWithObjects:px, py, nil]];
    
    // 좌하단 index = 6;
    px = [NSLayoutConstraint constraintWithItem:p[6] attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeft multiplier:1.f constant:0];
    py = [NSLayoutConstraint constraintWithItem:p[6] attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.f constant:0];
    
    [p[6] setBackgroundColor:[UIColor magentaColor]];
    [self.view addConstraints:[NSArray arrayWithObjects:px, py, nil]];
    
    // 중하단 index = 7;
    px = [NSLayoutConstraint constraintWithItem:p[7] attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0];
    py = [NSLayoutConstraint constraintWithItem:p[7] attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.f constant:0];
    
    [p[7] setBackgroundColor:[UIColor orangeColor]];
    [self.view addConstraints:[NSArray arrayWithObjects:px, py, nil]];
    
    // 우하단 index = 8;
    px = [NSLayoutConstraint constraintWithItem:p[8] attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeRight multiplier:1.f constant:0];
    py = [NSLayoutConstraint constraintWithItem:p[8] attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.f constant:0];
    
    [p[8] setBackgroundColor:[UIColor brownColor]];
    [self.view addConstraints:[NSArray arrayWithObjects:px, py, nil]];
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
