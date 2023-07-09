//
//  ModalWebviewViewController.m
//  
//
//  Created by suhyup02 on 18/06/2020.
//

#import "ModalWebviewViewController.h"
#import "ModalTestViewController.h"

@interface ModalWebviewViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *cWebView;

@end

@implementation ModalWebviewViewController

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

- (IBAction)onBtn1:(id)sender {
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.naver.com"]];
    
    [_cWebView loadRequest:req];
}

- (IBAction)onBtn2:(id)sender {
    ModalTestViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"mdTestVC"];
    [self presentViewController:vc animated:YES completion:^{

    }];
    
//    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"알림" message:@"알려드립니다." preferredStyle:UIAlertControllerStyleActionSheet];
//
//    UIAlertAction* ok1 = [UIAlertAction
//                          actionWithTitle:@"확인"
//                          style:UIAlertActionStyleDefault
//                          handler:^(UIAlertAction * action)
//                          {
//                              [alertVC dismissViewControllerAnimated:YES completion:nil];
//
//                          }];
//    [alertVC addAction:ok1];
//
//    [self presentViewController:alertVC animated:YES completion:nil];
}
#pragma UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"webViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webViewDidFinishLoad");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"didFailLoadWithError");
}
@end
