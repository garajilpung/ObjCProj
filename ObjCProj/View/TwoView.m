//
//  TwoView.m
//  test
//
//  Created by suhyup02 on 2019. 4. 18..
//  Copyright © 2019년 aa. All rights reserved.
//

#import "TwoView.h"

@implementation TwoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)onBtn:(id)sender {
    if(self.delegate && [self.delegate respondsToSelector:@selector(changeTwoViewText:)]) {
        [self.delegate changeTwoViewText:@"vo,20edksm"];
    }
}

@end
