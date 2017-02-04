//
//  UIColor+Theme.m
//  rongshu
//
//  Created by v-ling on 16/6/26.
//  Copyright © 2016年 Hebei Bean. All rights reserved.
//

#import "UIColor+Theme.h"

@implementation UIColor (Theme)

+ (UIColor *)themeColor {
    return RGBHexColor(0x9200ca);
}

+ (UIColor *)themeYellowColor {
    return [UIColor colorWithRed:1.000 green:0.627 blue:0.000 alpha:1.00];
}

+ (UIColor *)themeGreenColor {
    return [UIColor colorWithRed:0.098 green:0.757 blue:0.039 alpha:1.00];
}

+ (UIColor *)tableBgColor {
    return RGBHexColor(0xf4f4f4);
}

+ (UIColor *)separatorLineColor {
    return RGBHexColor(0xe6e6e6);
}

+ (UIColor *)sectionHeaderColor {
    return RGBHexColor(0x6f889c);
}

+ (UIColor *)addMenuBGColor
{
    return RGBAColor(71, 70, 73, 1.0);
}

+ (UIColor *)addMenuHighlightBGColor
{
    return RGBAColor(65, 64, 67, 1.0);
}

+ (UIColor *)chatBGColor
{
    return RGBHexColor(0xebebeb);
}

+ (UIColor *)lw_C11 {
    return RGBHexColor(0x0079ff);
}

+ (UIColor *)lw_C12 {
    return RGBAColor(34, 34, 34, 0.2);
}

//文本颜色 页面标题
+ (UIColor *)pageTitleColor {
    return RGBHexColor(0x333333);
}
//文本颜色 页面二级标题
+ (UIColor *)pageTwoLevelTitleColor {
    return RGBHexColor(0x666666);
}
//文本颜色 页面正文
+ (UIColor *)pageTextColor {
    return RGBHexColor(0x333333);
}

+ (UIColor *)authorNameColor {
    return RGBHexColor(0x0062ae);
}


#pragma mark - # 字体
+ (UIColor *)colorTextBlack {
    return [UIColor blackColor];
}

+ (UIColor *)colorTextGray {
    return [UIColor grayColor];
}

+ (UIColor *)colorTextGray1 {
    return RGBAColor(160, 160, 160, 1.0);
}

#pragma mark - 灰色
+ (UIColor *)colorGrayBG {
    return RGBAColor(239.0, 239.0, 244.0, 1.0);
}

+ (UIColor *)colorGrayCharcoalBG {
    return RGBAColor(235.0, 235.0, 235.0, 1.0);
}

+ (UIColor *)colorGrayLine {
    return [UIColor colorWithWhite:0.5 alpha:0.3];
}

+ (UIColor *)colorGrayForChatBar {
    return RGBAColor(245.0, 245.0, 247.0, 1.0);
}

+ (UIColor *)colorGrayForMoment {
    return RGBAColor(243.0, 243.0, 245.0, 1.0);
}

#pragma mark - 绿色
+ (UIColor *)colorGreenDefault {
    return RGBAColor(2.0, 187.0, 0.0, 1.0f);
}

#pragma mark - 蓝色
+ (UIColor *)colorBlueMoment {
    return RGBAColor(74.0, 99.0, 141.0, 1.0);
}

#pragma mark - 黑色
+ (UIColor *)colorBlackForNavBar {
    return RGBAColor(20.0, 20.0, 20.0, 1.0);
}

+ (UIColor *)colorBlackBG {
    return RGBAColor(46.0, 49.0, 50.0, 1.0);
}

+ (UIColor *)colorBlackAlphaScannerBG {
    return [UIColor colorWithWhite:0 alpha:0.6];
}

+ (UIColor *)colorBlackForAddMenu {
    return RGBAColor(71, 70, 73, 1.0);
}

+ (UIColor *)colorBlackForAddMenuHL {
    return RGBAColor(65, 64, 67, 1.0);
}

+ (UIColor *)colorSearchBarTint {
    return RGBAColor(239.0, 239.0, 244.0, 1.0);
}

+ (UIColor *)colorDefaultGreen {
    return RGBAColor(2.0, 187.0, 0.0, 1.0f);
}

@end
