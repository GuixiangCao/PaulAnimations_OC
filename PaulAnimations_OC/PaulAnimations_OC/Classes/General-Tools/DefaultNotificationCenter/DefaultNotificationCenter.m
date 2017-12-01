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
@property (nonatomic)        BOOL     effective;

@end

@implementation DefaultNotificationCenterModel

@end

@interface DefaultNotificationCenter()

@property (nonatomic,strong) NSMutableArray <DefaultNotificationCenterModel *> *stringArray;
@end

@implementation DefaultNotificationCenter

-(instancetype)init{

    if (self = [super init]) {
        self.stringArray = [NSMutableArray new];
    }
    return self;
}

+(instancetype)notificationDelegate:(id<DefaultNotificationCenterDelegate>)delegate addNotificationNames:(void (^)(NSMutableArray<NSString *> *))addnotificationNameBlcok{
    
    NSMutableArray *array = nil;
    
    DefaultNotificationCenter *notiCenter = [[self class] new];
    notiCenter.delegate                   = delegate;
    
    if (addnotificationNameBlcok) {
        array = [NSMutableArray new];
        addnotificationNameBlcok(array);
    }
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [notiCenter addNotification:obj];
        
    }];
     
     return notiCenter;
}

-(void)addNotification:(NSString *)name{
    
    
    DefaultNotificationCenterModel *model = [DefaultNotificationCenterModel new];
    model.name                            = name;
    model.effective                       = true;
    
    [self.stringArray addObject:model];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationEvent:) name:model.name object:nil];
}

-(void)notificationEvent:(id)obj{
    
    NSNotification *noti = obj;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(defaultNotificationCenter:name:object:)]) {
        [self.delegate defaultNotificationCenter:self name:noti.name object:noti.name];
    }
}

+ (void)postEventToNotificationName:(NSString *)name object:(id)object {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object];
}


@end
