//
//  OneView.h
//  test
//
//  Created by suhyup02 on 2019. 4. 18..
//  Copyright © 2019년 aa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OneViewDeleage <NSObject>

@optional
- (void) changeOneViewText:(NSString*)lbText;

@end

@interface OneView : UIView

@property (assign, nonatomic) id <OneViewDeleage>delegate;

@end

NS_ASSUME_NONNULL_END
