//
//  AnimationListController.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/29.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "AnimationListController.h"
#import "DefaultNotificationCenter.h"
#import "NotificationEvent.h"
#import "GCD.h"
#import "UIView+SetRect.h"
#import "BackgroundLineView.h"

@interface AnimationListController ()<UINavigationControllerDelegate,DefaultNotiDelegate>

@property (nonatomic, strong) DefaultNotificationCenter *notificationCenter;

@end

@implementation AnimationListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self rootViewControllerSetup];
    
    [self configureNotification];
    
    [self configTitleView];
}

#pragma mark - RootViewController setup.

-(void)rootViewControllerSetup {
    self.navigationController.delegate = self;
    
    [self useInteractivePopGestureRecognizer];
}

-(void)configureNotification{
    self.notificationCenter = [DefaultNotificationCenter addNotificationCenterDelegate:self addNotificationNames:^(NSMutableArray<NSString *> *names) {
        [names addObject: NotificationEvent.ShowHomePageTableView];
    }];
}

#pragma mark - DefaultNotificationCenterDelegate

-(void)defaultNotification:(DefaultNotificationCenter *)noti name:(NSString *)name object:(id)object{
    if ([name isEqualToString:NotificationEvent.ShowHomePageTableView]) {
        [GCDQueue executeInMainQueue:^{
            NSLog(@"noti");
        }];
    }
}
-(void)configTitleView{
    
    BackgroundLineView *lineView = [BackgroundLineView backGroundLineWithFrame:CGRectMake(0, 0, Width, 64)                                                 lineWidth:4 lienGap:4 lineColor:[[UIColor blackColor] colorWithAlphaComponent:0.12] rotate:M_PI_4];
    
    [self.titleView addSubview:lineView];
}


@end
