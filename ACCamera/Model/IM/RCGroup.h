//
//  RCGroup.h
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/5.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCItem.h"

#define  RCCreateGroup(Header, Footer, Items)  [RCGroup groupWithHeaderTitle:Header footerTitle:Footer items:Items]

@interface RCGroup : NSObject

/**
 *  section头部标题
 */
@property (nonatomic, strong) NSString *headerTitle;

/**
 *  section尾部说明
 */
@property (nonatomic, strong) NSString *footerTitle;

/**
 *  setcion元素
 */
@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, assign, readonly) CGFloat headerHeight;

@property (nonatomic, assign, readonly) CGFloat footerHeight;

@property (nonatomic, assign, readonly) NSUInteger count;

+ (RCGroup *)groupWithHeaderTitle:(NSString *)headerTitle
                      footerTitle:(NSString *)footerTitle
                            items:(NSArray *)items;

- (id)objectAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfObject:(id)obj;
- (void)removeObject:(id)obj;

@end
