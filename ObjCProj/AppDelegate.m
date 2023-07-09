//
//  AppDelegate.m
//  ObjCProj
//
//  Created by garajilpung on 11/02/2020.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    /// 여기서 숏컷을 새로이 생성해서 추가할 수 있다.
    
#ifdef DEBUG
    NSLog(@"DEBUG");
#else
    NSLog(@"RELEASE");
#endif
    
#if TARGET_OS_SIMULATOR
    NSLog(@"simulator 일단만 작동");
#else
    NSLog(@"device 일때만 작동");
#endif

//    [Utility getUUID];
//    [Utility getDevice];
    
    
//    if([[UIDevice currentDevice] systemVersion].floatValue >= 10){
//        
//        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//        
//        center.delegate = self;
//        
//        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){
//            
//            if( !error ){
//                
//                [[UIApplication sharedApplication] registerForRemoteNotifications];
//                
//            }
//            
//            else {
//                
//                NSLog( @"Push registration FAILED" );
//                
//                NSLog( @"ERROR: %@ - %@", error.localizedFailureReason, error.localizedDescription );
//                
//                NSLog( @"SUGGESTIONS: %@ - %@", error.localizedRecoveryOptions, error.localizedRecoverySuggestion );
//                
//            }
//            
//        }];
//        
//    } else { //10ver 미만
//        
//        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
//        [[UIApplication sharedApplication] registerForRemoteNotifications];
//        
////        if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
////
////            NSLog(@"Requesting permission for push notifications..."); // iOS 8
////
////            UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:
////
////                                                    UIUserNotificationTypeAlert | UIUserNotificationTypeBadge |
////
////                                                    UIUserNotificationTypeSound categories:nil];
////
////            [application registerUserNotificationSettings:settings];
////
////        }
//        
//    }
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    NSLog(@"Quick Actions Make");
    // Quick Action or Home Screen ShortCut은 최대 아이템이 네개 까지 가능(Info.plist 에서)
    /* applicationWillResignActive 함수에서 추가하는게 가능 단 Info.plist파일을 우선으로 하고 다음에 추가가 가능 (여기도 최대 네개까지)
       단 함수가 실행될때마다 새로이 생성되기에 추가되는 숏컷 아이템은 계속 변경되게 할 수 있음
    */
    
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:@"UIApplicationShortcutItemType" localizedTitle:@"좋아" localizedSubtitle:@"아이템 좋아" icon: [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay] userInfo:@{@"key2":@"value2"}];
    
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"UIApplicationShortcutItemType" localizedTitle:@"싫어" localizedSubtitle:@"아이템 싫어" icon: [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay] userInfo:@{@"key2":@"value2"}];
    
    application.shortcutItems = @[item, item2];
}
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler {
  
    NSLog(@" %@", shortcutItem.description);
    NSLog(@" %@", shortcutItem.type);
    NSLog(@" %@", shortcutItem.localizedTitle);
    NSLog(@" %@", shortcutItem.localizedSubtitle);
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
#pragma mark -
#pragma mark Apple Push Notification Handler

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSLog(@"didRegisterForRemoteNotificationsWithDeviceToken deviceToken = %@", deviceToken);
    
}



- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"\n\n\nFailed to get PUSH notification=%@\n\n\n",error);
    
}



- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo  {
    
    // 10버전 미만일경우 이곳으로 푸시메세지가 온다 단 앱이 실행중일떄다
    
}

#pragma mark -
#pragma mark push ios10 ver

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    
    
    
    //10버전 이상일경우 이곳으로 메세지가 온다
    
    
    
    completionHandler(UNNotificationPresentationOptionAlert); //푸시 배너를 띄운다.
    
    
    
    NSLog(@"userNotificationCenter push data = %@",notification.request.content.userInfo);
    
    
    
}



-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(nonnull void (^)(void))completionHandler{
    
    
    
    //앱이 백그라운드로 살아있고 푸시가 올떄 배너로 앱 진입시 이곳으로 들어온다.
    
    
    
    NSLog(@"userNotificationCenter Userinfo %@",response.notification.request.content.userInfo);
    
    
    
}*/

@end
