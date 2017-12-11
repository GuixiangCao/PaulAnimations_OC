//
//  CellDataAdapter.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/12/7.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "CellDataAdapter.h"

@implementation CellDataAdapter

+(CellDataAdapter *)cellDataApaterWithCellReuseIdentifier:(NSString *)reuseString data:(id)data cellHeight:(CGFloat)cellHeight cellType:(NSInteger)cellType
{
    CellDataAdapter *adapter    = [[self class] new];
    adapter.cellReuseIdentifier = reuseString;
    adapter.data                = data;
    adapter.cellHeight          = cellHeight;
    adapter.cellWidth           = cellType;
    
    return adapter;
}

@end
