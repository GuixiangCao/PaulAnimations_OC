//
//  Item.h
//  PaulAnimations_OC
//
//  Created by paul on 2017/12/6.
//  Copyright © 2017年 paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) id        object;

+(instancetype)itemWithName:(NSString *)name object:(id)objcect;
+(instancetype)itemWithObject:(id)object name:(NSString *)name;

@property (nonatomic) NSInteger index;
@property (nonatomic,strong,readonly) NSMutableAttributedString *nameString;

-(void)createAttributedString;

@end
