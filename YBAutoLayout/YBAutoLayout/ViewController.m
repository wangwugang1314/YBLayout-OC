//
//  ViewController.m
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/3/8.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YBLayout.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>


/**
 tableView
 */
@property(nonatomic, weak) UITableView *tableView;


/**
 数据数组
 */
@property(nonatomic, strong) NSArray *dataArr;

@end

#define CellIdenfifier @"CellIdenfifier"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [UITableView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdenfifier];
    // 平铺父试图
    [self.view yb_fill:tableView edge: UIEdgeInsetsZero isAdd:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdenfifier];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = [NSString stringWithFormat:@"YBLayoutController%02zd", indexPath.row + 1];
    UIViewController *vc = [NSClassFromString(str) new];
    vc.title = self.dataArr[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 懒加载
- (NSArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = @[@"平铺(单个子试图)",
                     @"平铺(多个子试图横向)",
                     @"平铺(多个子试图纵向)"];
    }
    return _dataArr;
}


@end
