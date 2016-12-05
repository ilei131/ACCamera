//
//  RCUIUtil.m
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/5.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import "RCUIUtil.h"
#import "NSString+Size.h"

@implementation RCUIUtil

+ (CGFloat)getTextHeightOfText:(NSString *)text
                          font:(UIFont *)font
                         width:(CGFloat)width {
    CGSize size = [NSString stringWith:text font:font maxSize:CGSizeMake(width, MAXFLOAT)];
    return size.height;
}

@end
