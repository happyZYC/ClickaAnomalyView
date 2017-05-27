//
//  OperateViewDelegate.h
//  HospitalMedical
//
//  Created by 赵永昌 on 2017/5/27.
//  Copyright © 2017年 chengzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OperateViewDelegate <NSObject>

- (void)selectSex:(NSInteger)sex selectPart:(NSInteger)part isFront:(BOOL)isFront;
/*
 sex:       1男性  2女性  3小孩
 part:      1头部 2颈部 3胸部 4肚子 5生殖部位 6腿部 7足部 8左臂 9左手 10右臂 11右手
 isFront:   YES前部   NO后部
 */

@end
