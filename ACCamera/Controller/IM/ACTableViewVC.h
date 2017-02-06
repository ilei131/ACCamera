//
//  ACTableViewVC.h
//  ACCamera
//
//  Created by zhanggf on 17/2/3.
//  Copyright © 2017年 Zhanggf. All rights reserved.
//

#import "ACBaseVC.h"

@interface ACTableViewVC : ACBaseVC<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

- (void)loadTableComponent;

@end

@interface ACGroupedTableViewController : ACTableViewVC

- (void)loadTableComponent;

@end

