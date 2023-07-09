//
//  LayerViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2020/10/07.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "LayerViewController.h"

@interface LayerViewController ()

@property (weak, nonatomic) IBOutlet UIView *v1;
@property (weak, nonatomic) IBOutlet UIView *v2;
@property (weak, nonatomic) IBOutlet UIView *v3;
@property (weak, nonatomic) IBOutlet UIView *v4;

@end

@implementation LayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIBezierPath *maskPath = [UIBezierPath
        bezierPathWithRoundedRect:_v1.bounds
        byRoundingCorners:(UIRectCornerTopLeft)
        cornerRadii:CGSizeMake(30, 30)
    ];

    CAShapeLayer *maskLayer = [CAShapeLayer layer];

    maskLayer.frame = _v1.bounds;
    maskLayer.path = maskPath.CGPath;

    _v1.layer.mask = maskLayer;
    
    
    maskPath = [UIBezierPath
                bezierPathWithRoundedRect:_v2.bounds
                byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                cornerRadii:CGSizeMake(30, 30)];
                
    maskLayer = [CAShapeLayer layer];

    maskLayer.frame = _v2.bounds;
    maskLayer.path = maskPath.CGPath;
                
     _v2.layer.mask = maskLayer;
    
    maskPath = [UIBezierPath
                bezierPathWithRoundedRect:_v3.bounds
                byRoundingCorners:(UIRectCornerBottomRight)
                cornerRadii:CGSizeMake(30, 30)];
                
    maskLayer = [CAShapeLayer layer];

    maskLayer.frame = _v3.bounds;
    maskLayer.path = maskPath.CGPath;
                
    _v3.layer.mask = maskLayer;
    
    maskPath = [UIBezierPath
                bezierPathWithRoundedRect:_v4.bounds
                byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                cornerRadii:CGSizeMake(30, 30)];
                
    maskLayer = [CAShapeLayer layer];

    maskLayer.frame = _v4.bounds;
    maskLayer.path = maskPath.CGPath;
                
    _v4.layer.mask = maskLayer;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onBtnNoti:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didOnReceive"
                                                        object:nil userInfo:@{@"title":@"title1"}];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didOnReceive"
                                                        object:nil userInfo:@{@"title":@"title2"}];
}
@end
