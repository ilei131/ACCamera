//
//  ACTabBarVC.h
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/3.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACSessionVC.h"
#import "ACContactsVC.h"
#import "ACMineVC.h"

@interface ACTabBarVC : UITabBarController

@property (nonatomic, strong) ACSessionVC   *session;
@property (nonatomic, strong) ACContactsVC  *contact;
@property (nonatomic, strong) ACMineVC      *mine;

@end
