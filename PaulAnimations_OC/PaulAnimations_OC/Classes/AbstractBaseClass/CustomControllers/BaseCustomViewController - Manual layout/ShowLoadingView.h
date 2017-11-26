//
//  ShowLoadingView.h
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/26.
//  Copyright © 2017年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowLoadingView : UIView

@property (nonatomic,readonly) NSInteger count;

-(void)push;

-(void)pop;

@end
