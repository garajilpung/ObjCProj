//
//  ModalTestViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 11/03/2020.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "ModalTestViewController.h"

@interface ModalTestViewController () {
    
}

@end

@implementation ModalTestViewController

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
- (IBAction)onBtn:(id)sender {
    ModalTestViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"mdTestVC"];
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

- (IBAction)onBtnClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)onBtn1:(id)sender {
    self.view.userInteractionEnabled = false;
}


- (IBAction)onBtn2:(id)sender {
    self.view.userInteractionEnabled = true;
}

- (IBAction)onBtn3:(id)sender {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    window.userInteractionEnabled = false;
    
    
}

- (IBAction)onBtn4:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        window.userInteractionEnabled = false;
    }];
}

@end
