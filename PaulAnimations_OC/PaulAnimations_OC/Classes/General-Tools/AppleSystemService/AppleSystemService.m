
//
//  AppleSystemService.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/29.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "AppleSystemService.h"

@implementation AppleSystemService

+(UIImage *)launchImage{
    UIImage               *launchImage      = nil;
    NSString              *viewOrientation = nil;
    CGSize                 viewSize        = [UIScreen mainScreen].bounds.size;
    UIInterfaceOrientation orientaion      = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (orientaion == UIInterfaceOrientationLandscapeLeft || orientaion == UIInterfaceOrientationLandscapeRight) {
        viewOrientation = @"Landscape";
    }else{
        viewOrientation = @"Portrait";
    }
    
    NSArray *imageDictionary = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    
    for (NSDictionary *dict in imageDictionary) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            launchImage = [UIImage imageNamed:dict[@"UILaunchImageName"]];
        }
    }
    
    return launchImage;
}

@end
