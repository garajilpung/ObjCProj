//
//  Utility.h
//  test
//
//  Created by suhyup02 on 2019. 4. 4..
//  Copyright © 2019년 aa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utility : NSObject


+ (void)showKeyChain:(NSString*)keyName withGroup:(NSString*)groupName;

+ (void)deleteAllKeyChain;

+ (void)deleteKeyChain:(NSString*)keyName withGroup:(NSString*)groupName;

+ (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController;

+ (NSString*) getASCIICode:(NSString*)str;

+ (NSString*) getUUID;

+ (void) getDevice;

+ (void) saveShareDataKey:(NSString*)key withData:(NSString*)data;
+ (NSString*) loadShareDataKey:(NSString*)key;

// 설정데이터를 초기화한다.
+ (void) setUserDefaults;

// 서버설정에 따른 host get
+ (NSString*) getHost;

+ (void) loadAsyncImageFromURL:(NSURL *)url  imageBlock:(void (^) (UIImage *image))imageBlock errorBlock:(void(^)(void))errorBlock;

+ (void)sendASyncRequest:(NSString*)pURL withBody:(NSDictionary*)pDicBdoy completionHandler:(void (^) (BOOL bSuccess, NSString* errorMsg ,NSString *result))dataBlock;
@end

NS_ASSUME_NONNULL_END
