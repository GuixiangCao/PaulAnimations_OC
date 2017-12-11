
//
//  Item.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/12/6.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "Item.h"

@interface Item ()

@property (nonatomic,strong) NSMutableAttributedString *nameString;

@end

@implementation Item

+(instancetype)itemWithName:(NSString *)name object:(id)objcect{
    Item *item  = [[[self class] alloc]init];
    item.name   = name;
    item.object = objcect;
    
    return item;
}

+ (instancetype)itemWithObject:(id)object name:(NSString *)name {
    
    Item *item  = [[[self class] alloc] init];
    item.name   = name;
    item.object = object;
    
    return item;
}

-(void)createAttributedString{
    
     NSString *fullStirng = [NSString stringWithFormat:@"%02ld. %@", (long)self.index, self.name];
    
    self.name = fullStirng;
}

@end
