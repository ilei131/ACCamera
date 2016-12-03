//
//  ACTabBarVC.m
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/3.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import "ACTabBarVC.h"

@interface ACTabBarVC ()

@end

@implementation ACTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChilds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChilds{
    UIColor *color = [UIColor colorWithRed:0.263 green:0.502 blue:0.847 alpha:1.00];
    _session = [[ACSessionVC alloc] init];
    UINavigationController *sessionNav = [[UINavigationController alloc]initWithRootViewController:_session];
    _session.tabBarItem.image = [IMAGE(@"tab_message") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _session.tabBarItem.selectedImage = [IMAGE(@"tab_message_h") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _session.tabBarItem.title = @"消息";
    [sessionNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:color, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, nil]] forState:UIControlStateSelected];
    
    _contact = [[ACContactsVC alloc] init];
    UINavigationController *contactNav = [[UINavigationController alloc]initWithRootViewController:_contact];
    _contact.tabBarItem.image = [IMAGE(@"tab_message") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _contact.tabBarItem.selectedImage = [IMAGE(@"tab_message_h") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _contact.tabBarItem.title = @"通讯录";
    [contactNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:color, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, nil]] forState:UIControlStateSelected];
    
    _mine = [[ACMineVC alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:_mine];
    _mine.tabBarItem.image = [IMAGE(@"tab_message") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _mine.tabBarItem.selectedImage = [IMAGE(@"tab_message_h") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _mine.tabBarItem.title = @"消息";
    [mineNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:color, nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, nil]] forState:UIControlStateSelected];
    [self addChildViewController:sessionNav];
    [self addChildViewController:contactNav];
    [self addChildViewController:mineNav];
}

@end
