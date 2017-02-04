//  macro.h
//  AntDemoShow
//
//  Created by Guo Xuelei on 2016/11/30.
//  Copyright © 2016年 Qi Le. All rights reserved.
//
#ifndef macro_h
#define macro_h

#define DefaultAvatar [UIImage imageNamed:@"ic_default_avatar"]
#define screenW [[UIScreen mainScreen] bounds].size.width
#define screenH [[UIScreen mainScreen] bounds].size.height
#define CAMERA_BTN_WIDTH screenW*0.32   //按钮宽度
#define CAMERA_BTN_CENTER_Y 0.75f       //按钮Y轴位置百分比

#define IMAGE(name) [UIImage imageNamed:name]
#define tabBarHeight 49

#define iOS(version) ([[UIDevice currentDevice].systemVersion doubleValue] >= version)

#define RGBHexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBAColor(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGBColor(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;
#define REDPOINT_WIDTH       8.0f

//TIMChat
#define kUserName               @"username"
#define kUserPassword           @"password"
#define kUserInputStatus        @"kUserInputStatus"
#define kDefaultMargin          8
#define kAppStoreVersion        0
#define kDefaultSubGroupIcon    [UIImage imageWithColor:kOrangeColor size:CGSizeMake(32, 32)]
#define kAppLargeTextFont       [UIFont systemFontOfSize:16]
#define kAppMiddleTextFont      [UIFont systemFontOfSize:14]
#define kAppSmallTextFont       [UIFont systemFontOfSize:12]
#define kDefaultSilentUntil     100
#define kSaftyWordsCode         80001

#define REDPOINT_WIDTH          8.0f
#define HEIGHT_HEADER           24.0f
#define HEIGHT_STATUSBAR        20.0f
#define HEIGHT_TABBAR           49.0f
#define HEIGHT_NAVBAR           44.0f
#define HEIGHT_CALLBOARD        216.0f

#endif /* macro_h */
