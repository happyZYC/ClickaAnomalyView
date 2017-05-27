//
//  OperateView.m
//  HospitalMedical
//
//  Created by 赵永昌 on 2017/5/26.
//  Copyright © 2017年 chengzhen. All rights reserved.
//

#import "OperateView.h"

#import "ManFrontView.h"
#import "ManBackView.h"
#import "WomanFrontView.h"
#import "WomanBackView.h"
#import "ChildFrontView.h"
#import "ChildBackView.h"

@interface OperateView()<OperateViewDelegate>

@property(nonatomic, strong) ManFrontView *manFrontView;
@property(nonatomic, strong) ManBackView *manBackView;
@property(nonatomic, strong) WomanFrontView *womanFrontView;
@property(nonatomic, strong) WomanBackView *womanBackView;
@property(nonatomic, strong) ChildFrontView *childFrontView;
@property(nonatomic, strong) ChildBackView *childBackView;

@end

@implementation OperateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self showManFrontView];
    }
    return self;
}
#pragma mark -- 男人视图的操作
- (void)creatManView
{
    if (self.manFrontView && self.manBackView) {
        return;
    }
    //男人前
    ManFrontView *manFrantView = [[ManFrontView alloc] initWithFrame:self.bounds];
    manFrantView.alpha = 0.0;
    manFrantView.delegate = self;
    [self addSubview:manFrantView];
    self.manFrontView = manFrantView;
    //男人后
    ManBackView *manBackView = [[ManBackView alloc] initWithFrame:self.bounds];
    manBackView.alpha = 0.0;
    manBackView.delegate = self;
    [self addSubview:manBackView];
    self.manBackView = manBackView;
}
- (void)showManFrontView
{
    [self creatManView];
    [self hiddenWomanView];
    [self hidddenChildeView];
    
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.manFrontView cache:YES];
    self.manBackView.alpha = 0.0;
    self.manFrontView.alpha = 1.0;
    [UIView commitAnimations];
}
- (void)showManBackView
{
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.manBackView cache:YES];
    self.manFrontView.alpha = 0.0;
    self.manBackView.alpha = 1.0;
    [UIView commitAnimations];
}
- (void)hiddenManView
{
    if (!self.manFrontView && !self.manBackView) {
        return;
    }
    
    [UIView animateWithDuration:1 animations:^{
        self.manFrontView.alpha = 0.0;
        self.manBackView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.manFrontView removeFromSuperview];
        [self.manBackView removeFromSuperview];
        self.manBackView = nil;
        self.manFrontView = nil;
    }];
}
#pragma mark -- 女人视图的操作
- (void)createWomanView
{
    if (self.womanFrontView && self.womanBackView) {
        return;
    }
    WomanFrontView *womanFrontView = [[WomanFrontView alloc] initWithFrame:self.bounds];
    womanFrontView.alpha = 0.0;
    womanFrontView.delegate = self;
    [self addSubview:womanFrontView];
    self.womanFrontView = womanFrontView;
    
    WomanBackView *womanBackView = [[WomanBackView alloc] initWithFrame:self.bounds];
    womanBackView.alpha = 0.0;
    womanBackView.delegate = self;
    [self addSubview:womanBackView];
    self.womanBackView = womanBackView;
}
- (void)showWomanFrontView
{
    [self createWomanView];
    [self hiddenManView];
    [self hidddenChildeView];
    
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.womanFrontView cache:YES];
    self.womanBackView.alpha = 0.0;
    self.womanFrontView.alpha = 1.0;
    [UIView commitAnimations];
}
- (void)showWomanBackView
{
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.womanBackView cache:YES];
    self.womanFrontView.alpha = 0.0;
    self.womanBackView.alpha = 1.0;
    [UIView commitAnimations];
}
- (void)hiddenWomanView
{
    if (!self.womanFrontView && !self.womanBackView) {
        return;
    }
    [UIView animateWithDuration:1 animations:^{
        self.womanFrontView.alpha = 0.0;
        self.womanBackView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.womanFrontView removeFromSuperview];
        [self.womanBackView removeFromSuperview];
        self.womanFrontView = nil;
        self.womanBackView = nil;
    }];

}
#pragma mark -- 小孩视图的操作
- (void)createChildView
{
    if (self.childFrontView && self.childBackView) {
        return;
    }
    ChildFrontView *childFrontView = [[ChildFrontView alloc] initWithFrame:self.bounds];
    childFrontView.alpha = 0.0;
    childFrontView.delegate = self;
    [self addSubview:childFrontView];
    self.childFrontView = childFrontView;
    
    ChildBackView *childBackView = [[ChildBackView alloc] initWithFrame:self.bounds];
    childBackView.alpha = 0.0;
    childBackView.delegate = self;
    [self addSubview:childBackView];
    self.childBackView = childBackView;
}
- (void)showChildFrontView
{
    [self createChildView];
    [self hiddenWomanView];
    [self hiddenManView];
    
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.childFrontView cache:YES];
    self.childBackView.alpha = 0.0;
    self.childFrontView.alpha = 1.0;
    [UIView commitAnimations];
}
- (void)showChildBackView
{
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.childBackView cache:YES];
    self.childFrontView.alpha = 0.0;
    self.childBackView.alpha = 1.0;
    [UIView commitAnimations];
}
- (void)hidddenChildeView
{
    if (!self.childFrontView && !self.childBackView) {
        return;
    }
    [UIView animateWithDuration:1 animations:^{
        self.childFrontView.alpha = 0.0;
        self.childBackView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.childFrontView removeFromSuperview];
        [self.childBackView removeFromSuperview];
        self.childFrontView = nil;
        self.childBackView = nil;
    }];
}

#pragma mark -- OperateViewDelegate
- (void)selectSex:(NSInteger)sex selectPart:(NSInteger)part isFront:(BOOL)isFront
{
    NSLog(@"sex:%ld  part:%ld  ifFront:%d",(long)sex,(long)part,isFront);
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
