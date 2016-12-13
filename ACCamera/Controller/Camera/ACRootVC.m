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
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    CGFloat scaleFactor = self.view.bounds.size.width/bgImageView.bounds.size.width;
    bgImageView.transform = CGAffineTransformMakeScale(scaleFactor,scaleFactor);
    bgImageView.center = self.view.center;
    [self.view addSubview:bgImageView];
    //
    [self addBottomButtons];
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
}

//临时
- (void)addBottomButtons {
    CGFloat btnWidth = screenW*0.14;
    CGFloat btnHeight = btnWidth;
    
    UIButton *session = [UIButton buttonWithType:UIButtonTypeCustom];
    [session setBackgroundImage:[UIImage imageNamed:@"AC_MessagesN.png"] forState:UIControlStateNormal];
    [session setBackgroundImage:[UIImage imageNamed:@"AC_MessagesS.png"] forState:UIControlStateHighlighted];
    [session addTarget:self action:@selector(showSession:) forControlEvents:UIControlEventTouchUpInside];
    session.bounds = CGRectMake(0, 0, btnWidth,btnHeight);
    session.center = CGPointMake(screenW/8, screenH-btnHeight/2);
    [self.view addSubview:session];
    
    UIButton *contact = [UIButton buttonWithType:UIButtonTypeCustom];
    [contact setBackgroundImage:[UIImage imageNamed:@"AC_FriendsN.png"] forState:UIControlStateNormal];
    [contact setBackgroundImage:[UIImage imageNamed:@"AC_FriendsS.png"] forState:UIControlStateHighlighted];
    [contact addTarget:self action:@selector(showContact:) forControlEvents:UIControlEventTouchUpInside];
    contact.bounds = CGRectMake(0, 0, btnWidth,btnHeight);
    contact.center = CGPointMake(screenW*0.5, screenH-btnHeight/2);
    [self.view addSubview:contact];

    UIButton *mine = [UIButton buttonWithType:UIButtonTypeCustom];
    [mine setBackgroundImage:[UIImage imageNamed:@"AC_MeN.png"] forState:UIControlStateNormal];
    [mine setBackgroundImage:[UIImage imageNamed:@"AC_MeS.png"] forState:UIControlStateHighlighted];
    [mine addTarget:self action:@selector(showMine:) forControlEvents:UIControlEventTouchUpInside];
    mine.bounds = CGRectMake(0, 0, btnWidth,btnHeight);
    mine.center = CGPointMake(screenW-screenW/8, screenH-btnHeight/2);
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
    [self presentViewController:nav animated:YES completion:NULL];
}

- (IBAction)showMine:(id)sender {
    ACMineVC *mine = [[ACMineVC alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mine];
    [self presentViewController:nav animated:YES completion:NULL];
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
