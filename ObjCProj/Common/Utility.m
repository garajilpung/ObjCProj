//
//  Utility.m
//  test
//
//  Created by suhyup02 on 2019. 4. 4..
//  Copyright © 2019년 aa. All rights reserved.
//

#import "Utility.h"
#import "CommonDefine.h"

@implementation Utility


+ (void)showKeyChain:(NSString*)keyName withGroup:(NSString*)groupName {
    NSLog(@"KEYCHAIN Show Start >>>>>>>>>>>>>>>>>>>>>>>>>");
    if(groupName) {
        NSLog(@"KEYCHAIN group [%@]", groupName);
    }
    
    NSLog(@"KEYCHAIN KeyName [%@]", keyName);
    
    NSMutableDictionary *query = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  (__bridge id)kCFBooleanTrue, (__bridge id)kSecReturnAttributes,
                                  (__bridge id)kSecMatchLimitAll, (__bridge id)kSecMatchLimit,
                                  nil];
    
    NSArray *secItemClasses = [NSArray arrayWithObjects:
                               (__bridge id)kSecClassGenericPassword,
                               (__bridge id)kSecClassInternetPassword,
                               (__bridge id)kSecClassCertificate,
                               (__bridge id)kSecClassKey,
                               (__bridge id)kSecClassIdentity,
                               nil];
    if(keyName) {
        [query setObject:keyName forKey:(__bridge id)kSecAttrGeneric];
    }
    
    if(groupName) {
        [query setObject:groupName forKey:(__bridge id)kSecAttrAccessGroup];
    }
    
    for (id secItemClass in secItemClasses) {
        [query setObject:secItemClass forKey:(__bridge id)kSecClass];
        
        CFTypeRef result = NULL;
        SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
        NSLog(@"KEYCHAIN LOOK %@", (__bridge id)result);
        
        if (result != NULL) CFRelease(result);
    }
    NSLog(@"KEYCHAIN Show End >>>>>>>>>>>>>>>>>>>>>>>>>");
}

+ (void)deleteAllKeyChain{
    NSLog(@"KEYCHAIN Delete Start >>>>>>>>>>>>>>>>>>>>>>>>>");
    
    NSMutableDictionary *query = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  (__bridge id)kCFBooleanTrue, (__bridge id)kSecReturnAttributes,
                                  (__bridge id)kSecMatchLimitAll, (__bridge id)kSecMatchLimit,
                                  nil];
    
    NSArray *secItemClasses = [NSArray arrayWithObjects:
                               (__bridge id)kSecClassGenericPassword,
                               (__bridge id)kSecClassInternetPassword,
                               (__bridge id)kSecClassCertificate,
                               (__bridge id)kSecClassKey,
                               (__bridge id)kSecClassIdentity,
                               nil];
    
    NSLog(@"KEYCHAIN LOOK >>>>>>>>>>>>>>>>>>>>>>>>>");
    for (id secItemClass in secItemClasses) {
        NSDictionary *spec = @{(__bridge id)kSecClass: secItemClass};
        SecItemDelete((__bridge CFDictionaryRef)spec);
    }
    
    NSLog(@"KEYCHAIN Delete End >>>>>>>>>>>>>>>>>>>>>>>>>");
}

+ (void)deleteKeyChain:(NSString*)keyName withGroup:(NSString*)groupName {
    NSLog(@"KEYCHAIN Delete Start >>>>>>>>>>>>>>>>>>>>>>>>>");
    
    NSMutableDictionary *query = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  (__bridge id)kSecClassGenericPassword, (__bridge id)kSecClass,
                                  nil];
    
    [query setObject:keyName forKey:(__bridge id)kSecAttrGeneric];
    [query setObject:groupName forKey:(__bridge id)kSecAttrAccessGroup];
    
    SecItemDelete((__bridge CFDictionaryRef)query);
    
    NSLog(@"KEYCHAIN Delete End >>>>>>>>>>>>>>>>>>>>>>>>>");
}

- (void) delAllkeychain{
    NSMutableDictionary *query = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  (__bridge id)kCFBooleanTrue, (__bridge id)kSecReturnAttributes,
                                  (__bridge id)kSecMatchLimitAll, (__bridge id)kSecMatchLimit,
                                  nil];
    
    NSArray *secItemClasses = [NSArray arrayWithObjects:
                               (__bridge id)kSecClassGenericPassword,
                               (__bridge id)kSecClassInternetPassword,
                               (__bridge id)kSecClassCertificate,
                               (__bridge id)kSecClassKey,
                               (__bridge id)kSecClassIdentity,
                               nil];
    
    NSLog(@"KEYCHAIN LOOK >>>>>>>>>>>>>>>>>>>>>>>>>");
    for (id secItemClass in secItemClasses) {
        NSDictionary *spec = @{(__bridge id)kSecClass: secItemClass};
        SecItemDelete((__bridge CFDictionaryRef)spec);
    }
}

- (void) delkeychain:(NSString*)key {
    
    
    NSLog(@"KEYCHAIN DELTE /////////////");
    
    NSMutableDictionary *query = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  (__bridge id)kSecClassGenericPassword, (__bridge id)kSecClass,
                                  nil];
    
    [query setObject:key forKey:(__bridge id)kSecAttrGeneric];
    
    SecItemDelete((__bridge CFDictionaryRef)query);
    
    NSLog(@"KEYCHAIN DELTE /////////////");
}

- (void) showkeychain{
    NSMutableDictionary *query = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  (__bridge id)kCFBooleanTrue, (__bridge id)kSecReturnAttributes,
                                  (__bridge id)kSecMatchLimitAll, (__bridge id)kSecMatchLimit,
                                  nil];
    
    NSArray *secItemClasses = [NSArray arrayWithObjects:
                               (__bridge id)kSecClassGenericPassword,
                               (__bridge id)kSecClassInternetPassword,
                               (__bridge id)kSecClassCertificate,
                               (__bridge id)kSecClassKey,
                               (__bridge id)kSecClassIdentity,
                               nil];
    
    NSLog(@"KEYCHAIN LOOK >>>>>>>>>>>>>>>>>>>>>>>>>");
    for (id secItemClass in secItemClasses) {
        [query setObject:secItemClass forKey:(__bridge id)kSecClass];
        
        CFTypeRef result = NULL;
        SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
        NSLog(@"KEYCHAIN LOOK %@", (__bridge id)result);
        
        if (result != NULL) CFRelease(result);
    }
}

+ (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

+ (NSString*) getASCIICode:(NSString*)str {
    NSMutableString *ret = [NSMutableString new];
    
    for(int i =0; i<[str length]; i++){
        int c = [str characterAtIndex:i];
        
        [ret appendString:[NSString stringWithFormat:@"%d", c]];
    }
    
    return ret;
}


+ (NSString*) getUUID {
    /* 테스트용으로 아래와 같이 코드를 작성
     실제 프로젝트에서는 UUID값이 변경되지 않게 키체인에다 저장하게 해야 함
     
     그리고 iOS에서는 CFUUID와 NSUUID가 따로 존재한다.
     둘다 생성시마다 다른 UUID를 생성한다. 그러므로 UUID값이 변경되지 않게 저장한 다음 사용해야 한다.
     */
    NSString* ret = [Utility loadShareDataKey:@"SYSTEM_UUID"];
    
    if(!(ret != nil && ret.length > 0)) { // 저장된 UUID가 없는 경우 생성해서 반환한다.
        CFUUIDRef UUIDRef = CFUUIDCreate(kCFAllocatorDefault);
        CFStringRef UUIDSRef = CFUUIDCreateString(kCFAllocatorDefault, UUIDRef);
        
        ret = [NSString stringWithFormat:@"%@", UUIDSRef];
        
//        ret = NSUUID.UUID.UUIDString;
        
        [Utility saveShareDataKey:@"SYSTEM_UUID" withData:ret];
    }
    
    NSLog(@"UUID [%@]", ret);
    
    return ret;
}

+ (void) getDevice {
    
    UIDevice *device  = [UIDevice currentDevice];
    
    NSLog(@"Device Name :%@", device.name);
    
    NSLog(@"Device Model :%@", device.model);
    NSLog(@"Device LocalizedModel :%@", device.localizedModel);
    NSLog(@"Device SystemName :%@", device.systemName);
    NSLog(@"Device SystemVersion :%@", device.systemVersion);

    NSLog(@"Device SystemVersion :%ld", (long)device.orientation);
}

+ (void) saveShareDataKey:(NSString*)key withData:(NSString*)data {
    NSUserDefaults *uDefaults = [NSUserDefaults standardUserDefaults];
    
    [uDefaults setObject:data forKey:key];
    [uDefaults synchronize];
}

+ (NSString*) loadShareDataKey:(NSString*)key {
    NSUserDefaults *uDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *ret = [uDefaults stringForKey:key];
    
    return ret;
}


+ (void) setUserDefaults {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    
    
}

+ (NSString*) getHost {
    NSString *ret = @"https://garajilpung.synology.me";
    
    bool bServerPosition = [[NSUserDefaults standardUserDefaults] boolForKey:USERDEFAULT_SERVERPOSITION];
    
    if(!bServerPosition) {
        ret = @"http://192.168.1.103";
    }
    
    return ret;
}

+ (void) loadAsyncImageFromURL:(NSURL *)url  imageBlock:(void (^) (UIImage *image))imageBlock errorBlock:(void(^)(void))errorBlock
{
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[NSData alloc] initWithContentsOfURL:url];
                       UIImage * image = [[UIImage alloc] initWithData:data];
                       dispatch_async( dispatch_get_main_queue(), ^(void){
                           if( image != nil )
                           {
                               imageBlock( image );
                           } else {
                               errorBlock();
                           }
                       });
                   });
}

+ (void)sendASyncRequest:(NSString*)pURL withBody:(NSDictionary*)pDicBdoy completionHandler:(void (^) (BOOL bSuccess, NSString* errorMsg ,NSString *result))dataBlock {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:pURL]];
    
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:pURL]];
    NSDictionary *headers = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    [request setAllHTTPHeaderFields:headers];
//    [request setTimeoutInterval:kTransDefaultTimeout];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:[[AppManager sharedInstance] getUserAgent] forHTTPHeaderField:@"user-Agent"];
    [request setHTTPMethod:@"POST"];
    
    if(pDicBdoy != nil) {
        NSMutableArray *parameterArray = [NSMutableArray array];
        
        [pDicBdoy enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
            NSString *param = [NSString stringWithFormat:@"%@=%@", key, [obj stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
            [parameterArray addObject:param];
        }];
        
        NSString *string = [parameterArray componentsJoinedByString:@"&"];
        [request setHTTPBody:[string dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            NSString *errMsg = [NSString stringWithFormat:@"서비스에 연결할 수 없습니다.\n네트워크 환경을 확인해 주세요. (%d)", (int)error.code];
            dataBlock(false, errMsg, nil);
        } else {
            if(data != nil){
                NSString *result =  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                dataBlock(false, nil, result);
            }else {
                dataBlock(false, @"데이터가 존재하지 않습니다.", nil);
            }
        }
    }] resume];
}
@end
