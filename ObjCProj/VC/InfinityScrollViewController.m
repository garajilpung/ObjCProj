//
//  InfinityScrollViewController.m
//  test
//
//  Created by suhyup02 on 16/10/2019.
//  Copyright © 2019 aa. All rights reserved.
//

#import "InfinityScrollViewController.h"

@interface InfinityScrollViewController () {
    CGRect rSize;
    UIView *cView[4];

    int nPrevPageIndex;
    int nPageIndex;
    int nNextPageIndex;
    
    CGPoint pLastOffset;
}

@end


@implementation InfinityScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    rSize = _mView.frame;
    NSLog(@"rect : %02.f, %02.f, %02.f, %02.f", rSize.origin.x, rSize.origin.y, rSize.size.width, rSize.size.height);
    
    [_mView setContentSize:CGSizeMake(rSize.size.width*3, rSize.size.height)];
    
    for(int i =0, j =4; i < 4; i++, j--) {
        UILabel *p = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        [p setText:[NSString stringWithFormat:@"%d",i ]];
        [p setTextColor:UIColor.redColor];
        
        cView[i] = [[UIView alloc] initWithFrame:CGRectMake(rSize.size.width*i, 0 , rSize.size.width, rSize.size.height)];
        
        [cView[i] setBackgroundColor:[UIColor colorWithRed:j*0.2 green:j*0.2 blue:j*0.2 alpha:1.0f]];
        
        [cView[i] addSubview:p];
    }
    
    [cView[3] setFrame:CGRectMake(0, 0 , rSize.size.width, rSize.size.height)];
    [cView[0] setFrame:CGRectMake(rSize.size.width, 0 , rSize.size.width, rSize.size.height)];
    [cView[1] setFrame:CGRectMake(rSize.size.width*2, 0 , rSize.size.width, rSize.size.height)];
    
    [_mView addSubview:cView[3]];
    [_mView addSubview:cView[0]];
    [_mView addSubview:cView[1]];
    
    [_mView scrollRectToVisible:CGRectMake(rSize.size.width, 0, rSize.size.width, rSize.size.height) animated:NO];
    
    nPrevPageIndex = 3;
    nPageIndex = 0;
    nNextPageIndex = 1;
    
    pLastOffset = CGPointMake(rSize.size.width, rSize.size.height);
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll");
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"scrollViewWillEndDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging");
}
//
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
//
//}
//
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if(pLastOffset.x < scrollView.contentOffset.x) {
        [cView[nPrevPageIndex] removeFromSuperview];
        
        [cView[nPageIndex] setFrame:CGRectMake(0, 0, rSize.size.width, rSize.size.height)];
        [cView[nNextPageIndex] setFrame:CGRectMake(rSize.size.width, 0, rSize.size.width, rSize.size.height)];
        
        nPrevPageIndex = nPageIndex;
        nPageIndex ++;
        nNextPageIndex ++;
        
        if(nPageIndex >= 4) {
            nPageIndex = 0;
        }
        
        if(nNextPageIndex >= 4) {
            nNextPageIndex = 0;
        }
        
        [cView[nNextPageIndex] setFrame:CGRectMake(rSize.size.width*2, 0, rSize.size.width, rSize.size.height)];
        [_mView addSubview:cView[nNextPageIndex]];
        
        [scrollView scrollRectToVisible:CGRectMake(rSize.size.width, 0, rSize.size.width, rSize.size.height) animated:NO];
    }else if(pLastOffset.x > scrollView.contentOffset.x){
        [cView[nNextPageIndex] removeFromSuperview];
        
        [cView[nPageIndex] setFrame:CGRectMake(rSize.size.width*2, 0, rSize.size.width, rSize.size.height)];
        [cView[nPrevPageIndex] setFrame:CGRectMake(rSize.size.width, 0, rSize.size.width, rSize.size.height)];
        
        nNextPageIndex = nPageIndex;
        nPageIndex --;
        nPrevPageIndex --;
        
        if(nPageIndex < 0) {
            nPageIndex = 3;
        }
        if(nPrevPageIndex < 0) {
            nPrevPageIndex = 3;
        }
        
        [cView[nPrevPageIndex] setFrame:CGRectMake(0, 0, rSize.size.width, rSize.size.height)];
        [_mView addSubview:cView[nPrevPageIndex]];
        
        [scrollView scrollRectToVisible:CGRectMake(rSize.size.width, 0, rSize.size.width, rSize.size.height) animated:NO];
    }else {
        
    }
    
    
    pLastOffset = scrollView.contentOffset;

    
}
//
//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//
//}

//- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
//
//}
//
//- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2) {
//
//}
//
//- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
//
//}

//- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
//
//}
//- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView;{
//
//}

/* Also see -[UIScrollView adjustedContentInsetDidChange]
 */
//- (void)scrollViewDidChangeAdjustedContentInset:(UIScrollView *)scrollView {
//
//}

@end
