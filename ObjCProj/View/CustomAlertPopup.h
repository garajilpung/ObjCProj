//
//  CustomAlertPopup.h
//  suhyup
//
//  Created by suhyup02 on 2016. 10. 25..
//  Copyright © 2016년 suhyupbank. All rights reserved.
//


#import <UIKit/UIKit.h>

#define ALERT_PANEL 0
#define CONFIRM_PANEL 1

/**
 *  @file		CustomAlertPopup.h
 *	@class		CustomAlertPopup
 *  @brief		커스텀 팝업
 *  @date		2016.02.10
 */

@protocol CustomAlertPopupDelegate;

@interface CustomAlertPopup : UIViewController

//Object
@property (weak, nonatomic) IBOutlet UIImageView *imgPopupBG;               //팝업 이미지
@property (weak, nonatomic) IBOutlet UILabel *labTitle;                     //팝업 타이틀
@property (weak, nonatomic) IBOutlet UITextView *textView;                  //팝업 텍스트뷰
@property (weak, nonatomic) IBOutlet UIButton *btnOK;                       //확인(1버튼)
@property (weak, nonatomic) IBOutlet UIButton *btnCancelLeft;               //취소(2버튼)
@property (weak, nonatomic) IBOutlet UIButton *btnOKRight;                  //확인(2버튼)
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewHeight;

//Data
@property (nonatomic,assign) id<CustomAlertPopupDelegate> delegate;         //팝업 델리게이트
@property (assign, nonatomic) int tag;                                      //팝업 테크

// 초기값
- (id)initWithMsg:(NSString*)msg withTitle:(NSString*)title withType:(int)type;

//팝업 설정
- (void)alertWithMessage:(NSString*)message title:(NSString*)title type:(int)type;
@end


@protocol CustomAlertPopupDelegate <NSObject>
@optional
//팝업 닫힐 때 응답.
- (void)customAlertView:(CustomAlertPopup *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end

