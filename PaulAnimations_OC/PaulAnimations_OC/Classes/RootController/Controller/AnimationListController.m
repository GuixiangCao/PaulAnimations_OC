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

@interface AnimationListController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) DefaultNotificationCenter *notificationCenter;

@end

@implementation AnimationListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self rootViewControllerSetup];
}

#pragma mark - RootViewController setup.

-(void)rootViewControllerSetup {
    self.navigationController.delegate = self;
    
    [self useInteractivePopGestureRecognizer];
    
}

-(void)configureNotification{
//    self.notificationCenter = [DefaultNotificationCenter defaultNotificationCenterWithDelegate:self addNotificationNames:^(NSMutableArray<NSString *> *names) {
//        [names addObject: NotificationEvent.ShowHomePageTableView];
//    }];
}


@end
