//
//  EKEventViewController.m
//  test
//
//  Created by suhyup02 on 10/12/2019.
//  Copyright © 2019 aa. All rights reserved.
//

#import "EKEventViewController.h"
#import <EventKit/EventKit.h>

@interface EKEventViewController () {
    
    EKEventStore *ekeV;
}

@end

@implementation EKEventViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    /*
        Event.Framework 라이브러리 추가
        EKEvent를 사용하기 위해 #import <EventKit/EventKit.h> 추가
        예시로 캘린더를  사용할 경우
     
     Plist 파일에 Calendars Usage Description 을 추가한다.
     
    */
    ekeV = [[EKEventStore alloc] init];
 
    
    
    NSString *eCode = @"vvvv";
    NSString *msg = [NSString stringWithFormat:@"%@(%@)", @"fail", eCode];
    
    
    NSDictionary *result1 = @{@"errCode":eCode, @"errMsg":msg};
    
    NSLog(@" %@", result1);
    
    
    eCode = nil;
    msg = [NSString stringWithFormat:@"%@(%@)", @"fail", eCode];
    
    @try{
        result1 = @{@"errCode":eCode, @"errMsg":msg};
    }
    @catch(NSException *ex){
        NSLog(@"Exception %@", ex.description);
    }
    @finally{
        
    }
    
    
    NSLog(@" %@", result1);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onBtnCalendar:(id)sender {
    // 캘린더 사용권한부터 추가한다.
    EKAuthorizationStatus authorizationStatus = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    
    switch(authorizationStatus){
        case EKAuthorizationStatusNotDetermined: {// 결정 안됨
            [ekeV requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
                if(granted) {
                    
                }else {
                    // 안된다고 토스트 팝업 표시
                    return;
                }
            }];
        }
            break;
        
        case EKAuthorizationStatusDenied: { // 접근 권한 거부
            
            [self showPopup:@"알림" withMsg:@"캘린더 접근이 거부되었습니다. 앱 설정에서 캘린더 접근을 승인해 주십시오" withBtn1:@"확인"];
            
        }
            // 접근권한이 없으므로 앱 설정에서 변경하게 유도
            break;
        case EKAuthorizationStatusRestricted: // 한정 접근
        case EKAuthorizationStatusAuthorized: // 접근 권한 가능
            break;
        default:
            break;
    }
    
    EKEvent *event = [EKEvent eventWithEventStore:ekeV];
    event.title = @"Event Title";
    event.startDate = [NSDate date]; //today
    event.endDate = [event.startDate dateByAddingTimeInterval:60*3];  //set 3 min meeting
    event.calendar = [ekeV defaultCalendarForNewEvents];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:25.0340 longitude:121.5645];
    EKStructuredLocation *slocation = [EKStructuredLocation locationWithTitle:@"map2 VV"];
    slocation.geoLocation = location;
    
    event.structuredLocation = slocation;
    
    NSError *err = nil;
    [ekeV saveEvent:event span:EKSpanThisEvent commit:YES error:&err];
    
    NSLog(@"eventIdentifier %@", event.eventIdentifier);
    
    // If no error occurs then turn the editing mode off, store the new calendar identifier and reload the calendars.
    if (err == nil) {
        

    }
    else{
        // Display the error description to the debugger.
        NSLog(@"%@", [err localizedDescription]);
    }
    
}

- (IBAction)onBtnReminder:(id)sender {
    // 캘린더 사용권한부터 추가한다.
    EKAuthorizationStatus authorizationStatus = [EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder];
    
    switch(authorizationStatus){
        case EKAuthorizationStatusNotDetermined: {// 결정 안됨
            [ekeV requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError * _Nullable error) {
                if(granted) {
                    
                }else {
                    // 안된다고 토스트 팝업 표시
                    return;
                }
            }];
        }
            break;
            
        case EKAuthorizationStatusDenied: { // 접근 권한 거부
            
            [self showPopup:@"알림" withMsg:@"캘린더 접근이 거부되었습니다. 앱 설정에서 미리알림 접근을 승인해 주십시오" withBtn1:@"확인"];
            
        }
            // 접근권한이 없으므로 앱 설정에서 변경하게 유도
            break;
        case EKAuthorizationStatusRestricted: // 한정 접근
        case EKAuthorizationStatusAuthorized: // 접근 권한 가능
            break;
        default:
            break;
    }
    
    EKReminder *reminder = [EKReminder reminderWithEventStore:ekeV];
    
    reminder.title = @"Go to the store and buy milk";
    NSDateComponents *dcom = [[NSDateComponents alloc] init];
    dcom.year = 2019;
    dcom.month = 12;
    dcom.day =30;
    dcom.hour = 17;
    dcom.minute = 00;
    dcom.second = 00;
    
    reminder.dueDateComponents = dcom;
    reminder.calendar = [ekeV defaultCalendarForNewReminders];
    
    NSError *err = nil;
    
    [ekeV saveReminder:reminder commit:YES error:&err];
    
    if (err == nil) {
        
        
    }
    else{
        // Display the error description to the debugger.
        NSLog(@"%@", [err localizedDescription]);
    }
}

- (IBAction)onBtnAlarm:(id)sender {
    EKEvent *event = [EKEvent eventWithEventStore:ekeV];
    EKAlarm *alarmForOneDayBeforeAppointment = [[EKAlarm alloc] init];
    
    NSDate *date = [NSDate date];
    alarmForOneDayBeforeAppointment.absoluteDate = [date dateByAddingTimeInterval:30];
    
    event.alarms = @[alarmForOneDayBeforeAppointment];
    
    NSError *err = nil;
    [ekeV saveEvent:event span:EKSpanThisEvent error:&err];
    
    if (err == nil) {
        
        
    }
    else{
        // Display the error description to the debugger.
        NSLog(@"%@", [err localizedDescription]);
    }
    
}

- (void) showPopup:(NSString*)title withMsg:(NSString*)msg withBtn1:(NSString*)btn1Name {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* ok1 = [UIAlertAction
                          actionWithTitle:btn1Name
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action)
                          {
                              [alertVC dismissViewControllerAnimated:YES completion:nil];
                              
                          }];
    [alertVC addAction:ok1];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}



@end
