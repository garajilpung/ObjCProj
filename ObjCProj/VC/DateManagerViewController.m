//
//  DateManagerViewController.m
//  test
//
//  Created by suhyup02 on 28/08/2019.
//  Copyright © 2019 aa. All rights reserved.
//

#import "DateManagerViewController.h"

@interface DateManagerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbContent;

@end

@implementation DateManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    [self control];

}


- (void)control {
    NSMutableString* content = [NSMutableString new];
    NSDateFormatter* df = [NSDateFormatter new];
    
    NSDate *toDay = [[NSDate alloc] init];
    [content appendString:toDay.description];
    [content appendString:@"\n"];
    
//    NSLocale *cLocale = [NSLocale currentLocale];
//    [content appendString:[toDay descriptionWithLocale:cLocale]];
//    [content appendString:@"\n"];
    
    [content appendString:[NSString stringWithFormat:@"%f", toDay.timeIntervalSinceReferenceDate]];
    [content appendString:@"\n"];
    
    df.timeStyle = NSDateFormatterShortStyle;
    df.dateStyle = NSDateFormatterShortStyle;
    
    [content appendString:[df stringFromDate:toDay]];
    [content appendString:@"\n"];
    
    df.timeStyle = NSDateFormatterFullStyle;
    df.dateStyle = NSDateFormatterFullStyle;
    
    [content appendString:[df stringFromDate:toDay]];
    [content appendString:@"\n"];
    
    [df setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z' EEE"];
    
    [content appendString:[df stringFromDate:toDay]];
    [content appendString:@"\n"];
    
//    [content appendString:[NSString stringWithFormat:@"%f", toDay.timeIntervalSinceNow]];
//    [content appendString:@"\n"];
//
//    [content appendString:[NSString stringWithFormat:@"%f", toDay.timeIntervalSince1970]];
//    [content appendString:@"\n"];
//
//    int size = sizeof(int);
//    [content appendString:[NSString stringWithFormat:@"int size [%d]", size]];
//    [content appendString:@"\n"];
//
//    size = sizeof(long);
//    [content appendString:[NSString stringWithFormat:@"long size [%d]", size]];
//    [content appendString:@"\n"];
//
//    size = sizeof(double);
//    [content appendString:[NSString stringWithFormat:@"double size [%d]", size]];
//    [content appendString:@"\n"];
    
    
    _lbContent.text = content;
    
    
    NSDateFormatter* ndf = [NSDateFormatter new];
    [ndf setDateFormat:@"yyyy'-'MM'-'dd'"];
    
    NSDate *date = [NSDate date];
//    [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:[NSDate date] options:NSCalendarWrapComponents];
    
    NSLog(@"cal Date %@",  [ndf stringFromDate:date]);
 
    NSRange weekRange = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:date];
    NSLog(@" count week of count : %ld %ld", weekRange.location, weekRange.length);
    
    NSRange dayRange = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSLog(@" count day of count : %ld %ld", dayRange.location, dayRange.length);
    
    NSUInteger weekday = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:date];
    NSLog(@" weekday : %ld", weekday);
    
    date = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitMonth value:-7 toDate:[NSDate date] options:NSCalendarWrapComponents];
    
    weekRange = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:date];
    NSLog(@" count week of count : %ld %ld", weekRange.location, weekRange.length);
    
    dayRange = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSLog(@" count day of count : %ld %ld", dayRange.location, dayRange.length);
    
    weekday = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:date];
    NSLog(@" weekday : %ld", weekday);
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth;
 
    NSCalendar * cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal components:unitFlags fromDate:date];
    NSLog(@" %ld %ld %ld %ld %ld", comps.year, comps.month, comps.day, comps.weekday, comps.weekOfMonth);
    
    NSDateComponents *comp1 = [NSDateComponents new];
    comp1.year = comps.year;
    comp1.month = comps.month;
    comp1.day = 1;
    
    NSDate *date1 = [[NSCalendar currentCalendar] dateFromComponents:comp1];
    NSUInteger weekday1 = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:date1];
    NSLog(@" weekday : %ld", weekday1);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
