//
//  SingleViewController.m
//  test
//
//  Created by suhyup02 on 2019. 4. 18..
//  Copyright © 2019년 aa. All rights reserved.
//

#import "SingleViewController.h"
#import "OneView.h"
#import "TwoView.h"

@interface SingleViewController () <OneViewDeleage, TwoViewDeleage> {
    Boolean bFlag;
}
@property (weak, nonatomic) IBOutlet UIView *mView;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation SingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    bFlag = true;
    
    
    OneView *rootView = [[[NSBundle mainBundle] loadNibNamed:@"DummyView" owner:self options:nil] objectAtIndex:0];
    [rootView setBackgroundColor:[UIColor redColor]];
    [rootView setFrame:CGRectMake(0, 10, _mView.frame.size.width, _mView.frame.size.height -20)];
    rootView.delegate = self;
    
    [_mView setBackgroundColor:[UIColor yellowColor]];
    [_mView addSubview:rootView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)onBtn:(UIButton *)sender {
    
    UIView *conView = nil;
    
    if(bFlag) {
        conView = [[[NSBundle mainBundle] loadNibNamed:@"DummyView" owner:self options:nil] objectAtIndex:1];
        [conView setBackgroundColor:[UIColor grayColor]];
        [conView setFrame:CGRectMake(0, 10, _mView.frame.size.width, _mView.frame.size.height -20)];
        ((TwoView*)conView).delegate = self;
        bFlag = false;
    }else {
        conView = [[[NSBundle mainBundle] loadNibNamed:@"DummyView" owner:self options:nil] objectAtIndex:0];
        [conView setBackgroundColor:[UIColor redColor]];
        [conView setFrame:CGRectMake(0, 10, _mView.frame.size.width, _mView.frame.size.height -20)];
        ((OneView*)conView).delegate = self;
        bFlag = true;
    }
    
    for(UIView * view in _mView.subviews) {
        [view removeFromSuperview];
    }
    [_mView addSubview:conView];
}

- (void) changeOneViewText:(NSString*)lbText {
    
    [_btn setTitle:lbText forState:UIControlStateNormal];
}

- (void) changeTwoViewText:(NSString*)lbText {
    
    [_btn setTitle:lbText forState:UIControlStateNormal];
}
@end
