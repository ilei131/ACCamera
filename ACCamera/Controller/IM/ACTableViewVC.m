//
//  ACTableViewVC.m
//  ACCamera
//
//  Created by zhanggf on 17/2/3.
//  Copyright © 2017年 Zhanggf. All rights reserved.
//

#import "ACTableViewVC.h"

@interface ACTableViewVC ()

@end

@implementation ACTableViewVC

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
    self.tableView = nil;
    self.dataSource = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadTableComponent];
}

//-(void)viewDidLayoutSubviews
//{
//    CGRect rect = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds),CGRectGetHeight(self.view.bounds));
//    self.tableView.frame = rect;
//    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//
//    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
//    }
//
//    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
//        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
//    }
//}

- (void)loadTableComponent {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH) style:UITableViewStylePlain];
    if (iOS(9)) {
        _tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //_tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    if (!self.dataSource) {
        self.dataSource = [NSMutableArray array];
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.tableView = nil;
    self.dataSource = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DefaultTableViewCell"];
}

@end

@implementation RSGroupedTableViewController

- (void)loadTableComponent {
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = nil;
    //self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.separatorColor = RGBHexColor(0xdfdfdf);
    [self.view addSubview:self.tableView];
    
    if (!self.dataSource) {
        self.dataSource = [NSMutableArray array];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//}
//-(void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
//    }
//
//    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
//        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
//    }
//}

@end
