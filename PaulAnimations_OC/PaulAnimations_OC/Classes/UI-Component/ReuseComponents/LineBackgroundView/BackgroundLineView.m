//
//  BackgroundLineView.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/12/2.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "BackgroundLineView.h"


@interface LineBackGround : UIView

@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat lineGap;
@property (nonatomic) CGFloat rotate;
@property (nonatomic,strong) UIColor *lineColor;

+(LineBackGround *)lineBackgroundWithLength:(CGFloat)length;
@end

@interface BackgroundLineView()

@property (nonatomic,strong) LineBackGround *backgroundView;

@end

@implementation BackgroundLineView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.layer.masksToBounds = true;
        
        self.backgroundView = [LineBackGround lineBackgroundWithLength:0];
        [self addSubview:self.backgroundView];
        
        _lineWidth = 5.f;
        _lineGap   = 3.f;
        _lineColor = [UIColor grayColor];
        _rotate    = 0.f;
    }
    
    return  self;
}

//+(instancetype)backGroundLineWithFrame:(CGRect)frame lineWith:(CGFloat)lineWidth lineGap:(CGFloat)lineGap lineColor:(UIColor *)lineColor rotate:(CGFloat)rotate{
//    
//    BackgroundLineView *lineView = [[[self class] alloc]initWithFrame:frame];
////    lineView.lineGap             =
//    
//}

@end

@implementation LineBackGround

+(LineBackGround *)lineBackgroundWithLength:(CGFloat)length{
    
    LineBackGround *view = [[LineBackGround alloc] initWithFrame:CGRectMake(0, 0, length, length)];
    return view;
}

@end;
