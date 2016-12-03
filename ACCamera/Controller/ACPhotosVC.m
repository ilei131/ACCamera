//
//  ACPhotosVC.m
//  AntDemoShow
//
//  Created by Qi Le on 16/11/29.
//  Copyright © 2016年 Qi Le. All rights reserved.
//

#import "ACPhotosVC.h"

@interface ACPhotosVC ()

@end

@implementation ACPhotosVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTopViews];
    [self addBottomViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Add TopAndBottom Views
- (void)addTopViews{
    CGFloat topBarW = self.view.frame.size.width;
    CGFloat topBarH = self.view.frame.size.height*0.1f;
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, topBarW, topBarH)];
    topView.backgroundColor = [UIColor whiteColor];
    topView.alpha = 0.9f;
    [self.view addSubview:topView];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"BackN.png"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"Backs.png"] forState:UIControlStateHighlighted];
    backBtn.frame = CGRectMake(0.0f, 0.0f, topBarH, topBarH);
    [backBtn addTarget:self action:@selector(backToCamVC) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backBtn];
}

- (void)addBottomViews{
    CGFloat bottomBarW = self.view.frame.size.width;
    CGFloat bottomBarH = self.view.frame.size.height*0.9-self.view.frame.size.width;
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-bottomBarH, bottomBarW, bottomBarH)];
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.alpha = 0.9f;
    [self.view addSubview:bottomView];
    
    UIButton *subBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [subBtn setBackgroundImage:[UIImage imageNamed:@"SubN.png"] forState:UIControlStateNormal];
    [subBtn setBackgroundImage:[UIImage imageNamed:@"SubS.png"] forState:UIControlStateHighlighted];
    CGFloat subBtnW = bottomBarW/3.0f<bottomBarH?(bottomBarW/3.0f):bottomBarH;//0.9*bottomBarW/3.0f;
    subBtn.frame = CGRectMake(0, 0, subBtnW, subBtnW);
    subBtn.center = CGPointMake(bottomBarW*5/6.0,bottomBarH*0.5);
    [subBtn addTarget:self action:@selector(subBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:subBtn];
    
    UIButton *refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [refreshBtn setBackgroundImage:[UIImage imageNamed:@"RefreshN.png"] forState:UIControlStateNormal];
    [refreshBtn setBackgroundImage:[UIImage imageNamed:@"RefreshS.png"] forState:UIControlStateHighlighted];
    CGFloat refreshBtnW = bottomBarW/3.0f<bottomBarH?(bottomBarW/3.0f):bottomBarH;//1.0*bottomBarW/3.0f;
    refreshBtn.frame = CGRectMake(0, 0, refreshBtnW, refreshBtnW);
    refreshBtn.center = CGPointMake(bottomBarW*1/6.0,bottomBarH*0.5);
    [refreshBtn addTarget:self action:@selector(refreshBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:refreshBtn];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"AddN.png"] forState:UIControlStateNormal];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"AddS.png"] forState:UIControlStateHighlighted];
    CGFloat addBtnW = bottomBarW/3.0f<bottomBarH?(bottomBarW/3.0f):bottomBarH;//0.9*bottomBarW/3.0f;
    addBtn.frame = CGRectMake(0, 0, addBtnW, addBtnW);
    addBtn.center = CGPointMake(bottomBarW*0.5,bottomBarH*0.5);
    [addBtn addTarget:self action:@selector(addBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:addBtn];
    
}

#pragma mark Bottom Btn Pressed
- (void)subBtnPressed{
    
}
- (void)addBtnPressed{
  
}
- (void)refreshBtnPressed{
}

#pragma mark Top Btn Pressed
- (void)backToCamVC{

    [self.navigationController popViewControllerAnimated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
