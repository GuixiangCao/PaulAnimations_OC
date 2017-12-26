//
//  DefaultNotificationCenter.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/29.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "DefaultNotificationCenter.h"

@interface DefaultNotificationCenterModel : NSObject

@property (nonatomic,strong) NSString *name;

@property (nonatomic) BOOL effective;

@end

@implementation DefaultNotificationCenterModel

@end

@interface DefaultNotificationCenter()

@property (nonatomic,strong) NSMutableArray <DefaultNotificationCenterModel *> *stringArray;

@end

@implementation DefaultNotificationCenter

-(instancetype)init{
    
    if (self = [super init]) {
        self.stringArray = [NSMutableArray array];
    }
    return self;
}

+(void)postEventToNotificationName:(NSString *)name object:(id)object{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil];
}

+(instancetype)defaultNotificationCenterWidthDelegate:(id<DefaultNotificationCenterDelegate>)delegate addNotificationNames:(void (^)(NSMutableArray<NSString *> *))addNamesBlock{
    
//    NSMutableArray *arr = nil;
//
//    DefaultNotificationCenter *notiCenter = [[self class] new];
//    notiCenter.delegate                   = delegate;
//
//    if (addNamesBlock) {
//        arr = [NSMutableArray array];
//        addNamesBlock(arr);
//    }
//    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [notiCenter addNotification:obj];
//    }];
//
//    return notiCenter;
    NSMutableArray *array = nil;
    
    DefaultNotificationCenter *center = [[self class] new];
    center.delegate                   = delegate;
    
    if (addNamesBlock) {
        array = [NSMutableArray array];
        addNamesBlock(array);
    }
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [center addNotification:obj];
    }];
    
    return center;
}

-(void)addNotification:(NSString *)name{
    
    DefaultNotificationCenterModel *model = [DefaultNotificationCenterModel new];
    model.name                            = name;
    model.effective                       = true;
    
    [self.stringArray addObject:model];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationEvent:) name:model.name object:nil];
}

-(void)notificationEvent:(NSNotification *)obj{
    if (self.delegate && [self.delegate respondsToSelector:@selector(defaultNotificationCenter:name:objec:)]) {
        [self.delegate defaultNotificationCenter:self name:obj.name objec:obj.object];
    }
}

@end
