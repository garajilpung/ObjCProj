//
//  HexGridViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2021/02/16.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import "HexGridViewController.h"
//#import "PBJHexagonFlowLayout.h"

@interface HexGridViewController () {
    UICollectionViewController *cvc;
}

@end

@implementation HexGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    PBJHexagonFlowLayout *flowLayout = [[PBJHexagonFlowLayout alloc] init];
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    flowLayout.sectionInset = UIEdgeInsetsZero;
//    flowLayout.headerReferenceSize = CGSizeZero;
//    flowLayout.footerReferenceSize = CGSizeZero;
//    flowLayout.itemSize = CGSizeMake(80.0f, 92.0f);
//    flowLayout.itemsPerRow = 4;
// 
//    cvc = [[UICollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
//    [cvc.view setBackgroundColor:[UIColor whiteColor]];
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
    
    [self presentViewController:cvc animated:YES completion:^{
        
    }];
}
@end
