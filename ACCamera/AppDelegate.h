//
//  AppDelegate.h
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/3.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ACRootVC;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow                  *window;
@property (strong, nonatomic) UINavigationController    *navController;
@property (strong, nonatomic) ACRootVC                  *rootController;

@end

