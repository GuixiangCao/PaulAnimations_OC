//
//  AnimationsListViewNavController.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/29.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "AnimationsListViewNavController.h"
#import "AppleSystemService.h"
#import "UIView+AnimationProperty.h"
#import "DefaultNotificationCenter.h"
#import "NotificationEvent.h"

@interface AnimationsListViewNavController ()

@end

@implementation AnimationsListViewNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    iconImageView.image        = AppleSystemService.launchImage;
    [self.view addSubview:iconImageView];
    
    [UIView animateKeyframesWithDuration:1.f delay:2.f options:0 animations:^{
        
        iconImageView.scale = 1.2f;
        iconImageView.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        [DefaultNotificationCenter postEventToNotificationName:NotificationEvent.ShowHomePageTableView object:nil];
        [iconImageView removeFromSuperview];
    }];
}

@end
