//
//  DrawGraphViewController.m
//  ObjCProj
//
//  Created by suhyup02 on 2020/09/01.
//  Copyright © 2020 garajilpung. All rights reserved.
//

#import "DrawGraphViewController.h"


@interface DrawView ()

@end

@implementation DrawView 

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 0.0);
//    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
//    CGContextBeginPath(context);
//    CGContextAddEllipseInRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height));
//    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
//    CGContextAddArc(context, rect.size.width/2, rect.size.height/2, rect.size.width/2, 45, 90, 0);
//    CGContextDrawPath(context, kCGPathFillStroke);
    
//    CGPoint circleCenter = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
//    CGPoint circleCenter = CGPointMake(rect.size.width / 2, rect.size.height / 2);
//
//    [self drawCircleWithCircleCenter:(CGPoint) circleCenter radius:rect.size.height / 2 -10 firstColor:[UIColor blueColor].CGColor secondeColor:[UIColor redColor].CGColor lineWidth:2 startDegree:0 currentDegree:90];
    
    
    
    [self drawArc:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) radius:(self.bounds.size.height-_nValue*2)/2 fillColor:[UIColor blueColor].CGColor startDegree:270 currentDegree:30];
    
    [self drawArc:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) radius:(self.bounds.size.height-_nValue*2)/2 fillColor:[UIColor redColor].CGColor startDegree:30 currentDegree:120];
    
    [self drawArc:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) radius:(self.bounds.size.height-_nValue*2)/2 fillColor:[UIColor yellowColor].CGColor startDegree:120 currentDegree:250];
    
    [self drawCircle:CGRectMake(30, 30, self.bounds.size.width - 30*2, self.bounds.size.height - 30*2)];
}

- (void) drawCircle:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y);
    CGContextAddEllipseInRect(context, rect);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillPath(context);
}

- (void) drawArc:(CGPoint)cPoint radius:(CGFloat)radius fillColor:(CGColorRef)fillColor startDegree:(float)startDegree currentDegree:(float)endDegree {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    
    CGContextMoveToPoint(context, cPoint.x, cPoint.y);
    
    CGContextAddArc(context, cPoint.x , cPoint.y, radius, [self radians:startDegree], [self radians:endDegree], 0);
    CGContextSetFillColorWithColor(context, fillColor);
    CGContextFillPath(context);
}

- (void)drawCircleWithCircleCenter:(CGPoint) circleCenter
                            radius:(CGFloat)radius
                        firstColor:(CGColorRef)firstColor
                      secondeColor:(CGColorRef)secondeColor
                         lineWidth:(CGFloat)lineWidth
                       startDegree:(float)startDegree
                     currentDegree:(float)endDegree {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, lineWidth);
    
    CGContextMoveToPoint(context, circleCenter.x, circleCenter.y);
    
    CGContextAddArc(context, circleCenter.x , circleCenter.y, radius, [self radians:startDegree], [self radians:endDegree], 0);
    CGContextSetFillColorWithColor(context, firstColor);
    CGContextFillPath(context);
    
    CGContextMoveToPoint(context, circleCenter.x, circleCenter.y);
    
    CGContextAddArc(context, circleCenter.x, circleCenter.y, radius, [self radians:endDegree], [self radians:startDegree], 0);
    CGContextSetFillColorWithColor(context, secondeColor);
    CGContextFillPath(context);
    
    CGContextMoveToPoint(context, circleCenter.x-radius+20, circleCenter.y-radius+20);
    CGContextAddEllipseInRect(context, CGRectMake(circleCenter.x-radius+20, circleCenter.y-radius+20, (radius-20)*2, (radius-20)*2));
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillPath(context);
}

- (void)drawCircleWithCircleCenter2:(CGPoint) circleCenter
                             radius:(CGFloat)radius
                         firstColor:(CGColorRef)firstColor
                       secondeColor:(CGColorRef)secondeColor
                          lineWidth:(CGFloat)lineWidth
                        startDegree:(float)startDegree
                      currentDegree:(float)endDegree {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, lineWidth);
    
    CGContextMoveToPoint(context, circleCenter.x, circleCenter.y);
    
    CGContextAddArc(context, circleCenter.x , circleCenter.y, radius, [self radians:startDegree], [self radians:endDegree], 0);
    CGContextSetFillColorWithColor(context, firstColor);
    CGContextFillPath(context);
    
    CGContextMoveToPoint(context, circleCenter.x, circleCenter.y);
    
    CGContextAddArc(context, circleCenter.x, circleCenter.y, radius, [self radians:endDegree], [self radians:startDegree], 0);
    CGContextSetStrokeColorWithColor(context, secondeColor);
    CGContextStrokePath(context);
}

-(float) radians:(double) degrees {
    return degrees * M_PI / 180;
}

@end


@interface DrawGraphViewController ()

@property (weak, nonatomic) IBOutlet DrawView *vDrawView;
@end

@implementation DrawGraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _vDrawView.nValue = 10;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onSlider:(id)sender {
    UISlider *slider = (UISlider*)sender;
    
    _vDrawView.nValue = slider.value;
    
    [_vDrawView setNeedsDisplay];
}

@end
