//
//  DefaultNotificationCenter.h
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/29.
//  Copyright © 2017年 paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DefaultNotificationCenter;
@protocol DefaultNotiDelegate <NSObject>

@required

-(void)defaultNotification:(DefaultNotificationCenter *)noti name:(NSString *)name object:(id)object;

@end

@interface DefaultNotificationCenter : NSObject

@property (nonatomic,weak) id <DefaultNotiDelegate> delegate;

+(instancetype)addNotificationCenterDelegate : (id<DefaultNotiDelegate>)delegate
                         addNotificationNames:(void(^)(NSMutableArray <NSString *> *names))addNotificationNames;

+(void)postName :(NSString *)name withObject:(id)object;

@end
