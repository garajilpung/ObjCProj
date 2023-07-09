//
//  PDFViewController.m
//  test
//
//  Created by suhyup02 on 16/01/2020.
//  Copyright © 2020 aa. All rights reserved.
//

#import "PDFAndViewController.h"
#import <PDFKit/PDFKit.h>

API_AVAILABLE(ios(11.0))
@interface PDFAndViewController () {
    PDFView *vPDF;
}
@property (weak, nonatomic) IBOutlet UILabel *lbWarnning;
@property (weak, nonatomic) IBOutlet UIView *vPDFBack;

@end

@implementation PDFAndViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     #available(iOS 11.0, *)
     */
    
    
    
    if(@available(iOS 11.0, *)) {
        [_lbWarnning setHidden:YES];
        vPDF = [[PDFView alloc] initWithFrame:CGRectMake(0, 0, _vPDFBack.frame.size.width, _vPDFBack.frame.size.height)];
        
        PDFDocument  *doc = [[PDFDocument alloc] initWithURL:[NSURL URLWithString:@"https://garajilpung.synology.me/test/zzz.pdf"]];
        
        vPDF.document = doc;
        [_vPDFBack addSubview:vPDF];
        
    }else {
        [_lbWarnning setText:@"OS iOS 11 이상에서 제공되어 집니다."];
    }
    
    
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
