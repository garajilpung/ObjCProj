//
//  ListViewController.m
//  test
//
//  Created by suhyup02 on 2019. 4. 26..
//  Copyright © 2019년 aa. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()<UITableViewDelegate, UITableViewDataSource> {
    NSMutableDictionary *dic;
    NSMutableArray *mArr;
    
}
@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    dic = [NSMutableDictionary new];
    
//    for(int i =0; i<100; i ++) {
//        NSString* code = [NSString stringWithFormat:@"%03d", i];
////        NSString* dUrl = [NSString stringWithFormat:@"https://psmbtest.suhyup-bank.com:1443/smart/resources/img/stamp/stamp_%@.png", code];
//
//        NSString* dUrl = [NSString stringWithFormat:@"https://mtest.suhyup-bank.com:9190/easybank/resources/img/stamp/stamp_%@.png", code];
//
////        NSURLRequest *req = [[NSURLRequest alloc] initWithURL:dUrl];
//        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:dUrl]];
//
//        if(data == nil) {
//            data = [[NSData alloc] init];
//        }
//
//        [dic setObject:data forKey:code];
//    }
//

    mArr = [NSMutableArray new];
    [mArr addObject:@"Aa"];
    [mArr addObject:@"Bb"];
    [mArr addObject:@"Cc"];
    [mArr addObject:@"Dd"];
    [mArr addObject:@"Ee"];
    [mArr addObject:@"Ff"];
    [mArr addObject:@"Gg"];
    [mArr addObject:@"Hh"];
    [mArr addObject:@"Ii"];
    [mArr addObject:@"Jj"];
    [mArr addObject:@"Kk"];
    [mArr addObject:@"Ll"];
    [mArr addObject:@"Mm"];
    [mArr addObject:@"Nn"];
    [mArr addObject:@"Oo"];
    [mArr addObject:@"Pp"];
    [mArr addObject:@"Qq"];
    [mArr addObject:@"Rr"];
    [mArr addObject:@"Ss"];
    [mArr addObject:@"Tt"];
    [mArr addObject:@"Uu"];
    [mArr addObject:@"Vv"];
    [mArr addObject:@"WW"];
    [mArr addObject:@"Xx"];
    [mArr addObject:@"Yy"];
    [mArr addObject:@"Zz"];
    
    
    [_mTableView setDelegate:self];
    [_mTableView setDataSource:self];
    
    UIView *vh = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 50)];
    [vh setBackgroundColor:[UIColor blueColor]];
    _mTableView.tableHeaderView = vh;
    
    UIView *vf = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 50)];
    [vf setBackgroundColor:[UIColor yellowColor]];
    _mTableView.tableFooterView = vf;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController]  .
    // Pass the selected object to the new view controller.
}
*/

//section Header
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 30.0f)];
    [v setBackgroundColor:[UIColor grayColor]];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, UIScreen.mainScreen.bounds.size.width -10, 30.0f)];
    
    [lb setText:@"Header"];
    [v addSubview:lb];
    
    return v;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 30.0f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView* v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 30.0f)];
    [v setBackgroundColor:[UIColor grayColor]];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, UIScreen.mainScreen.bounds.size.width -10, 30.0f)];
    
    [lb setText:@"Footer"];
    [v addSubview:lb];
    
    return v;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return mArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 35.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    UILabel *lb = [cell viewWithTag:100];;
    
    if(lb == nil) {
        lb = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, 35)];
        [lb setTag:100];
        [cell addSubview:lb];
    }else {
       
    }

    
    [lb setText:mArr[indexPath.row]];
    
    
    return cell;
}


@end
