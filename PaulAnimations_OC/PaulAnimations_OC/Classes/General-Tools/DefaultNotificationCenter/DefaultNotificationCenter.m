//
//  DefaultNotificationCenter.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/29.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "DefaultNotificationCenter.h"
@interface DefautNotifticationCenterModel : NSObject

@property (nonatomic) BOOL             effective;
@property (nonatomic,strong) NSString *name;

@end

@implementation DefautNotifticationCenterModel

@end

@interface DefaultNotificationCenter()

@property (nonatomic,strong) NSMutableArray <DefautNotifticationCenterModel *> *stringArr;

@end

@implementation DefaultNotificationCenter

-(instancetype)init{
    
    if (self = [super init]) {
        self.stringArr = [NSMutableArray new];
    }
    return  self;
}

+(void)postNotificaitonWithName:(NSString *)name objectc:(id)object
{
    [[NSNotificationCenter defaultCenter]postNotificationName:name object:object];
}

+(instancetype)defaultNotoficationDelegate:(id<DefaultNotificationCenterDelegate>)delegate addNotificationName:(void (^)(NSMutableArray<NSString *> *))addNotificationsBlock
{
    NSMutableArray *arr = nil;
    
    DefaultNotificationCenter *notiCenter = [[[self class] alloc]init];
    notiCenter.delegate                   = delegate;
    
    if (addNotificationsBlock) {
        arr = [NSMutableArray new];
        addNotificationsBlock(arr);
    }
    
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [notiCenter addNotiName:obj];
        
    }];
    return notiCenter;
}

-(void)addNotiName:(NSString *)name{
    
    DefautNotifticationCenterModel *model = [DefautNotifticationCenterModel new];
    model.name                            = name;
    model.effective                       = true;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiEvent:) name:name object:nil];
}

-(void)notiEvent:(NSNotification *)noti{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(defaultNotificationwWithDelegate:name:object:)]) {
        [self.delegate defaultNotificationwWithDelegate:self name:noti.name object:noti.object];
    }
}

@end
