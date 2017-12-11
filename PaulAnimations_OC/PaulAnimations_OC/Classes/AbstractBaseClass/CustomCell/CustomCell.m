//
//  CustomCell.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/12/8.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupCell];
        [self buildSubview];
    }
    return self;
}

-(void)buildSubview
{
    
}

-(void)setupCell{
    
}

-(void)loadContent{
    
}

-(void)selectedEvent{
    
    [self delegateEvent];
}

-(void)delegateEvent{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customCell:event:)]) {
        [self.delegate customCell:self event:self.data];
    }
}

-(void)loadContentWithAdapter:(CellDataAdapter *)dataAdapter
                     delegate:(id <CustomCellDelegate>)delegate
                    tableView:(UITableView *)tableView
                    indexPath:(NSIndexPath *)indexPath{
    _adapter     = dataAdapter;
    _data        = dataAdapter.data;
    _indexPath   = indexPath;
    _delegate    = delegate;
    _tableView   = tableView;
    [self loadContent];
}

+(CellDataAdapter *)dataAdapterWithData:(id)data{
    
    return [[self class] dataAdapterWithCellReuseIdentifier:nil data:data cellHeight:0 type:0];
}

+(void)registerToTableView:(UITableView *)tableView{
    
    [tableView registerClass:[self class] forCellReuseIdentifier:NSStringFromClass([self class])];
}

#pragma mark - Normal type adapter.
+(CellDataAdapter *)dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                  data:(id)data
                                            cellHeight:(CGFloat)height
                                                  type:(NSInteger)type{
    NSString *tmpReuseIdentifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    return [CellDataAdapter cellDataApaterWithCellReuseIdentifier:tmpReuseIdentifier data:data cellHeight:height cellType:type];
}

@end

#pragma mark - UITableView(CustomCell)
@implementation UITableView (CustomCell)

-(CustomCell *)dequeueReuseableCellAndLoadWithAdapter:(CellDataAdapter *)adapter delegate:(id<CustomCellDelegate>)delegate indexPath:(NSIndexPath *)indexPath{
    
    CustomCell *cell = [self dequeueReusableCellWithIdentifier:adapter.cellReuseIdentifier forIndexPath:indexPath];
    
    [cell loadContentWithAdapter:adapter delegate:delegate tableView:self indexPath:indexPath];
    return cell;
}

-(void)selectedEventAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCell *cell = [self cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[CustomCell class]]) {
        [cell selectedEvent];
    }
}

@end
