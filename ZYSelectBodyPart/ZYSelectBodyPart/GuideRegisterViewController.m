//
//  GuideRegisterViewController.m
//  HospitalMedical
//
//  Created by 赵永昌 on 2017/5/24.
//  Copyright © 2017年 chengzhen. All rights reserved.
//

#import "GuideRegisterViewController.h"
#import "UIColor+Hex.h"
#import "JQDefine.h"

#import "OperateView.h"

//浅蓝色字体的颜色
#define MoreLittleBlueColor [UIColor colorWithRed:137/255.0 green:169/255.0  blue:231/255.0  alpha:1.0]

@interface GuideRegisterViewController ()
{
    CGFloat _left;
    CGFloat _right;
    NSInteger _selectSexIndex;           //记录当前选择的性别
}

@property(nonatomic, strong) UIView *leftSexSelectView;          //左边view
@property(nonatomic, strong) UIView *rightFrontView;             //右边正面view
@property(nonatomic, strong) UIButton *recordButton;              //记录当前是反面还是背面
@property(nonatomic, strong) NSMutableArray<UIButton *>* recordButtonArray;   //存放的是正反面的button

@property(nonatomic, strong) UIImageView *manSelectImageView;    //男人选择
@property(nonatomic, strong) UIImageView *womanSelectImageView;  //女人选择
@property(nonatomic, strong) UIImageView *childSelectImageView;  //小孩选择

@property(nonatomic, strong) OperateView *operateView;           //操作切换view



@end


@implementation GuideRegisterViewController
- (NSMutableArray <UIButton *>*)recordButtonArray
{
    if (!_recordButtonArray) {
        _recordButtonArray = [[NSMutableArray alloc] init];
    }
    return _recordButtonArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"预约导诊";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _left = (ScreenWidth > 320) ? 15 : 10;
    _right = (ScreenWidth > 320) ? 15 : 10;
    _selectSexIndex = 1;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 25);
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitleColor:LightBlueColor forState:UIControlStateNormal];
    [button setTitle:@"其他部位" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(otherPartAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem *fixItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixItem.width = -5;
    self.navigationItem.rightBarButtonItems = @[fixItem,rightItem];
    
    [self addUI];
}
#pragma mark -- 添加视图
- (void)addUI
{
    [self createLeftView];
    [self createRightView];
    [self createMiddleView];
}
#pragma mark -- 左边view
- (void)createLeftView
{
    CGFloat itemViewWidth = (ScreenWidth > 320) ? 40 : 30;
    CGFloat sexViewTop = ScreenHeight - (itemViewWidth * 3 + 20 + 64 );
    UIView *sexView = [[UIView alloc] initWithFrame:CGRectMake(_left, sexViewTop, itemViewWidth, itemViewWidth * 3 + 20)];
    [self.view addSubview:sexView];
    self.leftSexSelectView = sexView;
    //男
    UIView *manSelectView = [self itemButton:CGRectMake(0, 0, itemViewWidth, itemViewWidth) imageViewStr:@"man_select" button:1 buttonTitle:@"" hasImageView:YES];
    [sexView addSubview:manSelectView];
    //女
    UIView *womanSelectView = [self itemButton:CGRectMake(0, itemViewWidth + 10, itemViewWidth, itemViewWidth) imageViewStr:@"woman_default" button:2 buttonTitle:@"" hasImageView:YES];
    [sexView addSubview:womanSelectView];
    //小孩
    UIView *childSelectView = [self itemButton:CGRectMake(0, itemViewWidth * 2 + 20, itemViewWidth, itemViewWidth) imageViewStr:@"child_default" button:3 buttonTitle:@"" hasImageView:YES];
    [sexView addSubview:childSelectView];
    
}
#pragma mark -- 中间人体view
- (void)createMiddleView
{
    CGFloat left = CGRectGetMaxX(self.leftSexSelectView.frame);
    CGFloat top = (ScreenWidth > 320) ? 20 : 0;
    CGFloat width = CGRectGetMinX(self.rightFrontView.frame) - CGRectGetMaxX(self.leftSexSelectView.frame);
    CGFloat height = CGRectGetMaxY(self.leftSexSelectView.frame) - top ;
    OperateView *view = [[OperateView alloc] initWithFrame:CGRectMake(left, top, width, height)];
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    self.operateView = view;
}
#pragma mark -- 右边view
- (void)createRightView
{
    CGFloat itemViewWidth = (ScreenWidth > 320) ? 46 : 36;
    CGFloat itemLeft = ScreenWidth - _right - itemViewWidth;
    //正面
    UIView *frontView = [self itemButton:CGRectMake(itemLeft, 64, itemViewWidth, itemViewWidth) imageViewStr:@"" button:1 buttonTitle:@"正面" hasImageView:NO];
    [self.view addSubview:frontView];
    self.rightFrontView = frontView;
    //
    UIView *backView = [self itemButton:CGRectMake(itemLeft, CGRectGetMaxY(frontView.frame) + 10, itemViewWidth, itemViewWidth) imageViewStr:@"" button:2 buttonTitle:@"背面" hasImageView:NO];
    [self.view addSubview:backView];
    
}

- (UIView *)itemButton:(CGRect)rect imageViewStr:(NSString *)imageStr button:(NSInteger)tag buttonTitle:(NSString *)title hasImageView:(BOOL)isHas
{
    return ({
        UIView *view = [[UIView alloc] initWithFrame:rect];
        view.backgroundColor = [UIColor whiteColor];
        //
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
        button.tag = tag;
        if (isHas) {
            button.backgroundColor = [UIColor clearColor];
            [button addTarget:self action:@selector(selectSexStatus:) forControlEvents:UIControlEventTouchUpInside];
        }else{
            [button setTitle:title forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            button.backgroundColor = MoreLittleBlueColor;
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = (rect.size.height)/2;
            [button addTarget:self action:@selector(frontOrBackSelectAction:) forControlEvents:UIControlEventTouchUpInside];
            if (tag == 1) {
                self.recordButton = button;
                button.backgroundColor = LightBlueColor;
            }
            [self.recordButtonArray addObject:button];
        }
        [view addSubview:button];
        //
        if (isHas) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
            imageView.image = [UIImage imageNamed:imageStr];
            imageView.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
            [view addSubview:imageView];
            if (tag == 1) {
                self.manSelectImageView = imageView;
            }else if (tag == 2){
                self.womanSelectImageView = imageView;
            }else{
                self.childSelectImageView = imageView;
            }
        }
        
        view;
    });
}
#pragma mark -- 左边 性别选择view逻辑处理
- (void)selectSexStatus:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    if (_selectSexIndex == tag) {
        return;
    }
    if (tag == 1) {
        self.manSelectImageView.image = [UIImage imageNamed:@"man_select"];
        self.womanSelectImageView.image = [UIImage imageNamed:@"woman_default"];
        self.childSelectImageView.image = [UIImage imageNamed:@"child_default"];
        
        [self.operateView showManFrontView];
        
    }else if (tag == 2){
        self.womanSelectImageView.image = [UIImage imageNamed:@"woman_select"];
        self.manSelectImageView.image = [UIImage imageNamed:@"man_default"];
        self.childSelectImageView.image = [UIImage imageNamed:@"child_default"];
        
        [self.operateView showWomanFrontView];
        
    }else{
        self.childSelectImageView.image = [UIImage imageNamed:@"child_select"];
        self.womanSelectImageView.image = [UIImage imageNamed:@"woman_default"];
        self.manSelectImageView.image = [UIImage imageNamed:@"man_default"];
        
        [self.operateView showChildFrontView];
    }
    
    _selectSexIndex = tag;
    UIButton *button1 = self.recordButtonArray[0];
    button1.backgroundColor = LightBlueColor;
    self.recordButton = button1;
    UIButton *button2 = self.recordButtonArray[1];
    button2.backgroundColor = MoreLittleBlueColor;
}
#pragma mark -- 右边 正反面选择view逻辑处理
- (void)frontOrBackSelectAction:(UIButton *)sender
{
    if (self.recordButton == sender) {
        return;
    }
    sender.backgroundColor = LightBlueColor;
    self.recordButton.backgroundColor = MoreLittleBlueColor;
    self.recordButton = sender;
    
    NSInteger idx = sender.tag;
    
    if (_selectSexIndex == 1) {
        if (idx == 1) {
            [self.operateView showManFrontView];
        }else{
            [self.operateView showManBackView];
        }
    }else if (_selectSexIndex == 2){
        if (idx == 1) {
            [self.operateView showWomanFrontView];
        }else{
            [self.operateView showWomanBackView];
        }
    }else{
        if (idx == 1) {
            [self.operateView showChildFrontView];
        }else{
            [self.operateView showChildBackView];
        }
    }
    
    
}


#pragma mark -- 其他部位
- (void)otherPartAction
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
