//
//  FileSendViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 07/04/2020.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "FileSendViewController.h"

@interface FileSendViewController ()<UIDocumentInteractionControllerDelegate> {
    NSString* fileName;
    UIDocumentInteractionController *docVC;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imgV1;
@property (weak, nonatomic) IBOutlet UIImageView *imgV2;

@end

@implementation FileSendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *url1 = [NSURL URLWithString:@"https://garajilpung.synology.me/test/img/ty2.png"];
    
    [self loadAsyncImageFromURL:url1 imageBlock:^(UIImage *image) {
        [self->_imgV1 setImage:image];
    } errorBlock:^{
        [self->_imgV1 setImage:nil];
    }];
    
    url1 = [NSURL URLWithString:@"https://garajilpung.synology.me/test/img/xx2.png"];
    
    [self loadAsyncImageFromURL:url1 imageBlock:^(UIImage *image) {
        [self->_imgV2 setImage:image];
    } errorBlock:^{
        [self->_imgV2 setImage:nil];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) sendDownload:(NSString*)pUrl {
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    
    // request URL 설정
    NSURL *url = [NSURL URLWithString:pUrl];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSessionDownloadTask *dataTask = [defaultSession downloadTaskWithRequest:urlRequest completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            // 실패
        }else {
            
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSURL *documentsURL = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask][0];
            NSURL *fileURL = [documentsURL URLByAppendingPathComponent:@"d.pdf"];
            
//            NSError *moveError;
//            if (![fileManager moveItemAtURL:location toURL:fileURL error:&moveError]) {
//                NSLog(@"moveItemAtURL failed: %@", moveError);
//                return;
//            }
            
            // 성공
            NSLog(@"위치 : [%@]", fileURL.absoluteString);
            self->fileName = [fileURL.absoluteString copy];
        }
    }];
   
    // request 종료
    [dataTask resume];
}

- (IBAction)onBtnDownlaod:(id)sender {
    
    [self sendDownload:@"http://www.africau.edu/images/default/sample.pdf"];
}

- (IBAction)onBtnOpen:(id)sender {
    docVC = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:fileName]];
    
    docVC.delegate = self;
    [docVC presentOptionsMenuFromRect:CGRectZero inView:self.view animated:YES];
}

- (void) loadAsyncImageFromURL:(NSURL *)url  imageBlock:(void (^) (UIImage *image))imageBlock errorBlock:(void(^)(void))errorBlock
{
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[NSData alloc] initWithContentsOfURL:url];
                       UIImage * image = [[UIImage alloc] initWithData:data];
                       dispatch_async( dispatch_get_main_queue(), ^(void){
                           if( image != nil )
                           {
                               imageBlock( image );
                           } else {
                               errorBlock();
                           }
                       });
                   });
}
@end
