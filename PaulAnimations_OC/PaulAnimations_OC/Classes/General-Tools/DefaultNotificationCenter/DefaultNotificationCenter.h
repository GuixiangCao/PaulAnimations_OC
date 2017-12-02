//
//  DefaultNotificationCenter.h
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/29.
//  Copyright © 2017年 paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DefaultNotificationCenter;

@protocol DefaultNotificationCenterDelegate <NSObject>

@required

-(void)defaultNotificationwWithDelegate:(DefaultNotificationCenter *)noti name:(NSString *)name object:(id)object;

@end

@interface DefaultNotificationCenter : NSObject

@property (nonatomic,weak) id <DefaultNotificationCenterDelegate> delegate;

+(void)postNotificaitonWithName:(NSString *)name objectc:(id)object;

+(instancetype)defaultNotoficationDelegate : (id <DefaultNotificationCenterDelegate>)delegate
                        addNotificationName:(void(^)(NSMutableArray <NSString *> *names))addNotificationsBlock;
@end
