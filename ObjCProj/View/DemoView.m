//
//  DemoView.m
//  ObjCProj
//
//  Created by suhyup02 on 2021/03/04.
//  Copyright © 2021 garajilpung. All rights reserved.
//

#import "DemoView.h"

@implementation DemoView

- (id) init {
    self = [super init];
    
    if(self){
        [self setInit];
        [self setView];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if(self){
        [self setInit];
        [self setView];
    }
    
    return self;
}

- (id) initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    
    if(self) {
        [self setInit];
        [self setView];
    }
    
    return self;
}


- (void) setInit {
    
}

- (void) setView {
    UIView *view = [[NSBundle mainBundle] loadNibNamed:@"DemoView" owner:self options:nil].firstObject;
    view.frame = self.bounds;
    [self addSubview:view];
    
    // 해상도에 따른 처리
    if([[UIScreen mainScreen] bounds].size.width <= 320) {
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
