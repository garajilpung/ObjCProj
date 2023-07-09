//
//  AnimationViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2021/01/21.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController () {
    NSUInteger pY1;
    NSUInteger pY2;
}

@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *con_lb2Y;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    pY1 = _lb1.frame.origin.y;
    pY2 = _con_lb2Y.constant;
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    pY1 = _lb1.frame.origin.y;
}

#pragma mark Button Method

- (IBAction)onBtn_FReset:(id)sender {
    CGRect frame = _lb1.frame;
    
    [_lb1 setFrame:CGRectMake(frame.origin.x, pY1, frame.size.width, frame.size.height)];
}

- (IBAction)onBtn_CReset:(id)sender {
    _con_lb2Y.constant = pY2;
    [self.view layoutIfNeeded];
}
- (IBAction)onBtn_FAni:(id)sender {
    [UIView animateWithDuration:2 animations:^{
        CGRect frame = self->_lb1.frame;
        
        [self->_lb1 setFrame:CGRectMake(frame.origin.x, frame.origin.y +200, frame.size.width, frame.size.height)];
    }];
}
- (IBAction)onBtn_CAni:(id)sender {
    [UIView animateWithDuration:2 animations:^{
        self->_con_lb2Y.constant = self->pY2 + 200;
        [self.view layoutIfNeeded];
    }];
}

@end
