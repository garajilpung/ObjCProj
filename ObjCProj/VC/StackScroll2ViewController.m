//
//  StackScroll2ViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2021/01/06.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import "StackScroll2ViewController.h"

@interface StackScroll2ViewController () {
    UIStackView *svSubView;
    
    UIView *p1;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrMain;

@end

@implementation StackScroll2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    svSubView = [[UIStackView alloc] initWithFrame:CGRectZero];
    svSubView.translatesAutoresizingMaskIntoConstraints = false;
    svSubView.axis = UILayoutConstraintAxisVertical;
    svSubView.distribution = UIStackViewDistributionFill;
    svSubView.alignment = UIStackViewAlignmentFill;
    [svSubView setBackgroundColor:UIColor.yellowColor];
    
    [_scrMain addSubview:svSubView];
    
    [_scrMain setBackgroundColor:[UIColor blueColor]];
    
    NSLayoutConstraint *left = [svSubView.leadingAnchor constraintEqualToAnchor:_scrMain.leadingAnchor]; [left setActive:YES];
    NSLayoutConstraint *top = [svSubView.topAnchor constraintEqualToAnchor:_scrMain.topAnchor]; [top setActive:YES];
    NSLayoutConstraint *bottom = [svSubView.bottomAnchor constraintEqualToAnchor:_scrMain.bottomAnchor]; [bottom setActive:YES];
    NSLayoutConstraint *right = [svSubView.trailingAnchor constraintEqualToAnchor:_scrMain.trailingAnchor]; [right setActive:YES];
    NSLayoutConstraint *width3 = [svSubView.widthAnchor constraintEqualToAnchor:_scrMain.widthAnchor]; [width3 setActive:YES];
    
    
    for(int i =0;i <20; i++) {
        UIView *p1 = [[UIView alloc] initWithFrame:CGRectZero];
        p1.translatesAutoresizingMaskIntoConstraints = false;
        [p1 setBackgroundColor:[UIColor colorWithRed:(i*10/255.0f) green:0 blue:0 alpha:1]];
    
        [svSubView addArrangedSubview:p1];
    
        if(@available(iOS 11.0, *)) {
            NSLayoutConstraint *height = [p1.heightAnchor constraintEqualToConstant:80.0f]; [height setActive:YES];
        }else {
             NSLayoutConstraint *lHeight = [NSLayoutConstraint constraintWithItem:p1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:80];
            [p1 addConstraint:lHeight];
        }
    }
    
    
    NSLog(@"svSubView rect %f", svSubView.frame.size.height);
    NSLog(@"_scrMain rect %f", _scrMain.frame.size.height);
    
    if(@available(iOS 11.0, *)) {
        NSLayoutConstraint *height = [svSubView.heightAnchor constraintEqualToConstant:20*80]; [height setActive:YES];
    }else {
        NSLayoutConstraint *lHeight = [NSLayoutConstraint constraintWithItem:svSubView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:20*80];
        [svSubView addConstraint:lHeight];
    }
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
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
