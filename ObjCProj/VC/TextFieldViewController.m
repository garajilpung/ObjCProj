//
//  TextFieldViewController.m
//  test
//
//  Created by suhyup02 on 2019. 3. 11..
//  Copyright © 2019년 aa. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tf1;
@property (weak, nonatomic) IBOutlet UITextField *tf2;
@property (weak, nonatomic) IBOutlet UITextField *tf3;

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert|UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if(granted) {
//            UNMutableNotificationContent *content = [UNMutableNotificationContent new];
//            content.categoryIdentifier = @"UYLReminderCategory";
//            content.title = @"This is title : Zedd";
//            content.subtitle = @"This is Subtitle : UserNotifications tutorial";
//            content.body = @"This is Body : 블로그 글 쓰기";
//            content.badge = [NSNumber numberWithInt:1];
//
//
//            UNTimeIntervalNotificationTrigger *triger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:10 repeats:false];
////            UNCalendarNotificationTrigger *trigger1 = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:(nonnull NSDateComponents *) repeats:false];
////            UNLocationNotificationTrigger *trigger2 = [UNLocationNotificationTrigger triggerWithRegion:(nonnull CLRegion *) repeats:false];
////            UNPushNotificationTrigger *trigger3 = [UNPushNotificationTrigger init];
//
//            UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"<Sound" content:content trigger:triger];
//
//            UNNotificationAction *snoozeAction = [UNNotificationAction actionWithIdentifier:@"Snooze"
//                                                                                      title:@"Snooze" options:UNNotificationActionOptionNone];
//            UNNotificationAction *deleteAction = [UNNotificationAction actionWithIdentifier:@"Delete"
//                                                                                      title:@"Delete" options:UNNotificationActionOptionDestructive];
//
//            UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"UYLReminderCategory"
//                                                                                      actions:@[snoozeAction,deleteAction] intentIdentifiers:@[]
//                                                                                      options:UNNotificationCategoryOptionNone];
//            NSSet *categories = [NSSet setWithObject:category];
//
//            [center setNotificationCategories:categories];
//
//            [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request
//                                                                   withCompletionHandler:^(NSError * _Nullable error) {
//                                                                       if(error) {
//                                                                            NSLog(@"local Push register fail 2 [%@]", error.description);
//                                                                       }else {
//                                                                           NSLog(@"Local Push register Success");
//                                                                       }
//                                                                   }
//             ];
        }else {
            if(error) {
                NSLog(@"local Push register faile 1 [%@]", error.description);
            }
        }
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


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldBeginEditing");
    return true;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldDidBeginEditing");
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldEndEditing");
    return true;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    NSLog(@"textFieldDidEndEditing");
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSLog(@"change :%@", textField.text);
    
    NSLog(@"change Range : %ld %ld", range.location, range.length);
    
    NSLog(@"change string : %@", string);
    
//    if(textField == _tf1 && range.location == 3) {
//
//        _tf1.text = [NSString stringWithFormat:@"%@%@",textField.text,string];
//        [_tf1 resignFirstResponder];
//        [_tf2 becomeFirstResponder];
//        return false;
//    }
    
    if(textField == _tf1) {
        if (textField.text.length < 4 || range.length == 1) {
            return YES;
        } else if (textField.text.length == 4) {
            _tf2.text = string;
            [_tf2 becomeFirstResponder];
            if ([_tf2.text length] < 4) {
                return YES;
            } else {
                return NO;
            }
        }
    }
    
    return true;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    
    return true;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    return true;
}



#pragma mark - UIButton Event

- (IBAction)onBtn1:(id)sender {
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.categoryIdentifier = @"UYLReminderCategory";
    content.title = @"10초";
//    content.subtitle = @"This is Subtitle : UserNotifications tutorial";
    content.body = @"This is Body : msg";
//    content.badge = [NSNumber numberWithInt:1];
    
    UNTimeIntervalNotificationTrigger *triger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:10 repeats:false];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"Sound" content:content trigger:triger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request
                                                           withCompletionHandler:^(NSError * _Nullable error) {
                                                               if(error) {
                                                                    NSLog(@"local Push register fail 2 [%@]", error.description);
                                                               }else {
                                                                   NSLog(@"Local Push register Success");
                                                               }
    }];
}

- (IBAction)onBtn2:(id)sender {
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.categoryIdentifier = @"UYLReminderCategory";
    content.title = @"2초";
//    content.subtitle = @"This is Subtitle : UserNotifications tutorial";
    content.body = @"This is Body : msg";
//    content.badge = [NSNumber numberWithInt:1];
    
    UNTimeIntervalNotificationTrigger *triger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:2 repeats:false];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"Sound" content:content trigger:triger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request
                                                           withCompletionHandler:^(NSError * _Nullable error) {
                                                               if(error) {
                                                                    NSLog(@"local Push register fail 2 [%@]", error.description);
                                                               }else {
                                                                   NSLog(@"Local Push register Success");
                                                               }
    }];
}

- (IBAction)onBtn3:(id)sender {
    
}

- (IBAction)onBtn4:(id)sender {
    
}



#pragma mark push ios10 ver

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    
    
    
    //10버전 이상일경우 이곳으로 메세지가 온다
    
    if(@available(iOS 14.0, *)){
        completionHandler(UNNotificationPresentationOptionBanner); //푸시 배너를 띄운다.
    }else {
        completionHandler(UNNotificationPresentationOptionAlert); //푸시 배너를 띄운다.
    }
    
    
    NSLog(@"userNotificationCenter push data = %@",notification.request.content);
    
    
    
}



-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(nonnull void (^)(void))completionHandler{
    
    
    NSString *identifier = response.actionIdentifier;
    
    if([identifier isEqualToString:@"Snooze"]) {
        
    }else if([identifier isEqualToString:@"Delete"]) {
        
    }else {
        
    }
    
    NSLog(@"response.actionIdentifier [%@]", response.actionIdentifier);
    
    //앱이 백그라운드로 살아있고 푸시가 올떄 배너로 앱 진입시 이곳으로 들어온다.
    
    NSLog(@"userNotificationCenter Userinfo %@",response.notification.request.content);
    
    completionHandler();
    
}
@end
