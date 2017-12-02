//
//  BackgroundLineView.h
//  PaulAnimations_OC
//
//  Created by paul on 2017/12/2.
//  Copyright © 2017年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackgroundLineView : UIView

@property (nonatomic,strong) UIColor *lineColor;

@property (nonatomic) CGFloat lineWidth;

@property (nonatomic) CGFloat lineGap;

@property (nonatomic) CGFloat rotate;


//+(instancetype)backGroundLineWithFrame:(CGRect)frame lineWith:(CGFloat)lineWidth lineGap:(CGFloat)lineGap
//                             lineColor:(UIColor *)lineColor rotate:(CGFloat)rotate;
@end
