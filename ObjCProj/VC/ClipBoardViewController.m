//
//  ClipBoardViewController.m
//  test
//
//  Created by suhyup02 on 02/12/2019.
//  Copyright © 2019 aa. All rights reserved.
//

#import "ClipBoardViewController.h"

@interface ClipBoardViewController ()
@property (weak, nonatomic) IBOutlet UITextView *viewTxt;

@end

@implementation ClipBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *message = @"vkowmdm \n하루를 살리도 \n 살아가는 것도 일도dskdmvlamd oamlvmosaodmkfamdlavowekejksdjfja iasvmom";
    
    CGSize maxSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width - (20*2) - (15*2), [[UIScreen mainScreen] bounds].size.height - 128); // 1000은 최대 높이를 말합니다. 1000을 초과하게 되면 스크롤이 생겨버립니다.
    CGRect txFrame = [message boundingRectWithSize:maxSize
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:15] }
                                         context:nil];
    
    NSLog(@"txFrame %0.2f, %0.2f", txFrame.origin.x, txFrame.origin.y);
    NSLog(@"txFrame %0.2f, %0.2f", txFrame.size.width, txFrame.size.height);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onBtnCpPaste:(id)sender {
    [_viewTxt setText:[UIPasteboard generalPasteboard].string];
}

- (IBAction)onBtnCopy:(id)sender {
    [[UIPasteboard generalPasteboard] setString:@"슈퍼로봇대전 Z"];
    
    
//    [[UIPasteboard generalPasteboard]
}

- (IBAction)onBtnSetting:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: UIApplicationOpenSettingsURLString]];
}

- (IBAction)onBtn:(UIButton *)sender {
    
    switch (sender.tag) {
        case 100:
            
            break;
            
        default:
            break;
    }
    
}
@end
