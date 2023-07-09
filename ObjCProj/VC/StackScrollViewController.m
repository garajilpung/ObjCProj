//
//  StackScrollViewController.m
//  ObjCProj
//
//  Created by SMG on 2020/09/16.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "StackScrollViewController.h"

@interface StackScrollViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lb06;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lb01Height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lb02Height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lb03Height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lb04Height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lb05Height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lb06Height;
@property (weak, nonatomic) IBOutlet UIStackView *svMainView;
@property (weak, nonatomic) IBOutlet UIScrollView *srvMainView;

@end

@implementation StackScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_svMainView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSArray *arr = self.svMainView.arrangedSubviews;
    NSLog(@"arr count : %lu", (unsigned long)arr.count);
    
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
    _lb01Height.constant = 20;
}

- (IBAction)onBtn02:(id)sender {
    _lb02Height.constant = 100;
}

- (IBAction)onBtn03:(id)sender {
    _lb03Height.constant = 60;
}

- (IBAction)onBtn04:(id)sender {
    _lb04Height.constant = 90;
}

- (IBAction)onBtn05:(id)sender {
    _lb05Height.constant = 200;
}

- (IBAction)onBtn06:(id)sender {
    _lb06Height.constant = 160;
}

- (IBAction)onBtnAll:(id)sender {
    _lb01Height.constant = 40;
    _lb02Height.constant = 100;
    _lb03Height.constant = 80;
    _lb04Height.constant = 160;
    _lb05Height.constant = 130;
    _lb06Height.constant = 20;
}
- (IBAction)onBtnInsert:(id)sender {
//    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.srvMainView.frame.size.width , 80)];
    UIView *v = [UIView new];
    NSLayoutConstraint *lHeight = [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:80];
    [v setBackgroundColor:[UIColor orangeColor]];
    
    [v addConstraint:lHeight];
    
    [_svMainView addArrangedSubview:v];
    
    [UIView animateWithDuration:0.0 animations:^{
        NSArray *arr = self.svMainView.arrangedSubviews;
        NSLog(@"arr count : %lu", (unsigned long)arr.count);
        
        [self.svMainView layoutIfNeeded];
        [self.srvMainView setContentSize:CGSizeMake(self.srvMainView.contentSize.width, self.srvMainView.contentSize.height+80)];
    }];
    
}
@end
