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

-(void)defaultNotificationCenter:(DefaultNotificationCenter *)notification name:(NSString *)name object:(id)object;

@end

@interface DefaultNotificationCenter : NSObject

@property (nonatomic,weak) id<DefaultNotificationCenterDelegate> delegate;

+(instancetype)notificationDelegate:(id <DefaultNotificationCenterDelegate>)delegate
               addNotificationNames:(void(^)(NSMutableArray <NSString *> *names))addnotificationNameBlcok;

+ (void)postEventToNotificationName:(NSString *)name object:(id)object;

@end
