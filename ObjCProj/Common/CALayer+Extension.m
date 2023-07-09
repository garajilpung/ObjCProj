//
//  UIView+Extension.m
//  ObjCProj
//
//  Created by suhyup02 on 2020/10/07.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CALayer+Extension.h"

@implementation CALayer (extended)

-(void)setBorderUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}
 
-(UIColor*)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}


- (void) setLayerStyle:(NSInteger)layerStyle {

    if(layerStyle == 1) {
        self.borderWidth = 4;
        self.borderColor = UIColor.redColor.CGColor;
    }else if(layerStyle == 2) {
        self.cornerRadius = 20;
    }else {
        self.borderWidth = 2;
        self.borderColor = UIColor.grayColor.CGColor;
        self.cornerRadius = 10;
    }
        
}

- (NSInteger) layerStyle {

    return self.layerStyle;
}

@end
