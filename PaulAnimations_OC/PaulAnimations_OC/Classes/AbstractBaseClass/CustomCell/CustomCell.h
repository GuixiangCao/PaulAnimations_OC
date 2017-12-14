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

@property (nonatomic,weak) id <CustomCellDelegate> degate;
@property (nonatomic,strong) CellDataAdapter *adapter;
@property (nonatomic)        BOOL             display;

@property (nonatomic,weak)   id                data;
@property (nonatomic,weak)   NSIndexPath      *indexPath;
@property (nonatomic,weak)   UITableView      *tableView;
@property (nonatomic,weak)   UIViewController *controller;

/**
 *  Create the cell's dataAdapter, the CellReuseIdentifier is the cell's class string.
 *  @param data            Cell's data, can be nil.
 *  @return Cell's dataAdapter.
 */
+(CellDataAdapter *)dataAdapterWithData:(id)data;

/**
 Set the dataAdapter and load content.
 @param dataAdapter The CellDataAdapter.
 */
- (void)loadContentWithAdapter:(CellDataAdapter *)dataAdapter;

- (void)loadContentWithAdapter:(CellDataAdapter *)dataAdapter
                      delegate:(id <CustomCellDelegate>)delegate
                     tableView:(UITableView *)tableView
                     indexPath:(NSIndexPath *)indexPath;


+(void)registerToTableView:(UITableView *)tableView;

#pragma mark - Method overwrited by subclass
-(void)setupCell;

-(void)buildSubview;

-(void)loadContent;

@end

#pragma mark - UITableView category.
@interface UITableView (CustomCell)

- (void)selectedEventAtIndexPath:(NSIndexPath *)indexPath;

- (CustomCell *)dequeueReusableCellAndLoadDataWithAdapter:(CellDataAdapter *)adapter
                                                 delegate:(id <CustomCellDelegate>)delegate
                                                indexPath:(NSIndexPath *)indexPath;
@end

