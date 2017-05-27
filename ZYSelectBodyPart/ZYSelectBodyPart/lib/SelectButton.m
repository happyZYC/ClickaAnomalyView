//
//  SelectButton.m
//  ZYSelectBodyPart
//
//  Created by 赵永昌 on 2017/5/25.
//  Copyright © 2017年 chengzhen. All rights reserved.
//

#import "SelectButton.h"
#import "UIImage+ColorAtPoint.h"

#define kAlphaVisibleThreshold (0.1f)

@interface SelectButton ()

@property (nonatomic, assign) CGPoint previousTouchPoint;
@property (nonatomic, assign) BOOL previousTouchHitTestResponse;
@property (nonatomic, strong) UIImage *buttonImage;
@property (nonatomic, strong) UIImage *buttonBackground;

@end

@implementation SelectButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setup];
    }
    return self;
}
- (void)setup
{
    [self updateImageCacheForCurrentState];
    [self resetHitTestCache];
}

#pragma mark - 判断图片在此点区域是否是透明的

- (BOOL)isAlphaVisibleAtPoint:(CGPoint)point forImage:(UIImage *)image {
    
    CGSize iSize = image.size;
    CGSize bSize = self.bounds.size;
    point.x *= (bSize.width != 0) ? (iSize.width / bSize.width) : 1;
    point.y *= (bSize.height != 0) ? (iSize.height / bSize.height) : 1;
    
    UIColor *pixelColor = [image colorAtPoint:point];
    CGFloat alpha = 0.0;
    
    if ([pixelColor respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        
        [pixelColor getRed:NULL green:NULL blue:NULL alpha:&alpha];
    } else {
        CGColorRef cgPixelColor = [pixelColor CGColor];
        alpha = CGColorGetAlpha(cgPixelColor);
    }
    NSLog(@"=====alpha:%f",alpha);
    return alpha >= kAlphaVisibleThreshold;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    
    BOOL superResult = [super pointInside:point withEvent:event];
    if (!superResult) {
        return superResult;
    }
    
    if (CGPointEqualToPoint(point, self.previousTouchPoint)) {
        return self.previousTouchHitTestResponse;
    } else {
        self.previousTouchPoint = point;
    }
    
    BOOL response = NO;
    
    if (self.buttonImage == nil && self.buttonBackground == nil) {
        
        response = YES;
        
    } else if (self.buttonImage != nil && self.buttonBackground == nil) {
        
        response = [self isAlphaVisibleAtPoint:point forImage:self.buttonImage];
        
    } else if (self.buttonImage == nil && self.buttonBackground != nil) {
        
        response = [self isAlphaVisibleAtPoint:point forImage:self.buttonBackground];
        
    } else {
        
        if ([self isAlphaVisibleAtPoint:point forImage:self.buttonImage]) {
            response = YES;
        } else {
            response = [self isAlphaVisibleAtPoint:point forImage:self.buttonBackground];
        }
    }
    
    self.previousTouchHitTestResponse = response;
    return response;
}

#pragma mark - Accessors

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self updateImageCacheForCurrentState];
    [self resetHitTestCache];
}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state {
    [super setBackgroundImage:image forState:state];
    [self updateImageCacheForCurrentState];
    [self resetHitTestCache];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self updateImageCacheForCurrentState];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self updateImageCacheForCurrentState];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self updateImageCacheForCurrentState];
}


#pragma mark - Helper methods

- (void)updateImageCacheForCurrentState {
    _buttonBackground = [self currentBackgroundImage];
    _buttonImage = [self currentImage];
}

- (void)resetHitTestCache {
    self.previousTouchPoint = CGPointMake(CGFLOAT_MIN, CGFLOAT_MIN);
    self.previousTouchHitTestResponse = NO;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
