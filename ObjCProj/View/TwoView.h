//
//  TwoView.h
//  test
//
//  Created by suhyup02 on 2019. 4. 18..
//  Copyright © 2019년 aa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TwoViewDeleage <NSObject>

@optional
- (void) changeTwoViewText:(NSString*)lbText;

@end

@interface TwoView : UIView

@property (assign, nonatomic) id <TwoViewDeleage>delegate;

@end

NS_ASSUME_NONNULL_END
