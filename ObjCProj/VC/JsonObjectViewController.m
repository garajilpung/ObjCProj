//
//  JsonObjectViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2021/03/12.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import "JsonObjectViewController.h"
#import "Person.h"


@interface JsonObjectViewController ()

@end

@implementation JsonObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    NSDictionary *dic = @{@"lastName":@"Johe", @"firstName":@"Smith", @"nAge":[NSNumber numberWithInt:38], @"bStudent":[NSNumber numberWithBool:false], @"toy":@[@"1",@"2",@"3"]};
    
    Person *p = [[Person alloc] init:dic];
    [p desc];
    
    NSDictionary *dic2 = @{@"lastName":@"vvv", @"firstName":@"한국", @"nAge":[NSNumber numberWithInt:11], @"bStudent":[NSNumber numberWithBool:true]};
    
    Person *p2 = [[Person alloc] init:dic2];
    [p2 desc];
    
    
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
