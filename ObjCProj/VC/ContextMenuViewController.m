//
//  ContextMenuViewController.m
//  test
//
//  Created by suhyup02 on 31/10/2019.
//  Copyright © 2019 aa. All rights reserved.
//

#import "ContextMenuViewController.h"

@interface ContextMenuViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ContextMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // UIContextMenu 는 iOS 13부터 가능
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
