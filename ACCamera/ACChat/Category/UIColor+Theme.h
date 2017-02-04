//
//  UIColor+Theme.h
//  rongshu
//
//  Created by v-ling on 16/6/26.
//  Copyright © 2016年 Hebei Bean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Theme)

+ (UIColor *)themeColor;
+ (UIColor *)themeYellowColor;
+ (UIColor *)themeGreenColor;
+ (UIColor *)tableBgColor;
+ (UIColor *)separatorLineColor;
+ (UIColor *)sectionHeaderColor;

//For TLAddMenu
+ (UIColor *)addMenuBGColor;
+ (UIColor *)addMenuHighlightBGColor;
+ (UIColor *)chatBGColor;
+ (UIColor *)lw_C11;
+ (UIColor *)lw_C12;

//文本颜色 页面标题
+ (UIColor *)pageTitleColor;
//文本颜色 页面二级标题
+ (UIColor *)pageTwoLevelTitleColor;
//文本颜色 页面正文
+ (UIColor *)pageTextColor;
+ (UIColor *)authorNameColor;


#pragma mark - # 字体
+ (UIColor *)colorTextBlack;
+ (UIColor *)colorTextGray;
+ (UIColor *)colorTextGray1;
#pragma mark - 灰色
+ (UIColor *)colorGrayBG;

+ (UIColor *)colorGrayCharcoalBG;

+ (UIColor *)colorGrayLine;
+ (UIColor *)colorGrayForChatBar;
+ (UIColor *)colorGrayForMoment;
#pragma mark - 绿色
+ (UIColor *)colorGreenDefault;
#pragma mark - 蓝色
+ (UIColor *)colorBlueMoment;

#pragma mark - 黑色
+ (UIColor *)colorBlackForNavBar;
+ (UIColor *)colorBlackBG;
+ (UIColor *)colorBlackAlphaScannerBG;
+ (UIColor *)colorBlackForAddMenu;
+ (UIColor *)colorBlackForAddMenuHL;

+ (UIColor *)colorSearchBarTint;
+ (UIColor *)colorDefaultGreen;

@end
