//
//  StackViewController.m
//  ObjCProj
//
//  Created by SMG on 2020/09/16.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "StackViewController.h"

@interface StackViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lb01;
@property (weak, nonatomic) IBOutlet UILabel *lb02;
@property (weak, nonatomic) IBOutlet UILabel *lb03;
@property (weak, nonatomic) IBOutlet UILabel *lb04;
@property (weak, nonatomic) IBOutlet UILabel *lb05;
@end

@implementation StackViewController

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
- (IBAction)onBtn01:(id)sender {
    [_lb01 setHidden:YES];
    [_lb02 setHidden:NO];
    [_lb03 setHidden:NO];
    [_lb04 setHidden:NO];
    [_lb05 setHidden:NO];
}

- (IBAction)onBtn02:(id)sender {
    [_lb01 setHidden:NO];
    [_lb02 setHidden:YES];
    [_lb03 setHidden:NO];
    [_lb04 setHidden:NO];
    [_lb05 setHidden:NO];
}

- (IBAction)onBtn03:(id)sender {
    [_lb01 setHidden:NO];
    [_lb02 setHidden:NO];
    [_lb03 setHidden:YES];
    [_lb04 setHidden:NO];
    [_lb05 setHidden:NO];
}

- (IBAction)onBtn04:(id)sender {
    [_lb01 setHidden:NO];
    [_lb02 setHidden:NO];
    [_lb03 setHidden:NO];
    [_lb04 setHidden:YES];
    [_lb05 setHidden:NO];
}

- (IBAction)onBtn05:(id)sender {
    [_lb01 setHidden:NO];
    [_lb02 setHidden:NO];
    [_lb03 setHidden:NO];
    [_lb04 setHidden:NO];
    [_lb05 setHidden:YES];
}

- (IBAction)onBtn06:(id)sender {
    [_lb01 setHidden:NO];
    [_lb02 setHidden:NO];
    [_lb03 setHidden:NO];
    [_lb04 setHidden:NO];
    [_lb05 setHidden:NO];
}

@end
