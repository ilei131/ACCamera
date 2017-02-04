//
//  ACBaseVC.m
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/3.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import "ACBaseVC.h"

@interface ACBaseVC ()

@end

@implementation ACBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor tableBgColor];
    [self addNavBarBackButton:@selector(popBack:)];
    // Do any additional setup after loading the view.
}

- (IBAction)popBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)addNavBarBackButton:(SEL)selectAction {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, -2, 44, 25);
    btn.contentMode = UIViewContentModeCenter;
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setImage:[UIImage imageNamed:@"nav_arrow"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"nav_arrow_click"] forState:UIControlStateHighlighted];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 4);
    //btn.exclusiveTouch = YES;
    [btn addTarget:self action:selectAction forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return btn;
}

@end
