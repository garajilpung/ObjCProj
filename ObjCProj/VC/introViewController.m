//
//  introViewController.m
//  test
//
//  Created by suhyup02 on 2019. 4. 15..
//  Copyright © 2019년 aa. All rights reserved.
//

#import "introViewController.h"

@interface introViewController () {
 
    CGFloat mRaonTop;
    CGFloat mAriTop;
    CGFloat mAraTop;
    
    CGFloat mRaonBottom;
    CGFloat mAriBottom;
    CGFloat mAraBottom;
}
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbSubTitle;

@property (weak, nonatomic) IBOutlet UIImageView *imgRaon1;
@property (weak, nonatomic) IBOutlet UIImageView *imgRaon2;
@property (weak, nonatomic) IBOutlet UIImageView *imgRaon3;

@property (weak, nonatomic) IBOutlet UIImageView *imgAri1;
@property (weak, nonatomic) IBOutlet UIImageView *imgAri2;
@property (weak, nonatomic) IBOutlet UIImageView *imgAri3;

@property (weak, nonatomic) IBOutlet UIImageView *imgAra1;
@property (weak, nonatomic) IBOutlet UIImageView *imgAra2;
@property (weak, nonatomic) IBOutlet UIImageView *imgAra3;


@end

@implementation introViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _lbTitle.hidden = YES;
    _lbSubTitle.hidden = YES;
    
    
    _imgRaon1.hidden = YES;
    _imgRaon2.hidden = YES;
    _imgRaon3.hidden = YES;
    
    _imgAri1.hidden = YES;
    _imgAri2.hidden = YES;
    _imgAri3.hidden = YES;
    
    _imgAra1.hidden = YES;
    _imgAra2.hidden = YES;
    _imgAra3.hidden = YES;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    [self animationRaon];
}

- (void) animationRaon {
    mRaonTop = 0;
    [_imgRaon1 setFrame:CGRectMake(_imgRaon1.frame.origin.x, _imgRaon3.frame.origin.y, _imgRaon1.frame.size.width, _imgRaon1.frame.size.height)];
    
    
    _imgRaon3.hidden = NO;
    _imgRaon1.hidden = NO;
    
    [UIView animateWithDuration:0.18
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [_imgRaon1 setFrame:CGRectMake(_imgRaon1.frame.origin.x, mRaonTop -10, _imgRaon1.frame.size.width, _imgRaon1.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         if(finished) {
                             
                             
                             [UIView animateWithDuration:0.18
                                     delay:0.0
                                     options:UIViewAnimationOptionCurveEaseOut
                                     animations:^{
                                         [_imgRaon1 setFrame:CGRectMake(_imgRaon1.frame.origin.x, mRaonTop, _imgRaon1.frame.size.width, _imgRaon1.frame.size.height)];
                                         
                                         UIImage *img = [UIImage imageNamed:@"ch_raon_sh2"];
                                         
                                         [_imgRaon3 setFrame:CGRectMake(_imgRaon3.frame.origin.x + 12, _imgRaon3.frame.origin.y, img.size.width, img.size.height)];
                                     }
                                     completion:^(BOOL finished){
                                         NSLog(@"Done!");
                                         if(finished) {
                                             [_imgRaon3 setImage:[UIImage imageNamed:@"ch_raon_sh2"]];
                                             
                                             _imgRaon2.hidden = NO;
                                             [_imgRaon2 setAlpha:0.0f];
                                             
                                             [UIView animateWithDuration:0.08
                                                                   delay:0.0
                                                                 options:UIViewAnimationOptionCurveEaseOut
                                                              animations:^{
                                                                  [_imgRaon2 setAlpha:1.0f];
                                                              }
                                                              completion:^(BOOL finished){
                                                                  NSLog(@"Done!");
                                                                  if(finished) {
                                                                     
                                                                      [self animateAri];
                                                                  }
                                                                  
                                                              }];
                                         }
                                         
                                     }];
                         }
                         
                     }];
}

- (void)animateAri {
    mAriTop = -4;
    CGPoint cen = _imgAri3.center;
    
    [_imgAri1 setFrame:CGRectMake(_imgAri1.frame.origin.x, _imgAri3.frame.origin.y, _imgAri1.frame.size.width, _imgAri1.frame.size.height)];
    
    _imgAri3.hidden = NO;
    _imgAri1.hidden = NO;
    
    [UIView animateWithDuration:0.18
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [_imgAri1 setFrame:CGRectMake(_imgAri1.frame.origin.x, mAriTop -10, _imgAri1.frame.size.width, _imgAri1.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         if(finished) {
                             
                             
                             [UIView animateWithDuration:0.18
                                                   delay:0.0
                                                 options:UIViewAnimationOptionCurveEaseOut
                                              animations:^{
                                                  [_imgAri1 setFrame:CGRectMake(_imgAri1.frame.origin.x, mAriTop, _imgAri1.frame.size.width, _imgAri1.frame.size.height)];
                                                  
                                                  UIImage *img = [UIImage imageNamed:@"ch_ari_sh2"];
                                                  
                                                  [_imgAri3 setFrame:CGRectMake(_imgAri3.frame.origin.x, _imgAri3.frame.origin.y, img.size.width, img.size.height)];
                                                  
                                                  [_imgAri3 setCenter:cen];
                                              }
                                              completion:^(BOOL finished){
                                                  NSLog(@"Done!");
                                                  if(finished) {
                                                      [_imgAri3 setImage:[UIImage imageNamed:@"ch_ari_sh2"]];
                                                      
                                                      _imgAri2.hidden = NO;
                                                      [_imgAri2 setAlpha:0.0f];
                                                      
                                                      [UIView animateWithDuration:0.08
                                                                            delay:0.0
                                                                          options:UIViewAnimationOptionCurveEaseOut
                                                                       animations:^{
                                                                           [_imgAri2 setAlpha:1.0f];
                                                                       }
                                                                       completion:^(BOOL finished){
                                                                           NSLog(@"Done!");
                                                                           if(finished) {
                                                                               [_imgAri3 setImage:[UIImage imageNamed:@"ch_ari_sh3"]];
                                                                               
                                                                               [self animateAra];
                                                                           }
                                                                           
                                                                       }];
                                                  }
                                                  
                                              }];
                         }
                         
                     }];
    
}

- (void)animateAra {
    mAraTop = -4;
    CGPoint cen = _imgAra3.center;
    
    [_imgAra1 setFrame:CGRectMake(_imgAra1.frame.origin.x, _imgAra3.frame.origin.y, _imgAra1.frame.size.width, _imgAra1.frame.size.height)];
    
    _imgAra3.hidden = NO;
    _imgAra1.hidden = NO;
    
    [UIView animateWithDuration:0.18
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [_imgAra1 setFrame:CGRectMake(_imgAra1.frame.origin.x, mAraTop -10, _imgAra1.frame.size.width, _imgAra1.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         if(finished) {
                             
                             
                             [UIView animateWithDuration:0.18
                                                   delay:0.0
                                                 options:UIViewAnimationOptionCurveEaseOut
                                              animations:^{
                                                  [_imgAra1 setFrame:CGRectMake(_imgAra1.frame.origin.x, mAraTop, _imgAra1.frame.size.width, _imgAra1.frame.size.height)];
                                                  
                                                  UIImage *img = [UIImage imageNamed:@"ch_ara_sh2"];
                                                  
                                                  [_imgAra3 setFrame:CGRectMake(_imgAra3.frame.origin.x, _imgAra3.frame.origin.y, img.size.width, img.size.height)];
                                                  
                                                  [_imgAra3 setCenter:cen];
                                              }
                                              completion:^(BOOL finished){
                                                  NSLog(@"Done!");
                                                  if(finished) {
                                                      [_imgAra3 setImage:[UIImage imageNamed:@"ch_ara_sh2"]];
                                                      
                                                      _imgAra2.hidden = NO;
                                                      [_imgAra2 setAlpha:0.0f];
                                                      
                                                      [UIView animateWithDuration:0.08
                                                                            delay:0.0
                                                                          options:UIViewAnimationOptionCurveEaseOut
                                                                       animations:^{
                                                                           [_imgAra2 setAlpha:1.0f];
                                                                       }
                                                                       completion:^(BOOL finished){
                                                                           NSLog(@"Done!");
                                                                           if(finished) {
                                                                               
                                                                               [_imgAra3 setImage:[UIImage imageNamed:@"ch_ara_sh3"]];
                                                                               
                                                                               [self animateTitle];
                                                                           }
                                                                           
                                                                       }];
                                                  }
                                                  
                                              }];
                         }
                         
                     }];
    
}

- (void)animateTitle {
    CGFloat top = _lbTitle.frame.origin.y;
    
    _lbTitle.hidden = NO;
    [_lbTitle setAlpha:0.0f];
    [_lbTitle setFrame:CGRectMake(_lbTitle.frame.origin.x, top -20, _lbTitle.frame.size.width, _lbTitle.frame.size.height)];
    
    [UIView animateWithDuration:0.26
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [_lbTitle setAlpha:1.0f];
                         [_lbTitle setFrame:CGRectMake(_lbTitle.frame.origin.x, top, _lbTitle.frame.size.width, _lbTitle.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         if(finished) {
                             [self animateSubTitle];
                         }
                         
                     }];
    
    
}

- (void)animateSubTitle {
    CGFloat top = _lbSubTitle.frame.origin.y;
    
    _lbSubTitle.hidden = NO;
    [_lbSubTitle setAlpha:0.0f];
    [_lbSubTitle setFrame:CGRectMake(_lbSubTitle.frame.origin.x, top -20, _lbSubTitle.frame.size.width, _lbSubTitle.frame.size.height)];
    
    [UIView animateWithDuration:0.26
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [_lbSubTitle setAlpha:1.0f];
                         [_lbSubTitle setFrame:CGRectMake(_lbSubTitle.frame.origin.x, top, _lbSubTitle.frame.size.width, _lbSubTitle.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         if(finished) {
                             
                         }
                         
                     }];
}

@end
