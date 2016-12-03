//
//  ACCameraVC.m
//  AntDemoShow
//
//  Created by Qi Le on 16/11/29.
//  Copyright © 2016年 Qi Le. All rights reserved.
//

#import "ACCameraVC.h"
#import "ACPhotosVC.h"

@interface ACCameraVC ()
@property (nonatomic,strong) UIButton *capturePhotoBtn;
@property (nonatomic,strong) UIImageView *animationView;
@end

@implementation ACCameraVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加顶端视图
    [self addTopViews];
    //添加底端视图
    [self addBottomViews];
    
    //动画视图创建
    _animationView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CaptureBtnN.png"]];
    _animationView.center = self.view.center;
    [self.view addSubview:_animationView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //过渡动画初始化
    _animationView.hidden = NO;
    float scaleFactor = 3.0f*self.view.frame.size.width/_animationView.frame.size.width;
    _animationView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    [self transitionAnimation];
}

- (void)transitionAnimation{
    CGFloat w = 0.5*self.view.frame.size.width;
    CGFloat h = 0.5*self.view.frame.size.width+0.55*self.view.frame.size.height;
    CGPoint captureBtnPosition = CGPointMake(w, h);
    
    //调整按钮缩放倍数
    float scaleFactor = _capturePhotoBtn.frame.size.width/256.0f;
    [UIView animateWithDuration:1.0f animations:^{
        _animationView.center = captureBtnPosition;
        _animationView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    } completion:^(BOOL finished) {
        _animationView.hidden = YES;
    }];
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
    [backBtn addTarget:self action:@selector(backToRootVC) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backBtn];
    
    UIButton *setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [setBtn setBackgroundImage:[UIImage imageNamed:@"SetN.png"] forState:UIControlStateNormal];
    [setBtn setBackgroundImage:[UIImage imageNamed:@"SetS.png"] forState:UIControlStateHighlighted];
    CGFloat setBtnX = (topBarW-topBarH)*0.5f;
    setBtn.frame = CGRectMake(setBtnX, 0.0f, topBarH, topBarH);
    [setBtn addTarget:self action:@selector(toACSetVC) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:setBtn];
    
    UIButton *tmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tmBtn setBackgroundImage:[UIImage imageNamed:@"S0N.png"] forState:UIControlStateNormal];
    [tmBtn setBackgroundImage:[UIImage imageNamed:@"S0S.png"] forState:UIControlStateHighlighted];
    CGFloat tmBtnX = topBarW-topBarH;
    tmBtn.frame = CGRectMake(tmBtnX, 0.0f, topBarH, topBarH);
    [tmBtn addTarget:self action:@selector(setTimeMode) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:tmBtn];
}

- (void)addBottomViews{
    CGFloat bottomBarW = self.view.frame.size.width;
    CGFloat bottomBarH = self.view.frame.size.height*0.9-self.view.frame.size.width;
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-bottomBarH, bottomBarW, bottomBarH)];
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.alpha = 0.9f;
    [self.view addSubview:bottomView];
    
    UIButton *pixelsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [pixelsBtn setBackgroundImage:[UIImage imageNamed:@"PixelsN.png"] forState:UIControlStateNormal];
    [pixelsBtn setBackgroundImage:[UIImage imageNamed:@"PixelsS.png"] forState:UIControlStateHighlighted];
    CGFloat pixelsBtnW = bottomBarW/3.0f<bottomBarH?(0.9*bottomBarW/3.0f):(0.9*bottomBarH);//0.9*bottomBarW/3.0f;
    pixelsBtn.frame = CGRectMake(0, 0, pixelsBtnW, pixelsBtnW);
    pixelsBtn.center = CGPointMake(bottomBarW*5/6.0,bottomBarH*0.5);
    [pixelsBtn addTarget:self action:@selector(pixelsBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:pixelsBtn];
    
    _capturePhotoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_capturePhotoBtn setBackgroundImage:[UIImage imageNamed:@"CaptureBtnN.png"] forState:UIControlStateNormal];
    [_capturePhotoBtn setBackgroundImage:[UIImage imageNamed:@"CaptureBtnS.png"] forState:UIControlStateHighlighted];
    CGFloat capturePhotoBtnW = bottomBarW/3.0f<bottomBarH?(bottomBarW/3.0f):bottomBarH;//1.0*bottomBarW/3.0f;
    _capturePhotoBtn.frame = CGRectMake(0, 0, capturePhotoBtnW, capturePhotoBtnW);
    _capturePhotoBtn.center = CGPointMake(bottomBarW*0.5,bottomBarH*0.5);
    [_capturePhotoBtn addTarget:self action:@selector(capturePhoto) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:_capturePhotoBtn];
    
    UIButton *modeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [modeBtn setBackgroundImage:[UIImage imageNamed:@"M1N.png"] forState:UIControlStateNormal];
    [modeBtn setBackgroundImage:[UIImage imageNamed:@"M1S.png"] forState:UIControlStateHighlighted];
    CGFloat modeBtnW = bottomBarW/3.0f<bottomBarH?(0.9*bottomBarW/3.0f):(0.9*bottomBarH);//0.9*bottomBarW/3.0f;
    modeBtn.frame = CGRectMake(0, 0, modeBtnW, modeBtnW);
    modeBtn.center = CGPointMake(bottomBarW*1/6.0,bottomBarH*0.5);
    [modeBtn addTarget:self action:@selector(modeBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:modeBtn];
    
}

#pragma mark Top Btn Pressed
- (void)backToRootVC{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)toACSetVC{

}
- (void)setTimeMode{
    
}

#pragma mark Bottom Btn Pressed
- (void)capturePhoto{
    ACPhotosVC *photosVC = [[ACPhotosVC alloc] init];
    [self.navigationController pushViewController:photosVC animated:YES];
}
- (void)modeBtnPressed{
    
}
- (void)pixelsBtnPressed{

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
