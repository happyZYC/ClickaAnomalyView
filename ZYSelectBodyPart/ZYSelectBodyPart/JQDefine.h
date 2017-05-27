//
//  JQDefine.h
//  XinLian
//
//  Created by gmtx on 15/12/31.
//  Copyright © 2015年 JQKJ. All rights reserved.
//

#ifndef JQDefine_h
#define JQDefine_h

#define IPHONE4     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE5     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE6     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE6P    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//字体
#define JQCustomFont(fontName, fontSize) ([[UIDevice currentDevice].systemVersion floatValue] < 9.0 ? [UIFont systemFontOfSize:fontSize] : [UIFont fontWithName:fontName size:fontSize])

#define IOS10 ([[UIDevice currentDevice].systemVersion floatValue] >= 10)
//单行文字高度
#define TextHeight(text, fontSize) [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | \
NSStringDrawingUsesLineFragmentOrigin | \
NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.height
//单行文字高度font
#define TextFontHeight(text, font) [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | \
NSStringDrawingUsesLineFragmentOrigin | \
NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.height

//多行文字高度
#define MultableTextHeight(text, fontSize, width) [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | \
NSStringDrawingUsesLineFragmentOrigin | \
NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.height
//多行文字高度font
#define MultableTextFontHeight(text, font, width) [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | \
NSStringDrawingUsesLineFragmentOrigin | \
NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.height
//文字长度
#define TextWidth(text, fontSize) [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | \
NSStringDrawingUsesLineFragmentOrigin | \
NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.width + (IOS10 ? 2 : 0)
//文字长度:UIFont
#define TextFontWidth(text, font) [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | \
NSStringDrawingUsesLineFragmentOrigin | \
NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.width + (IOS10 ? 2 : 0)

//根据5高度计算
#define ViewHeight(height) (height * (IPHONE4 ? 1.0 : (IPHONE5 ? 1.0 : (IPHONE6 ? 1.1718 : (IPHONE6P ? 1.2937 : 1.1)))))
//根据6高度计算
#define ViewHeightBy6(height) (height * (IPHONE4 ? 0.8533 : (IPHONE5 ? 0.8533 : (IPHONE6 ? 1.0 : (IPHONE6P ? 1.104 : 1.104)))))
//宽度缩放比例
#define ViewWidthBy6(width) (width * (IPHONE4 ? 0.8533 : (IPHONE5 ? 0.8533 : (IPHONE6 ? 1.0 : (IPHONE6P ? 1.104 : 1.104)))))


//默认背景颜色
#define DefaultBackgroundColor [UIColor colorWithRed:240/255.0 green:239/255.0  blue:244/255.0  alpha:1.0]
//默认字体颜色
#define DefaultTitleColor  [UIColor colorWithRed:60/255.0 green:63/255.0  blue:66/255.0  alpha:1.0]
//默认线条颜色
#define DefaultLineColor   [UIColor colorWithRed:237/255.0 green:240/255.0  blue:242/255.0  alpha:1.0]
//蓝色字体的颜色
#define LightBlueColor [UIColor colorWithRed:28/255.0 green:164/255.0  blue:253/255.0  alpha:1.0]
//绿色字体颜色
#define CMGreenTextColor RGB(72, 203, 193)
//深灰色
#define DefaultDarkGrey [UIColor colorWithHexString:@"0x333333"]
//浅灰色
#define DefaultLightGrey [UIColor colorWithHexString:@"0x999999"]

#import "Masonry.h"


#endif /* JQDefine_h */
