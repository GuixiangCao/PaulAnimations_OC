//
//  CellDataAdapter.h
//  PaulAnimations_OC
//
//  Created by paul on 2017/12/7.
//  Copyright © 2017年 paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CellDataAdapter : NSObject

@property (nonatomic,strong) NSString *cellReuseIdentifier;

@property (nonatomic,strong) id        data;
@property (nonatomic)        CGFloat   cellHeight;
@property (nonatomic)        CGFloat   cellWidth;
@property (nonatomic)        NSInteger cellType;
@property (nonatomic,weak)   UITableView      *tableView;
@property (nonatomic,weak)   UICollectionView *collection;
@property (nonatomic,weak)   NSIndexPath      *indexPath;

+(CellDataAdapter *)cellDataApaterWithCellReuseIdentifier:(NSString *)reuseString
                                                     data:(id)data
                                               cellHeight:(CGFloat)cellHeight cellType:(NSInteger)cellType;
@end
