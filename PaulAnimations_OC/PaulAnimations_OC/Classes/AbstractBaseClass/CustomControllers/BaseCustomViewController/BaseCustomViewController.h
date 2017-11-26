//
//  BaseCustomViewController.h
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/26.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "CustomViewController.h"
#import "ShowLoadingView.h"
#import "ControllerBaseViewConfig.h"

@interface BaseCustomViewController : CustomViewController

extern NSString * const windowAreaId;
extern NSString * const loadingAreaId;
extern NSString * const titleViewId;
extern NSString * const contentViewId;
extern NSString * const backgroundViewId;

@property (nonatomic,strong) ShowLoadingView *windowAreaView;
@property (nonatomic,strong) ShowLoadingView *loadingAreaView;
@property (nonatomic,strong) UIView          *titleView;
@property (nonatomic,strong) UIView          *contentView;

#pragma mark - Overwrite by subclass
- (void)makeViewsConfig:(NSMutableDictionary <NSString *, ControllerBaseViewConfig *> *)viewsConfig;

-(void)setupDataSource;

-(void)setupSubViews;


@end
