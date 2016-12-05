//
//  NSString+Size.m
//  rongshu
//
//  Created by v-ling on 16/6/25.
//  Copyright © 2016年 Hebei Bean. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)vl_sizeWithFont:(UIFont *)font {
    if (!font) {
        return CGSizeZero;
    }
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize size = [self sizeWithAttributes:attributes];
    return size;
}

+ (CGSize)stringWith:(NSString *)parameter font:(UIFont *)font maxSize:(CGSize)maxSize {
    CGSize size = [NSString stringWith:parameter lineSpacing:0 font:font maxSize:maxSize];
    return size;
}

+ (CGSize)stringWith:(NSString *)parameter lineSpacing:(CGFloat)lineSpacing font:(UIFont *)font maxSize:(CGSize)maxSize {
    return [NSString stringWith:parameter lineSpacing:lineSpacing lineBreakMode:0 font:font maxSize:maxSize];
}

+ (CGSize)stringWith:(NSString *)parameter lineSpacing:(CGFloat)lineSpacing lineBreakMode:(NSLineBreakMode)lineBreakMode font:(UIFont *)font maxSize:(CGSize)maxSize {
    if (!parameter || [parameter isEqual:[NSNull null]] || !font) {
        return CGSizeZero;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    if (lineSpacing) {
        paragraphStyle.lineSpacing = lineSpacing;
    }
    if (lineBreakMode) {
        paragraphStyle.lineBreakMode = lineBreakMode;
    }
    NSDictionary *attributes = @{ NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    NSAttributedString *contAttributedString = [[NSAttributedString alloc]initWithString:parameter attributes:attributes];
    CGRect contSize = [contAttributedString boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:NULL];
    CGSize fixSize = CGSizeMake(contSize.size.width+4, contSize.size.height+4);
    return fixSize;
}

- (CGFloat)heightForWidth:(CGFloat)width font:(UIFont *)font {
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    CGSize stringSize = [NSString stringWith:self font:font maxSize:maxSize];
    return stringSize.height;
}


@end
