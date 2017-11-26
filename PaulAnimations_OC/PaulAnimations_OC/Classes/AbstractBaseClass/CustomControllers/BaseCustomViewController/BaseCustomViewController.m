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
}


#pragma mark - Overwrite by subclass.

- (void)makeViewsConfig:(NSMutableDictionary <NSString *, ControllerBaseViewConfig *> *)viewsConfig {
    
}

- (void)setupSubViews {
    
}

- (void)setupDataSource {
    
}

@end
