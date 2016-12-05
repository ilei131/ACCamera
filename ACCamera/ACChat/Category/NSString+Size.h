//
//  NSString+Size.h
//  rongshu
//
//  Created by v-ling on 16/6/25.
//  Copyright © 2016年 Hebei Bean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

- (CGSize)vl_sizeWithFont:(UIFont *)font;
+ (CGSize)stringWith:(NSString *)parameter font:(UIFont *)font maxSize:(CGSize)maxSize;

@end
