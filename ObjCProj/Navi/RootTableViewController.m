//
//  RootTableViewController.m
//  test
//
//  Created by suhyup02 on 2019. 3. 18..
//  Copyright © 2019년 aa. All rights reserved.
//

#import "RootTableViewController.h"
#import "RotateViewController.h"

#import "SettingViewController.h"
#import "NSString+Extension.h"

@interface RootTableViewController () {
    NSDictionary *dicDB;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"Root";

    NSString *path = [[NSBundle mainBundle] pathForResource:@"dic" ofType:@"plist"];
    
    dicDB = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didOnReceive:)
                                                 name:@"didOnReceive"
                                               object:nil];
    
    // console Test
//    NSMutableString *p = [self getString];
//    [p insertString:@"vsd" atIndex:3];
//    NSLog(@"NSMutableString %@", p);
    // console Test
    
//    NSString *a = [[NSString alloc] init];
//    [a displayURL];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_tableView reloadData];
}

#pragma mark - Motion Event

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"루트 모션 시작");
    
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"루트 모션 종료");
    if(motion == UIEventSubtypeMotionShake) {
        NSLog(@"루트 흔들기 종료");
    }
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"루트 모션 취소");
    if(motion == UIEventSubtypeMotionShake) {
        NSLog(@"루트 흔들기 취소");
    }
}


#pragma mark

- (void) didOnReceive:(NSNotification*)noti {
    NSLog(@"receive DAta : %@", noti);
    
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:noti.userInfo[@"title"] message:@"naviBar" preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction* ok1 = [UIAlertAction
                          actionWithTitle:@"OK1"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action)
                          {
                              [alertVC dismissViewControllerAnimated:YES completion:nil];
                              
                          }];
    [alertVC addAction:ok1];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

#pragma mark onBtn

- (IBAction)onBtnSetting:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"settingVC"];
    
    [self presentViewController:vc animated:YES completion:^{
            
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [dicDB count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 0;
    NSArray *temp = nil;
    
    switch (section) {
        case 0:
            temp = [dicDB objectForKey:@"section1"];
            break;
        case 1:
            temp = [dicDB objectForKey:@"section2"];
            break;
        default:
            temp = [dicDB objectForKey:@"section3"];
            break;
    }
    
    count = temp.count;
    
    return count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    // create the parent view
    UIView * customSectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 20)];
    customSectionView.backgroundColor = [[UIColor colorWithRed:0.306 green:0.161 blue:0.047 alpha:1.000] colorWithAlphaComponent:0.9];
    // create the label
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, [[UIScreen mainScreen] bounds].size.width, customSectionView.frame.size.height)];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.highlightedTextColor = [UIColor whiteColor];
    NSString *text = @"";
    
    switch (section) {
        case 0:
            text = @"section1";
            break;
        case 1:
            text = @"section2";
            break;
        case 2:
            text = @"section3";
            break;
        default:
            text = @"section1";
            break;
    }
    
    headerLabel.text = text;
    // package and return
    [customSectionView addSubview:headerLabel];
    
    return customSectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    // create the parent view
    UIView * customSectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 0)];
    customSectionView.backgroundColor = [[UIColor colorWithRed:0.306 green:0.161 blue:0.047 alpha:1.000] colorWithAlphaComponent:0.9];
    // create the label
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, [[UIScreen mainScreen] bounds].size.width, customSectionView.frame.size.height)];
    headerLabel.backgroundColor = [UIColor redColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.highlightedTextColor = [UIColor whiteColor];
    headerLabel.text = @"text";
    // package and return
    [customSectionView addSubview:headerLabel];

    return customSectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 35.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"vcCellTitle" forIndexPath:indexPath];
    
    NSString *title = @"";
    NSArray *temp = nil;
    NSDictionary *header = nil;
    
    switch (indexPath.section) {
        case 0:
            temp = [dicDB objectForKey:@"section1"];
            break;
        case 1:
            temp = [dicDB objectForKey:@"section2"];
            break;
        case 2:
            temp = [dicDB objectForKey:@"section3"];
            break;
        default:
            break;
    }
    
    header = temp[indexPath.row];
    
    title = [header objectForKey:@"title"];
    cell.textLabel.text = title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *actType = @"";
    NSString *target = @"";
    NSString *actID=@"";
    
    NSArray *temp = nil;
    NSDictionary *action = nil;
    
    switch (indexPath.section) {
        case 0:
            temp = [dicDB objectForKey:@"section1"];
            break;
        case 1:
            temp = [dicDB objectForKey:@"section2"];
            break;
        case 2:
            temp = [dicDB objectForKey:@"section3"];
            break;
        default:
            break;
    }
    
    action = temp[indexPath.row];
    actType = [action objectForKey:@"actType"];
    actID = [action objectForKey:@"actID"];
    
    if([actType isEqualToString:@"act"]) { // segue 로 접근하는 경우
        NSDictionary *tDic =@{@"title": [action objectForKey:@"title"],};
        
        [self performSegueWithIdentifier:actID sender:tDic];
    }else if([actType isEqualToString:@"push"]) { // storyBoardID로 전급하는 경우
        target = [action objectForKey:@"target"];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:target bundle:[NSBundle mainBundle]];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:actID];
        vc.title = [action objectForKey:@"title"];
        
        [self.navigationController pushViewController:vc animated:NO];
    }else {
        
    }
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSDictionary *dic = (NSDictionary *)sender;
    
    segue.sourceViewController.title = [dic objectForKey:@"title"];
    
    NSLog(@"tilee eeeee");
}

- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"TestNotification"])
        NSLog (@"Successfully received the test notification!");
}

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    NSLog(@"RootTableViewController");
    NSLog(@" %0.2f, %0.2f", size.width, size.height);
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"TestNotification"
     object:self];
}


// test

- (NSMutableString*)getString {
//    NSMutableString * p = [NSMutableString stringWithFormat:@"vescasdf "];

    NSString *p = @"vmmiweomd";
    
    return [NSMutableString stringWithFormat:@"wodmvidm dfamoem dsdfmo "];
}
@end
