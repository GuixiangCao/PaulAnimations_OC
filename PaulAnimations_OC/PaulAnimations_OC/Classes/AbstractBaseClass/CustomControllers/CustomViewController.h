//
//  CustomViewController.h
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/26.
//  Copyright © 2017年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomViewController;

@protocol CustomViewControllerDelegate <NSObject>

@end

@interface CustomViewController : UIViewController

@property (nonatomic,weak) id <CustomViewControllerDelegate> eventDelegate;

-(void)useInteractivePopGestureRecognizer;

@property (nonatomic)  BOOL  enableInteractivePopGestureRecognizer;

- (void)popViewControllerAnimated:(BOOL)animated;

- (void)popToRootViewControllerAnimated:(BOOL)animated;

@end
