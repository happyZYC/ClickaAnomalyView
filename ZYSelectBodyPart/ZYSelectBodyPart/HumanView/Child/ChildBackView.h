//
//  ChildBackView.h
//  ZYSelectBodyPart
//
//  Created by 赵永昌 on 2017/5/26.
//  Copyright © 2017年 chengzhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OperateViewDelegate.h"

@interface ChildBackView : UIView

@property(nonatomic, weak)id<OperateViewDelegate>delegate;

@end
