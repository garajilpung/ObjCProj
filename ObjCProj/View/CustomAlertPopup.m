//
//  CustomAlertPopup.m
//  suhyup
//
//  Created by suhyup02 on 2016. 10. 25..
//  Copyright © 2016년 suhyupbank. All rights reserved.
//


#import "CustomAlertPopup.h"

@interface CustomAlertPopup () {
    NSString *strMsg;
}

@end

@implementation CustomAlertPopup

- (id)initWithMsg:(NSString*)msg withTitle:(NSString*)title withType:(int)type {
    self = [super initWithNibName:@"CustomAlertPopup" bundle:nil];
    if (self != nil)
    {
        self.view.frame = UIApplication.sharedApplication.keyWindow.frame;
        
        [self.labTitle setText:title];
        [self.textView setTextAlignment:NSTextAlignmentCenter];
        [self.textView setFont:[UIFont systemFontOfSize:18]];
        
        CGFloat txtHeight = [self findHeightForText:msg havingWidth:([[UIScreen mainScreen] bounds].size.width - 25*2) andFont:[UIFont systemFontOfSize:18]];

        // txtView 122는 기본인 경우 값
        if(txtHeight > 122) {
            self.viewHeight.constant += txtHeight-122;
        }
        
        
        
        [self.textView setText:msg];
        
        
        [self.btnOK setHidden:YES];
        
        if(type == ALERT_PANEL) {
            [self.btnCancelLeft setHidden:YES];
            [self.btnOKRight setHidden:YES];
            
            [self.btnOK setHidden:NO];
        }else {
            [self.btnOK setHidden:YES];
            
            [self.btnCancelLeft setHidden:NO];
            [self.btnOKRight setHidden:NO];
        }
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
 
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.textView setContentOffset:CGPointZero animated:NO];
}

- (void)alertWithMessage:(NSString*)message title:(NSString*)title type:(int)type{
    
    
    self.view.frame = UIApplication.sharedApplication.keyWindow.frame;
    //[self.labTitle.superview setCenter:CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0)];
    
    [self.labTitle setText:title];
    [self.textView setTextAlignment:NSTextAlignmentCenter];
    [self.textView setFont:[UIFont systemFontOfSize:18]];
    
    if([[UIScreen mainScreen] bounds].size.width > 320) {
        [self.textView setText:message];
    }else {
        strMsg = message;
    }
    
    
//    [self adjustContentSize:self.textView];
   

    [self.btnOK setHidden:YES];
    
    if(type == ALERT_PANEL) {
        [self.btnCancelLeft setHidden:YES];
        [self.btnOKRight setHidden:YES];
        
        [self.btnOK setHidden:NO];
    }else {
        [self.btnOK setHidden:YES];

        [self.btnCancelLeft setHidden:NO];
        [self.btnOKRight setHidden:NO];
    }
}

-(void)adjustContentSize:(UITextView*)tv{
    CGFloat deadSpace = ([tv bounds].size.height - [tv contentSize].height);
    CGFloat inset = MAX(0, deadSpace/2.0);
    tv.contentInset = UIEdgeInsetsMake(inset, tv.contentInset.left, inset, tv.contentInset.right);
}

- (IBAction)onBtnOK:(id)sender {
    [self.view removeFromSuperview];
    
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(customAlertView:clickedButtonAtIndex:)]){
        [self.delegate customAlertView:self clickedButtonAtIndex:1];
    }
}


- (IBAction)onBtnCancelLeft:(id)sender {
    [self.view removeFromSuperview];
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(customAlertView:clickedButtonAtIndex:)]){
        [self.delegate customAlertView:self clickedButtonAtIndex:0];
    }
}

- (IBAction)onBtnOKRight:(id)sender {
    [self.view removeFromSuperview];
    
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(customAlertView:clickedButtonAtIndex:)]){
        [self.delegate customAlertView:self clickedButtonAtIndex:1];
    }
}

- (CGFloat)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font
{
    CGFloat result = font.pointSize + 4;
    if (text)
    {
        CGSize textSize = { widthValue, CGFLOAT_MAX };       //Width and height of text area
        CGSize size;
//        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
        {
            //iOS 7
            CGRect frame = [text boundingRectWithSize:textSize
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{ NSFontAttributeName:font }
                                              context:nil];
            size = CGSizeMake(frame.size.width, frame.size.height+1);
        }
//        else
//        {
//            //iOS 6.0
//            size = [text sizeWithFont:font constrainedToSize:textSize lineBreakMode:NSLineBreakByWordWrapping];
//        }
        result = MAX(size.height, result); //At least one row
    }
    return result;
}
@end
