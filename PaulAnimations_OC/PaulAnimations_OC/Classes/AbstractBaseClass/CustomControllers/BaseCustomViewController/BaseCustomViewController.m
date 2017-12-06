//
//  BaseCustomViewController.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/26.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "BaseCustomViewController.h"

@interface BaseCustomViewController ()

@property (nonatomic,strong) NSMutableDictionary <NSString *,ControllerBaseViewConfig *> *viewConfigs;

@end

@implementation BaseCustomViewController

NSString * const titleViewId       = @"titleViewId";
NSString * const loadingAreaViewId = @"loadingAreaViewId";
NSString * const windowAreaViewId  = @"windowAreaViewId";
NSString * const contentViewId     = @"contentViewId";
NSString * const backgroundViewId  = @"backgroundViewId";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = false;
    [self initViewConfigs];
    [self makeViewsConfig:self.viewConfigs];
    [self buildConfigViews];
    [self setupSubViews];
    [self setupDataSource];
}

-(void)initViewConfigs{
    
    self.viewConfigs = [NSMutableDictionary dictionary];
    CGFloat width    = [UIScreen mainScreen].bounds.size.width;
    CGFloat height   = [UIScreen mainScreen].bounds.size.height;
    
    //backgroundView config
    {
        ControllerBaseViewConfig *config   = [ControllerBaseViewConfig new];
        config.exist                       = true;
        config.frame                       = CGRectMake(0, 0, width, height);
        config.backgroundColor             = [UIColor whiteColor];
        self.viewConfigs[backgroundViewId] = config;
        
    }
    
    //contentView config
    {
        ControllerBaseViewConfig *config   = [ControllerBaseViewConfig new];
        config.exist                       = true;
        config.backgroundColor             = [UIColor clearColor];
        config.frame                       = CGRectMake(0, 64, width, height - 64);
        self.viewConfigs[contentViewId]    = config;
    }
    
    // titleView config.
    {
        ControllerBaseViewConfig *config = [ControllerBaseViewConfig new];
        config.exist                     = YES;
        config.frame                     = CGRectMake(0, 0, width, 64.f);
        config.backgroundColor           = [UIColor clearColor];
        self.viewConfigs[titleViewId]    = config;
    }
    
    // loadingAreaView config.
    {
        ControllerBaseViewConfig *config    = [ControllerBaseViewConfig new];
        config.exist                        = YES;
        config.frame                        = CGRectMake(0, 64, width, height - 64.f);
        config.backgroundColor              = [UIColor clearColor];
        self.viewConfigs[loadingAreaViewId] = config;
    }
    
    // windowAreaView config.
    {
        ControllerBaseViewConfig *config   = [ControllerBaseViewConfig new];
        config.exist                       = YES;
        config.frame                       = CGRectMake(0, 0, width, height);
        config.backgroundColor             = [UIColor clearColor];
        self.viewConfigs[windowAreaViewId] = config;
    }
}

-(void)buildConfigViews{
    //backgroundView
    {
        ControllerBaseViewConfig *config = self.viewConfigs[backgroundViewId];
        if (config && config.exist) {
            UIView *view = [[UIView alloc]initWithFrame:config.frame];
            [self.view addSubview: view];
            self.backgroundView = view;
        }
    }
    
    //contentView
    {
        ControllerBaseViewConfig *config = self.viewConfigs[contentViewId];
        if (config && config.exist) {
            UIView *view     = [[UIView alloc]initWithFrame:config.frame];
            self.contentView = view;
            [self.view addSubview:self.contentView];
        }
    }
    
    //titleView
    {
        ControllerBaseViewConfig *config = self.viewConfigs[titleViewId];
        if (config && config.exist) {
            UIView *view   = [[UIView alloc]initWithFrame:config.frame];
            self.titleView = view;
            [self.view addSubview:view];
        }
    }
    
    //loadingAreaView
    {
        ControllerBaseViewConfig *config = self.viewConfigs[loadingAreaViewId];
        if (config && config.exist) {
            ShowLoadingView *view         = [[ShowLoadingView alloc]initWithFrame:config.frame];
            self.loadingAreaView = view;
            [self.view addSubview:view];
        }
    }
    
    //windowAreaView
    {
        ControllerBaseViewConfig *config = self.viewConfigs[windowAreaViewId];
        if (config && config.exist) {
            ShowLoadingView *view = [[ShowLoadingView alloc]initWithFrame:config.frame];
            self.windowAreaView   = view;
            [self.view addSubview:view];
        }
    }
}

#pragma mark - Overwrite by subclass.

- (void)makeViewsConfig:(NSMutableDictionary <NSString *, ControllerBaseViewConfig *> *)viewsConfig {
    
}

- (void)setupSubViews {
    
}

- (void)setupDataSource {
    
}

@end
