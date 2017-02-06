//
//  ACMineVC.m
//  AntDemoShow
//
//  Created by Guo Xuelei on 2016/12/3.
//  Copyright © 2016年 Qi Le. All rights reserved.
//

#import "ACMineVC.h"
#import "macro.h"
#import "RCCell.h"
#import "RCUserInfoCell.h"
#import "RCGroup.h"

@interface ACMineVC ()

@end

@implementation ACMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self.tableView registerClass:[RCCell class] forCellReuseIdentifier:@"RCCell"];
    [self.tableView registerClass:[RCUserInfoCell class] forCellReuseIdentifier:@"RCUserInfoCell"];
    self.tableView.backgroundColor = [UIColor tableBgColor];
    [self initData];
    [self addIMListener];
    // Do any additional setup after loading the view.
}

- (void)addIMListener
{
    [[IMAPlatform sharedInstance].contactMgr addContactChangedObserver:self handler:@selector(onBlackListChanged:) forEvent:EIMAContact_BlackListEvents];
}

- (void)onBlackListChanged:(NSNotification *)notify
{
    dispatch_async(dispatch_get_main_queue(), ^{
        IMAContactChangedNotifyItem *item = (IMAContactChangedNotifyItem *) notify.object;
        switch (item.type)
        {
            case EIMAContact_BlackListAddIn:
            case EIMAContact_BlackListMoveOut:
            {
//                RichCellMenuItem *item = [self getItemWithKey:@"黑名单"];
//                
//                if (item)
//                {
//                    item.value = [NSString stringWithFormat:@"%d人", (int)[[IMAPlatform sharedInstance].contactMgr.blackList count]];
//                    NSIndexPath *index = [self getIndexOfKey:@"黑名单"];
//                    if (index)
//                    {
//                        [self.tableView beginUpdates];
//                        [self.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
//                        [self.tableView endUpdates];
//                    }
//                }
            }
                break;
                
            default:
                break;
        }
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData {
    RCItem *temp = RCCreateItem(nil,nil);
    NSArray *items1 = @[temp];
    RCGroup *group1 = RCCreateGroup(nil, nil,items1);
    
    RCItem *friendApply = RCCreateItem(@"好友申请",nil);
    RCItem *blackList = RCCreateItem(@"黑名单",nil);
    NSArray *items2 = @[friendApply,blackList];
    RCGroup *group2 = RCCreateGroup(nil, nil,items2);

    RCItem *about = RCCreateItem(@"关于",nil);
    RCItem *setting = RCCreateItem(@"设置",nil);
    NSArray *items3 = @[setting,about];
    RCGroup *group3 = RCCreateGroup(nil, nil,items3);
    
    self.dataSource = [NSMutableArray arrayWithArray:@[group1,group2,group3]];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource[section] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        RCUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCUserInfoCell"];
        cell.host = [IMAPlatform sharedInstance].host;
        return cell;
    }
    RCCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCCell"];
    RCItem *item = [self.dataSource[indexPath.section] objectAtIndex:indexPath.row];
    [cell setItem:item];
    return cell;
}

#pragma mark UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RCItem *item = [self.dataSource[indexPath.section] objectAtIndex:indexPath.row];
    if ([item.title isEqualToString:@"好友申请"]) {

    }else if ([item.title isEqualToString:@"黑名单"]) {

    }else if ([item.title isEqualToString:@"关于"]) {
        
    }else{
 
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 90;
    }
    return 44.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0f;
}

- (void)dealloc
{
    [[IMAPlatform sharedInstance].contactMgr removeContactChangedObser:self];
}

@end
