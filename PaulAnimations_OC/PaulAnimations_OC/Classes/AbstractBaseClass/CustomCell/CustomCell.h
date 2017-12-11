//
//  CustomCell.h
//  PaulAnimations_OC
//
//  Created by paul on 2017/12/8.
//  Copyright © 2017年 paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CellDataAdapter.h"

@class CustomCell;
@protocol CustomCellDelegate <NSObject>

@optional

-(void)customCell:(CustomCell *)cell event:(id)event;

@end

@interface CustomCell : UITableViewCell

@property (nonatomic,weak) id <CustomCellDelegate> delegate;

@property (nonatomic,strong) CellDataAdapter *adapter;

@property (nonatomic) BOOL display;

@property (nonatomic, weak) id data;

@property (nonatomic, weak) NSIndexPath *indexPath;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIViewController *controller;



#pragma mark - Method overwrited by subclass
-(void)setupCell;

-(void)buildSubview;

-(void)loadContent;

+(CellDataAdapter *)dataAdapterWithData:(id)data;

+(void)registerToTableView:(UITableView *)tableView;

@end

#pragma mark - UITableView category.
@interface UITableView (CustomCell)

-(CustomCell *)dequeueReuseableCellAndLoadWithAdapter:(CellDataAdapter *)adapter delegate:(id <CustomCellDelegate>)delegate indexPath : (NSIndexPath *)indexPath;

-(void)selectedEventAtIndexPath:(NSIndexPath *)indexPath;

@end

