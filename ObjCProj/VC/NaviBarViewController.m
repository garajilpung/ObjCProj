//
//  NaviBarViewController.m
//  test
//
//  Created by suhyup02 on 10/05/2019.
//  Copyright © 2019 aa. All rights reserved.
//

#import "NaviBarViewController.h"

@interface NaviBarViewController ()
@property (weak, nonatomic) IBOutlet UINavigationBar *naviBarBottom;
@property (weak, nonatomic) IBOutlet UINavigationItem *nbTitle;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *lbarItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rbarItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *lbarItem3;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rbarItem4;

@end

@implementation NaviBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    UILabel *p = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 30, 40)];
    [p setText:@"amdfpqawdmv"];
    [p setBackgroundColor:UIColor.redColor];
    
    [self.view addSubview:p];
      
      UIToolbar *lotoolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44)];
      [lotoolbar setTintColor:[UIColor blackColor]];
      
      UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithTitle:@"DATE" style:UIBarButtonItemStyleDone target:self action:@selector(dateToolbardoneButtonAction)];
      
      UIBarButtonItem *button2=[[UIBarButtonItem alloc]initWithTitle:@"TIME" style:UIBarButtonItemStyleDone target:self action:@selector(timeToolbarbuttonAction)];
      
      [lotoolbar setItems:[[NSArray alloc] initWithObjects:button1, button2,nil]];
      [self.view addSubview:lotoolbar];
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UINavigationBar* bar = self.navigationController.navigationBar;
    
      bar.barStyle = UIBarStyleBlack;
      bar.tintColor = UIColor.yellowColor;
      
      NSArray *arr = bar.items;
      UINavigationItem *item1 = arr[0];
      UINavigationItem *item2 = arr[1];
      
      if(item1.backBarButtonItem) {
          NSLog(@"back button 있음");
      }
      
      if(item1.leftBarButtonItem) {
          NSLog(@"left 아이템 있음");
      }
      
      if(item1.leftBarButtonItems) {
          NSLog(@"left 아이템 있음");
      }
      
      if(item1.rightBarButtonItem) {
           NSLog(@"right 아이템 있음");
      }
      if(item1.rightBarButtonItems) {
          NSLog(@"right 아이템 있음");
      }
      
      NSLog(@"%@", item1.title);
      NSLog(@"%@", item2.title);
      NSLog(@"%02d", arr.count);
      
      CGRect rect = [[UIScreen mainScreen] bounds];
      NSLog(@"frame size %0.2f %0.2f", self.view.frame.size.width, self.view.frame.size.height);
      NSLog(@"frame size %0.2f %0.2f", rect.size.width , rect.size.height);
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onBtnCh1:(id)sender {
    _lbarItem.tintColor  = UIColor.redColor;
    _nbTitle.title = @"Touch Ch1";
}

- (IBAction)onBtnCh3:(id)sender {
    _lbarItem3.tintColor  = UIColor.greenColor;
    _nbTitle.title = @"Touch Ch3";
}

- (IBAction)onBtnCh2:(id)sender {
    _rbarItem.tintColor = UIColor.blueColor;
    _nbTitle.title = @"Touch Ch2";
}

- (IBAction)onBtnCh4:(id)sender {
    _rbarItem4.tintColor = UIColor.magentaColor;
    _nbTitle.title = @"Touch Ch4";
}


@end
