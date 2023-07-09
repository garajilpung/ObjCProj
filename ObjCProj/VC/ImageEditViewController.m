//
//  ImageEditViewController.m
//  test
//
//  Created by suhyup02 on 13/06/2019.
//  Copyright © 2019 aa. All rights reserved.
//

#import "ImageEditViewController.h"

@interface ImageEditViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ImageEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    _imageView setContentMode:(UIViewContentMode)
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
    switch (sender.tag) {
        case 101:
            _imgView.contentMode = UIViewContentModeTopLeft;
            break;
        case 102:
            _imgView.contentMode = UIViewContentModeTop;
            break;
        case 103:
            _imgView.contentMode = UIViewContentModeTopRight;
            break;
        case 104:
            _imgView.contentMode = UIViewContentModeLeft;
            break;
        case 105:
            _imgView.contentMode = UIViewContentModeRight;
            break;
        case 106:
            _imgView.contentMode = UIViewContentModeBottomLeft;
            break;
        case 107:
            _imgView.contentMode = UIViewContentModeBottom;
            break;
        case 108:
            _imgView.contentMode = UIViewContentModeBottomRight;
            break;
        case 109:
            _imgView.contentMode = UIViewContentModeCenter;
            break;
        case 110:
            _imgView.contentMode = UIViewContentModeScaleToFill;
            break;
        case 111:
            _imgView.contentMode = UIViewContentModeScaleAspectFit;
            break;
        case 112:
            _imgView.contentMode = UIViewContentModeScaleAspectFill;
            break;
        default:
            break;
    }
}


@end
