//
//  PopupViewController.m
//  test
//
//  Created by suhyup02 on 23/05/2019.
//  Copyright © 2019 aa. All rights reserved.
//

// popup 처리와 회전 관련 체크한다.

#import "PopupViewController.h"
#import "CustomAlertPopup.h"

@interface PopupViewController () {
 
    NSMutableAttributedString *title;
    NSMutableAttributedString *msg;
    
}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fgd;

@end

@implementation PopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    title = [[NSMutableAttributedString alloc] initWithString:@"알림"];
    [title addAttribute:NSFontAttributeName
                value:[UIFont systemFontOfSize:25.0]
                range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSForegroundColorAttributeName
                  value:[UIColor redColor]
                  range:NSMakeRange(0, title.length)];
    
    
    msg = [[NSMutableAttributedString alloc] initWithString:@"msg Presenting the great... Hulk Hogan!"];
    [msg addAttribute:NSFontAttributeName
                value:[UIFont systemFontOfSize:18.0]
                range:NSMakeRange(28, 11)];
    
    
    [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    
    NSURL *url = [NSURL URLWithString:@"http://itunes.apple.com/lookup?bundleId=com.suhyup.psmb"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSLog(@"json %@", json);
    
    NSLog(@"json %@", [[json objectForKey:@"results"][0] objectForKey:@"version"]);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onBtn1:(id)sender {

    // 정상
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertVC setValue:title forKey:@"attributedTitle"];
    
    [alertVC setValue:msg forKey:@"attributedMessage"];
    
    UIAlertAction* ok1 = [UIAlertAction
                         actionWithTitle:@"OK1"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alertVC dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alertVC addAction:ok1];
    
    UIAlertAction* ok2 = [UIAlertAction
                         actionWithTitle:@"OK2"
                         style:UIAlertActionStyleCancel
                         handler:^(UIAlertAction * action)
                         {
                             [alertVC dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alertVC addAction:ok2];
    
    UIAlertAction* ok3 = [UIAlertAction
                         actionWithTitle:@"OK3"
                         style:UIAlertActionStyleDestructive
                         handler:^(UIAlertAction * action)
                         {
                             [alertVC dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alertVC addAction:ok3];
    
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (IBAction)onBtn2:(id)sender {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVC setValue:title forKey:@"attributedTitle"];
    [alertVC setValue:msg forKey:@"attributedMessage"];
    
    UIAlertAction* ok1 = [UIAlertAction
                          actionWithTitle:@"OK1"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action)
                          {
                              [alertVC dismissViewControllerAnimated:YES completion:nil];
                              
                          }];
    [alertVC addAction:ok1];
    
    UIAlertAction* ok2 = [UIAlertAction
                          actionWithTitle:@"OK2"
                          style:UIAlertActionStyleCancel
                          handler:^(UIAlertAction * action)
                          {
                              [alertVC dismissViewControllerAnimated:YES completion:nil];
                              
                          }];
    [alertVC addAction:ok2];
    
    UIAlertAction* ok3 = [UIAlertAction
                          actionWithTitle:@"OK3"
                          style:UIAlertActionStyleDestructive
                          handler:^(UIAlertAction * action)
                          {
                              [alertVC dismissViewControllerAnimated:YES completion:nil];
                              
                          }];
    [alertVC addAction:ok3];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (IBAction)onBtn3:(id)sender {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertVC setValue:title forKey:@"attributedTitle"];
    [alertVC setValue:msg forKey:@"attributedMessage"];
    
    UIAlertAction* ok1 = [UIAlertAction
                          actionWithTitle:@"OK1"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action)
                          {
                              [alertVC dismissViewControllerAnimated:YES completion:nil];
                              
                          }];
    [alertVC addAction:ok1];
    
    UIAlertAction* ok2 = [UIAlertAction
                          actionWithTitle:@"OK2"
                          style:UIAlertActionStyleCancel
                          handler:^(UIAlertAction * action)
                          {
                              [alertVC dismissViewControllerAnimated:YES completion:nil];
                              
                          }];
    [alertVC addAction:ok2];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (IBAction)onBtn4:(id)sender {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVC setValue:title forKey:@"attributedTitle"];
    [alertVC setValue:msg forKey:@"attributedMessage"];
    
    UIAlertAction* ok1 = [UIAlertAction
                          actionWithTitle:@"OK1"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action)
                          {
                              [alertVC dismissViewControllerAnimated:YES completion:nil];
                              
                          }];
    [alertVC addAction:ok1];
    
    UIAlertAction* ok2 = [UIAlertAction
                          actionWithTitle:@"OK2"
                          style:UIAlertActionStyleCancel
                          handler:^(UIAlertAction * action)
                          {
                              [alertVC dismissViewControllerAnimated:YES completion:nil];
                              
                          }];
    [alertVC addAction:ok2];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (IBAction)onBtnCtmPopup:(id)sender {
    CustomAlertPopup *popup = [[CustomAlertPopup alloc] initWithMsg:@"dkjamvlasdfvasd \n 아ㅐ프자아ㅡㅁㄴ \nㅏ암느ㅐ으 ]\nkas  fkdjsko \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ \n 아ㅐ프자아ㅡㅁㄴ" withTitle:@"알림" withType:CONFIRM_PANEL];
    
    [self presentViewController:popup animated:YES completion:^{
        
    }];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
    return NO;
}
@end
