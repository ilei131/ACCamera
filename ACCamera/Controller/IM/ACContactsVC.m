//
//  ACContactsVC.m
//  AntDemoShow
//
//  Created by Guo Xuelei on 2016/12/3.
//  Copyright © 2016年 Qi Le. All rights reserved.
//

#import "ACContactsVC.h"
#import "macro.h"
#import "TLAddMenuView.h"
#import "AddFriendViewController.h"
#import "FEPersonalGroupHeaderView.h"
#import "FEContactsCell.h"

@interface ACContactsVC () <TLAddMenuViewDelegate,FEPersonalGroupHeaderViewDelegate> {
    __weak CLSafeMutableArray *_contact;
}

@property (nonatomic, strong) TLAddMenuView *moreMenu;

@end

@implementation ACContactsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";
    [self addRightItems];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor tableBgColor];
    [self.tableView registerClass:[FEContactsCell class] forCellReuseIdentifier:@"FEContactsCell"];
    self.tableView.sectionHeaderHeight = 50;
    [self loadData];
}

- (void)loadData {
    _contact = [[IMAPlatform sharedInstance].contactMgr subGroupList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addRightItems {
    //更多操作
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreBtn setImage:IMAGE(@"nav_more") forState:UIControlStateNormal];
    //[addBtn setImage:IMAGE(@"nav_more") forState:UIControlStateHighlighted];
    [moreBtn addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
    moreBtn.frame = CGRectMake(0, 0, 30, 30);
    moreBtn.imageEdgeInsets = UIEdgeInsetsMake(6, 6, 6, 6);
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithCustomView:moreBtn];
    self.navigationItem.rightBarButtonItems = @[addItem];
}

- (IBAction)moreAction:(id)sender {
    [self.moreMenu showInView:self.navigationController.view];
}

- (void)dismissCompletion {
    if (_moreMenu) {
        _moreMenu = nil;
    }
}

- (TLAddMenuView *)moreMenu {
    if (!_moreMenu) {
        TLAddMenuItem *addFriend = [TLAddMenuItem createWithType:TLAddMneuTypeNormal title:@"添加好友" iconPath:@"popmenu_add" className:@""];
        TLAddMenuItem *setting = [TLAddMenuItem createWithType:TLAddMneuTypeNormal title:@"设置" iconPath:@"popmenu_setting" className:@""];
        NSArray *items = @[addFriend,setting];
        _moreMenu = [[TLAddMenuView alloc] initWithItems:items style:AddMenuStyleRight];
        _moreMenu.delegate = self;
    }
    return _moreMenu;
}

#pragma -mark TLAddMenuViewDelegate
- (void)addMenuView:(TLAddMenuView *)addMenuView didSelectedItem:(TLAddMenuItem *)item {
    if ([item.title isEqualToString:@"添加好友"]){
        AddFriendViewController *vc = [[AddFriendViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else {//设置

    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _contact.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    IMASubGroup *group = [_contact objectAtIndex:section];
    return group.isFold ? group.friends.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FEContactsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FEContactsCell"];
    IMASubGroup *group = [_contact objectAtIndex:indexPath.section];
    IMAUser *friend = [group.friends objectAtIndex:indexPath.row];
    [cell setContact:friend];
    return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    IMASubGroup *group = [_contact objectAtIndex:indexPath.section];
    IMAUser *friend = [group.friends objectAtIndex:indexPath.row];
//    FEContactsDetailViewController *contactsDetailVC = [[FEContactsDetailViewController alloc] init];
//    contactsDetailVC.flag = @"2";
//    contactsDetailVC.groupName = group.groupName;
//    contactsDetailVC.userInfo1 = friend;
//    [self.navigationController pushViewController:contactsDetailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    FEPersonalGroupHeaderView *headerView = [FEPersonalGroupHeaderView personalGroupHeaderViewWithTableView:tableView];
    headerView.delegate = self;
    IMASubGroup *itemGroup = [_contact objectAtIndex:section];
    headerView.itemGroup = itemGroup;
    headerView.tag = section;
    return headerView;
}


#pragma mark - FEPersonalGroupHeaderViewDelegate
- (void)headerViewClicked:(FEPersonalGroupHeaderView *)headerView {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headerView.tag];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}


@end
