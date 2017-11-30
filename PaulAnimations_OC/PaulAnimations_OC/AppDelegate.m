//
//  AppDelegate.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/15.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "AppDelegate.h"
#import "AnimationsListViewNavController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *vc = [ViewController new];
    
    AnimationsListViewNavController *nav = [[AnimationsListViewNavController alloc]initWithRootViewController:vc setNavigationBarHidden:true];
    self.window.rootViewController = nav;
    self.window.backgroundColor    = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
