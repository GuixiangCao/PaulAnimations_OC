//
//  BaseCustomNavigationController.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/26.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "BaseCustomNavigationController.h"

@interface BaseCustomNavigationController ()

@end

@implementation BaseCustomNavigationController

-(instancetype)initWithRootViewController:(BaseCustomViewController *)rootViewController setNavigationBarHidden:(BOOL)hidden{
    
    BaseCustomNavigationController *nav = [[[self class] alloc]initWithRootViewController:rootViewController];
    [nav setNavigationBarHidden:hidden animated:false];
    
    return nav;
}

@end
