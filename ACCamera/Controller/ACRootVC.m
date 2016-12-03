//
//  ViewController.m
//  AntDemoTwo
//
//  Created by Qi Le on 16/5/7.
//  Copyright © 2016年 Qi Le. All rights reserved.
//

#import "ACRootVC.h"
#import "ACCameraVC.h"
#import "macro.h"
#import "ACSessionVC.h"
#import "ACContactsVC.h"
#import "ACMineVC.h"

@interface ACRootVC ()
@property(strong,nonatomic) UIButton    *camBtn;
@property(strong,nonatomic) ACCameraVC  *camVC;

@end

@implementation ACRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏导航条
    self.navigationController.navigationBar.hidden = YES;
    //设置背景
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加相机按钮
    _camBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_camBtn setBackgroundImage:[UIImage imageNamed:@"CameraBtnN.png"] forState:UIControlStateNormal];
    [_camBtn setBackgroundImage:[UIImage imageNamed:@"CameraBtnS.png"] forState:UIControlStateHighlighted];
    float buttonW = CAMERA_BTN_WIDTH;
    float buttonH = buttonW;
    _camBtn.frame = CGRectMake(0, 0, buttonW, buttonH);
    _camBtn.center = CGPointMake(screenW*0.5f, screenH*CAMERA_BTN_CENTER_Y);
    
    [_camBtn addTarget:self action:@selector(toCam) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_camBtn];
    [self addButtons];
}

//临时
- (void)addButtons {
    CGFloat btnHeight = 49.0f;
    UIButton *session = [UIButton buttonWithType:UIButtonTypeCustom];
    [session setTitle:@"消息" forState:UIControlStateNormal];
    [session setTitle:@"消息" forState:UIControlStateHighlighted];
    [session setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [session addTarget:self action:@selector(showSession:) forControlEvents:UIControlEventTouchUpInside];
    session.frame = CGRectMake(0, screenH-btnHeight, screenW/3, btnHeight);
    [self.view addSubview:session];
    
    UIButton *contact = [UIButton buttonWithType:UIButtonTypeCustom];
    [contact setTitle:@"通讯录" forState:UIControlStateNormal];
    [contact setTitle:@"通讯录" forState:UIControlStateHighlighted];
    [contact setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [contact addTarget:self action:@selector(showContact:) forControlEvents:UIControlEventTouchUpInside];
    contact.frame = CGRectMake(screenW/3, screenH-btnHeight, screenW/3, btnHeight);
    [self.view addSubview:contact];

    UIButton *mine = [UIButton buttonWithType:UIButtonTypeCustom];
    [mine setTitle:@"我的" forState:UIControlStateNormal];
    [mine setTitle:@"我的" forState:UIControlStateHighlighted];
    [mine setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mine addTarget:self action:@selector(showMine:) forControlEvents:UIControlEventTouchUpInside];
    mine.frame = CGRectMake(2*screenW/3, screenH-btnHeight, screenW/3, btnHeight);
    [self.view addSubview:mine];
}

- (IBAction)showSession:(id)sender {
    ACSessionVC *session = [[ACSessionVC alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:session];
    [self presentViewController:nav animated:YES completion:NULL];
}

- (IBAction)showContact:(id)sender {
    ACContactsVC *contact = [[ACContactsVC alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:contact];
    [self.navigationController presentViewController:nav animated:YES completion:NULL];
}

- (IBAction)showMine:(id)sender {
    ACMineVC *mine = [[ACMineVC alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mine];
    [self.navigationController presentViewController:nav animated:YES completion:NULL];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //重新进入时复位初始化设置，未优化
    self.navigationController.navigationBar.hidden = YES;
    _camBtn.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    float buttonW = CAMERA_BTN_WIDTH;
    float buttonH = buttonW;
    _camBtn.frame = CGRectMake(0, 0, buttonW, buttonH);
    _camBtn.center = CGPointMake(screenW*0.5f, screenH*CAMERA_BTN_CENTER_Y);
}

- (void)toCam {
    [UIView animateWithDuration:1.0f animations:^{
        _camBtn.transform = CGAffineTransformMakeScale(100.0f, 100.0f);
        _camBtn.center = self.view.center;
    } completion:^(BOOL finished) {
        if(NULL == _camVC){
            _camVC = [[ACCameraVC alloc] init];
        }
        @try {
            [self.navigationController pushViewController:_camVC animated:NO];
        } @catch (NSException *exception) {
            _camVC = [[ACCameraVC alloc] init];
            [self.navigationController pushViewController:_camVC animated:NO];
        } @finally {
            
        }
    }];
}

@end
