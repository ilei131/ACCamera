//
//  RCItem.m
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/5.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import "RCItem.h"

@implementation RCItem

+ (RCItem *)createItemWithTitle:(NSString *)title iconPath:(NSString *)iconPath {
    RCItem *item = [[RCItem alloc] init];
    item.title = title;
    item.iconPath = iconPath;
    return item;
}

+ (RCItem *)createItemWithTitle:(NSString *)title
{
    RCItem *item = [[RCItem alloc] init];
    item.title = title;
    return item;
}

- (id) init
{
    if (self = [super init]) {
        self.showDisclosureIndicator = YES;
    }
    return self;
}

- (NSString *) cellClassName
{
    switch (self.type) {
        case RCItemTypeDefalut:
            return @"RSCell";
            break;
        default:
            break;
    }
    return nil;
}


@end
