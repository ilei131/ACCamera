//
//  UIImageView+Line.m
//  acrophone
//
//  Created by admin on 16/7/28.
//  Copyright © 2016年 hbfec. All rights reserved.
//

#import "UIImageView+Line.h"

@implementation UIImageView (Line)

+ (UIImageView *)upLineWidth:(CGFloat)width {
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, .5)];
    line.image = [UIImage imageNamed:@"line_up"];
    line.backgroundColor = [UIColor clearColor];
    return line;
}

+ (UIImageView *)downLineWidth:(CGFloat)width {
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, .5)];
    line.image = [UIImage imageNamed:@"line_down"];
    line.backgroundColor = [UIColor clearColor];
    return line;
}

@end
