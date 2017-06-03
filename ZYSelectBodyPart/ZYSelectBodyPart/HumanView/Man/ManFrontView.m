//
//  ManFrontView.m
//  ZYSelectBodyPart
//
//  Created by 赵永昌 on 2017/5/25.
//  Copyright © 2017年 chengzhen. All rights reserved.
//

#import "ManFrontView.h"
#import "JQDefine.h"
#import "SelectButton.h"

@interface ManFrontView()
{
    CGFloat _midPartWidth;
}

@end

@implementation ManFrontView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _midPartWidth = 95;
        
        [self addUI];
    }
    return self;
}
- (void)addUI
{
    //头部
    UIImage *headImage = [UIImage imageNamed:@"man_head_front"];
    CGFloat headScale = headImage.size.width/headImage.size.height;
    SelectButton *headBtn = [SelectButton buttonWithType:UIButtonTypeCustom];
    [headBtn setBackgroundImage:headImage forState:UIControlStateNormal];
    [self addSubview:headBtn];
    CGFloat top = 0;
    if (ScreenHeight < 667) {
        top = 0;
    }else if (ScreenHeight == 667){
        top = 50;
    }else{
        top = 75;
    }
    [headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(top);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(_midPartWidth);
        make.height.mas_equalTo((_midPartWidth/(headScale)));
    }];
    //颈部
    UIImage *neckImage = [UIImage imageNamed:@"man_neck_front"];
    CGFloat neckScale = neckImage.size.width/neckImage.size.height;
    SelectButton *neckBtn = [SelectButton buttonWithType:UIButtonTypeCustom];
    [neckBtn setBackgroundImage:neckImage forState:UIControlStateNormal];
    [self addSubview:neckBtn];
    [neckBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headBtn.mas_bottom).offset(0);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(_midPartWidth);
        make.height.mas_equalTo((_midPartWidth/(neckScale)));
    }];
    //胸部
    UIImage *chestImage = [UIImage imageNamed:@"man_chest_front"];
    CGFloat chestScale = chestImage.size.width/chestImage.size.height;
    SelectButton *chestBtn = [SelectButton buttonWithType:UIButtonTypeCustom];
    [chestBtn setBackgroundImage:chestImage forState:UIControlStateNormal];
    [self addSubview:chestBtn];
    [chestBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(neckBtn.mas_bottom).offset(0);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(_midPartWidth);
        make.height.mas_equalTo(_midPartWidth/(chestScale));
    }];
    //肚子
    UIImage *tripeImage = [UIImage imageNamed:@"man_tripe_front"];
    CGFloat tripeScale = tripeImage.size.width/tripeImage.size.height;
    SelectButton *tripeBtn = [SelectButton buttonWithType:UIButtonTypeCustom];
    [tripeBtn setBackgroundImage:tripeImage forState:UIControlStateNormal];
    [self addSubview:tripeBtn];
    [tripeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(chestBtn.mas_bottom).offset(0);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(_midPartWidth);
        make.height.mas_equalTo((_midPartWidth/(tripeScale)));
    }];
    //生殖部位
    UIImage *engImage = [UIImage imageNamed:@"man_engenderpart_front"];
    CGFloat engScale = engImage.size.width/engImage.size.height;
    SelectButton *engBtn = [SelectButton buttonWithType:UIButtonTypeCustom];
    [engBtn setBackgroundImage:engImage forState:UIControlStateNormal];
    [self addSubview:engBtn];
    [engBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tripeBtn.mas_bottom).offset(0);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(_midPartWidth);
        make.height.mas_equalTo((_midPartWidth/(engScale)));
    }];
    //腿
    UIImage *legImage = [UIImage imageNamed:@"man_leg_front"];
    CGFloat legScale = legImage.size.width/legImage.size.height;
    SelectButton *legBtn = [SelectButton buttonWithType:UIButtonTypeCustom];
    [legBtn setBackgroundImage:legImage forState:UIControlStateNormal];
    [self addSubview:legBtn];
    [legBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(engBtn.mas_bottom).offset(0);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(_midPartWidth);
        make.height.mas_equalTo((_midPartWidth/(legScale)));
    }];
    //脚
    UIImage *footImage = [UIImage imageNamed:@"man_foot_front"];
    CGFloat footScale = footImage.size.width/footImage.size.height;
    SelectButton *footBtn = [SelectButton buttonWithType:UIButtonTypeCustom];
    [footBtn setBackgroundImage:footImage forState:UIControlStateNormal];
    [self addSubview:footBtn];
    [footBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(legBtn.mas_bottom).offset(0);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(_midPartWidth);
        make.height.mas_equalTo((_midPartWidth/(footScale)));
    }];
    //左臂
    UIImage *leftArmImage = [UIImage imageNamed:@"man_leftArm_front"];
    CGFloat leftArmScale = leftArmImage.size.width/leftArmImage.size.height;
    SelectButton *leftArmBtn = [SelectButton buttonWithType:UIButtonTypeCustom];
    [leftArmBtn setBackgroundImage:leftArmImage forState:UIControlStateNormal];
    [self addSubview:leftArmBtn];
    CGFloat leftOrigionHeight = chestImage.size.height;
    CGFloat leftNowHeight = _midPartWidth/(chestScale);
    CGFloat leftArmHeight = (leftOrigionHeight / leftNowHeight) * (leftArmImage.size.height);
    CGFloat leftArmWidth = leftArmHeight * leftArmScale;
    [leftArmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(chestBtn.mas_top).offset(-0.5);
        make.right.equalTo(chestBtn.mas_left).offset(0);
        make.width.mas_equalTo(leftArmWidth);
        make.height.mas_equalTo(leftArmHeight);
    }];
    //左手
    UIImage *lefthandImage = [UIImage imageNamed:@"man_leftHand_front"];
    CGFloat lefthandScale = lefthandImage.size.width/lefthandImage.size.height;
    SelectButton *lefthandBtn = [SelectButton buttonWithType:UIButtonTypeCustom];
    [lefthandBtn setBackgroundImage:lefthandImage forState:UIControlStateNormal];
    [self addSubview:lefthandBtn];
    [lefthandBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftArmBtn.mas_bottom).offset(0);
        make.right.equalTo(leftArmBtn);
        make.width.mas_equalTo(leftArmWidth);
        make.height.mas_equalTo((leftArmWidth/(lefthandScale)));
    }];
    //右臂
    UIImage *rightArmImage = [UIImage imageNamed:@"man_rightArm_front"];
    CGFloat rightArmScale = rightArmImage.size.width/rightArmImage.size.height;
    SelectButton *rightArmBtn = [SelectButton buttonWithType:UIButtonTypeCustom];
    [rightArmBtn setBackgroundImage:rightArmImage forState:UIControlStateNormal];
    [self addSubview:rightArmBtn];
    CGFloat rightOrigionHeight = chestImage.size.height;
    CGFloat rightNowHeight = _midPartWidth/(chestScale);
    CGFloat rightArmHeight = (rightOrigionHeight / rightNowHeight) * (rightArmImage.size.height);
    CGFloat rightArmWidth = rightArmHeight * rightArmScale;
    [rightArmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(chestBtn.mas_top).offset(-0.5);
        make.left.equalTo(chestBtn.mas_right).offset(0);
        make.width.mas_equalTo(rightArmWidth);
        make.height.mas_equalTo(rightArmHeight);
    }];
    //右手
    UIImage *righthandImage = [UIImage imageNamed:@"man_rightHand_front"];
    CGFloat rightHandScale = righthandImage.size.width/righthandImage.size.height;
    SelectButton *righthandBtn = [SelectButton buttonWithType:UIButtonTypeCustom];
    [righthandBtn setBackgroundImage:righthandImage forState:UIControlStateNormal];
    [self addSubview:righthandBtn];
    [righthandBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rightArmBtn.mas_bottom).offset(0);
        make.right.equalTo(rightArmBtn);
        make.width.mas_equalTo(rightArmWidth);
        make.height.mas_equalTo((rightArmWidth/(rightHandScale)));
    }];
    
    [headBtn addTarget:self action:@selector(manFrontClickAction:) forControlEvents:UIControlEventTouchUpInside];
    headBtn.tag = 1;
    [neckBtn addTarget:self action:@selector(manFrontClickAction:) forControlEvents:UIControlEventTouchUpInside];
    neckBtn.tag = 2;
    [chestBtn addTarget:self action:@selector(manFrontClickAction:) forControlEvents:UIControlEventTouchUpInside];
    chestBtn.tag = 3;
    [tripeBtn addTarget:self action:@selector(manFrontClickAction:) forControlEvents:UIControlEventTouchUpInside];
    tripeBtn.tag = 4;
    [engBtn addTarget:self action:@selector(manFrontClickAction:) forControlEvents:UIControlEventTouchUpInside];
    engBtn.tag = 5;
    [legBtn addTarget:self action:@selector(manFrontClickAction:) forControlEvents:UIControlEventTouchUpInside];
    legBtn.tag = 6;
    [footBtn addTarget:self action:@selector(manFrontClickAction:) forControlEvents:UIControlEventTouchUpInside];
    footBtn.tag = 7;
    [leftArmBtn addTarget:self action:@selector(manFrontClickAction:) forControlEvents:UIControlEventTouchUpInside];
    leftArmBtn.tag = 8;
    [lefthandBtn addTarget:self action:@selector(manFrontClickAction:) forControlEvents:UIControlEventTouchUpInside];
    lefthandBtn.tag = 9;
    [rightArmBtn addTarget:self action:@selector(manFrontClickAction:) forControlEvents:UIControlEventTouchUpInside];
    rightArmBtn.tag = 10;
    [righthandBtn addTarget:self action:@selector(manFrontClickAction:) forControlEvents:UIControlEventTouchUpInside];
    righthandBtn.tag = 11;
    
    //
    [self btnEvevts:leftArmBtn];
    [self btnEvevts:lefthandBtn];
    [self btnEvevts:rightArmBtn];
    [self btnEvevts:righthandBtn];

}

- (void)btnEvevts:(UIButton *)btn{
    [btn addTarget:self action:@selector(clickDown:) forControlEvents:UIControlEventTouchDown];
    [btn addTarget:self action:@selector(clickDown:) forControlEvents:UIControlEventTouchDragInside];
    [btn addTarget:self action:@selector(changeBtnState:) forControlEvents:UIControlEventTouchDragOutside];
    [btn addTarget:self action:@selector(changeBtnState:) forControlEvents:UIControlEventTouchCancel];
    
}

- (void)clickDown:(UIButton *)btn{
    UIButton *left;
    UIButton *right;
    if (btn.tag==8||btn.tag==10) {
        left = [self viewWithTag:8];
        right = [self viewWithTag:10];
    }else if (btn.tag==9||btn.tag==11){
        left = [self viewWithTag:9];
        right = [self viewWithTag:11];
    }else{
        return;
    }
    left.highlighted = YES;
    right.highlighted = YES;
}
- (void)changeBtnState:(UIButton *)btn{
    UIButton *left;
    UIButton *right;
    if (btn.tag==8||btn.tag==10) {
        left = [self viewWithTag:8];
        right = [self viewWithTag:10];
    }else if (btn.tag==9||btn.tag==11){
        left = [self viewWithTag:9];
        right = [self viewWithTag:11];
    }else{
        return;
    }
    left.highlighted = NO;
    right.highlighted = NO;
}



- (void)manFrontClickAction:(UIButton *)sender
{
    [self changeBtnState:sender];
    NSInteger idx = sender.tag;
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectSex:selectPart:isFront:)]) {
        [self.delegate selectSex:1 selectPart:idx isFront:YES];
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
