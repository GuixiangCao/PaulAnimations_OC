//
//  BaseCustomNavigationController.h
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/26.
//  Copyright © 2017年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCustomViewController.h"

@interface BaseCustomNavigationController : UINavigationController

-(instancetype)initWithRootViewController:(BaseCustomViewController *)rootViewController
                  setNavigationBarHidden :(BOOL)hidden;

@end
