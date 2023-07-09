//
//  SettingViewController.m
//  ObjCProj
//
//  Created by SMG on 2020/12/12.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "SettingViewController.h"
#import "CommonDefine.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switch_SP;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *userSetting = [NSUserDefaults standardUserDefaults];
    NSArray *udAllKey = [userSetting.dictionaryRepresentation allKeys];
    
    if([udAllKey containsObject:USERDEFAULT_SERVERPOSITION]) {
        BOOL yn = [userSetting boolForKey:USERDEFAULT_SERVERPOSITION];
        [_switch_SP setOn:yn animated:YES];
    }else {
        [userSetting setBool:NO forKey:USERDEFAULT_SERVERPOSITION];
        [_switch_SP setOn:false animated:YES];
    }
    
    [userSetting synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - onBtnEvent

- (IBAction)onBtnBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
            
    }];
}

#pragma mark - on Event

- (IBAction)onSwitchServer:(id)sender {
    UISwitch *sw = (UISwitch*)sender;
    [[NSUserDefaults standardUserDefaults] setBool:sw.on forKey:USERDEFAULT_SERVERPOSITION];
}

@end
