//
//  AnimationListController.m
//  PaulAnimations_OC
//
//  Created by paul on 2017/11/29.
//  Copyright © 2017年 paul. All rights reserved.
//

#import "AnimationListController.h"
#import "DefaultNotificationCenter.h"
#import "NotificationEvent.h"
#import "GCD.h"
#import "UIView+SetRect.h"
#import "BackgroundLineView.h"
#import "Item.h"
#import "CellDataAdapter.h"
#import "ViewController.h"
#import "ListItemCell.h"
#import "testViewController.h"

@interface AnimationListController ()<UINavigationControllerDelegate,DefaultNotificationCenterDelegate,UITableViewDelegate,UITableViewDataSource,CustomCellDelegate>

@property (nonatomic, strong) DefaultNotificationCenter *notificationCenter;
@property (nonatomic, strong) UITableView               *tableView;
@property (nonatomic) BOOL                               tableViewLoadData;

@property (nonatomic, strong) NSMutableArray <CellDataAdapter *> *items;

@end

@implementation AnimationListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self rootViewControllerSetup];
    
    [self configureNotification];
    
    [self configTitleView];
    
    [self configureDataSource];
    
    [self configureTableView];
    
}

#pragma mark - RootViewController setup.

-(void)rootViewControllerSetup {
    self.navigationController.delegate = self;
    
    [self useInteractivePopGestureRecognizer];
}

-(void)configureNotification{
    self.notificationCenter = [DefaultNotificationCenter defaultNotificationCenterWidthDelegate:self addNotificationNames:^(NSMutableArray<NSString *> *names) {
        [names addObject:NotificationEvent.ShowHomePageTableView];
    }];
}

#pragma mark - DefaultNotificationCenterDelegate

-(void)defaultNotificationCenter:(DefaultNotificationCenter *)nofification name:(NSString *)name objec:(id)object{
    if ([name isEqualToString:NotificationEvent.ShowHomePageTableView]) {
        [GCDQueue executeInMainQueue:^{
            NSLog(@"noti");
            self.tableViewLoadData = true;
            NSMutableArray *arr = [NSMutableArray array];
            for (int i = 0; i < self.items.count; i++) {
                [arr addObject:[NSIndexPath indexPathForRow:i inSection:0]];
            }
            [self.tableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationFade];
        }];
    }
}

-(void)configTitleView{
    
    BackgroundLineView *lineView = [BackgroundLineView backGroundLineWithFrame:CGRectMake(0, 0, Width, 64)                                                 lineWidth:4 lienGap:4 lineColor:[[UIColor blackColor] colorWithAlphaComponent:0.12] rotate:M_PI_4];
    
    [self.titleView addSubview:lineView];
}

-(void)configureTableView {
    
    self.tableView            = [[UITableView alloc]initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight  = 50.f;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.contentView addSubview: self.tableView];
    [ListItemCell registerToTableView:self.tableView];
}

-(void)configureDataSource {
    
    NSArray *array = @[[Item itemWithObject:[testViewController class] name:@"UITableView状态切换效果"],
                       [Item itemWithObject:[testViewController class] name:@"UITableView状态切换效果"],
                       [Item itemWithObject:[testViewController class] name:@"UITableView状态切换效果"],
                       [Item itemWithObject:[ViewController class] name:@"UITableView状态切换效果"],
                       [Item itemWithObject:[ViewController class] name:@"UITableView状态切换效果"],
                       [Item itemWithObject:[ViewController class] name:@"UITableView状态切换效果"],
                       [Item itemWithObject:[ViewController class] name:@"UITableView状态切换效果"],
                       [Item itemWithObject:[ViewController class] name:@"UITableView状态切换效果"],
                       [Item itemWithObject:[ViewController class] name:@"UITableView状态切换效果"],
                       [Item itemWithObject:[ViewController class] name:@"UITableView状态切换效果"],
                       [Item itemWithObject:[ViewController class] name:@"UITableView状态切换效果"],
                       [Item itemWithObject:[ViewController class] name:@"UITableView状态切换效果"]];
    
    self.items = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
     
        Item *item = array[i];
        item.index = i + 1;
        [item createAttributedString];
        [self.items addObject:[ListItemCell dataAdapterWithData:item]];
    }
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tableViewLoadData ? self.items.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView dequeueReusableCellAndLoadDataWithAdapter:_items[indexPath.row] delegate:self indexPath:indexPath];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView selectedEventAtIndexPath:indexPath];
}

-(void)customCell:(CustomCell *)cell event:(id)event{
    
    if ([cell isKindOfClass:[ListItemCell class]]) {
        Item *item = event;
        UIViewController *controller = [item.object new];
        controller.title              = item.name;
        [self.navigationController pushViewController:controller animated:YES];
    }
}

//-(void)customCell:(CustomCell *)cell event:(id)event

@end
