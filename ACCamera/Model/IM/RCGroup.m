//
//  RCGroup.m
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/5.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import "RCGroup.h"
#import "RCUIUtil.h"
#import "UIFont+Size.h"

@implementation RCGroup
+ (RCGroup *)groupWithHeaderTitle:(NSString *)headerTitle
                      footerTitle:(NSString *)footerTitle
                            items:(NSArray *)items
{
    RCGroup *group= [[RCGroup alloc] init];
    group.headerTitle = headerTitle;
    group.footerTitle = footerTitle;
    group.items = [items mutableCopy];
    return group;
}

#pragma mark - Public Mthods
- (id) objectAtIndex:(NSUInteger)index
{
    return [self.items objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(id)obj
{
    return [self.items indexOfObject:obj];
}


- (void)removeObject:(id)obj
{
    [self.items removeObject:obj];
}

#pragma mark - Setter
- (void)setHeaderTitle:(NSString *)headerTitle
{
    _headerTitle = headerTitle;
    _headerHeight = [RCUIUtil getTextHeightOfText:headerTitle font:[UIFont fontSettingHeaderAndFooterTitle] width:screenW - 30];
}

- (void)setFooterTitle:(NSString *)footerTitle
{
    _footerTitle = footerTitle;
    _footerHeight = [RCUIUtil getTextHeightOfText:footerTitle font:[UIFont fontSettingHeaderAndFooterTitle] width:screenW - 30];
}

#pragma mark - Getter
- (NSUInteger) count
{
    return self.items.count;
}

@end
