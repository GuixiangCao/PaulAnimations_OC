//
//  DefaultNotificationCenter.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/29.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "DefaultNotificationCenter.h"

@interface DefaultNotificationModel : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic)        BOOL     effective;

@end

@implementation DefaultNotificationModel

@end

@interface DefaultNotificationCenter()

@property (nonatomic,strong) NSMutableArray <DefaultNotificationModel *> *stringArr;

@end

@implementation DefaultNotificationCenter

-(instancetype)init{

    if (self = [super init]) {
        self.stringArr = [NSMutableArray array];
    }
    return self;
}

+(void)postName:(NSString *)name withObject:(id)object
{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:name object:object];
    
}

+(instancetype)addNotificationCenterDelegate:(id<DefaultNotiDelegate>)delegate addNotificationNames:(void (^)(NSMutableArray<NSString *> *))addNotificationNames
{
    
    NSMutableArray *arr = nil;
    
    DefaultNotificationCenter *notiCenter = [[DefaultNotificationCenter alloc]init];
    notiCenter.delegate                   = delegate;
    
    if (addNotificationNames) {
        arr = [NSMutableArray array];
        addNotificationNames(arr);
    }
    
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [notiCenter addNotiNames:obj];
    }];
    
    return notiCenter;
}

-(void)addNotiNames:(NSString *)name{
    
    DefaultNotificationModel *model = [DefaultNotificationModel new];
    model.name                      = name;
    model.effective                 = true;
    
    [self.stringArr addObject:model];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationEvent:) name:name object:nil];
}

-(void)notificationEvent:(NSNotification *)noti{
    if (self.delegate && [self.delegate respondsToSelector:@selector(defaultNotification:name:object:)]) {
        [self.delegate defaultNotification:self name:noti.name  object:nil];
    }
}
@end
