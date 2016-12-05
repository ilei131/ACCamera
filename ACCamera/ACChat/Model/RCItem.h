//
//  RCItem.h
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/5.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCItem : NSObject

#define  RCCreateItem(title,icon) [RCItem createItemWithTitle:title iconPath:icon]

typedef NS_ENUM(NSInteger, RCItemType) {
    RCItemTypeDefalut = 0,
    RCItemTypeTitleButton,
    RCItemTypeSwitch,
    RCItemTypeOther,
};

/**
 *  左侧图标路径
 */
@property (nonatomic, strong) NSString *iconPath;

/**
 *  主标题
 */
@property (nonatomic, strong) NSString *title;

/**
 *  副标题
 */
@property (nonatomic, strong) NSString *subTitle;

/**
 *  右图片(本地)
 */
@property (nonatomic, strong) NSString *rightImagePath;

/**
 *  右图片(网络)
 */
@property (nonatomic, strong) NSString *rightImageURL;

/**
 *  是否显示箭头（默认YES）
 */
@property (nonatomic, assign) BOOL showDisclosureIndicator;

/**
 *  停用高亮（默认NO）
 */
@property (nonatomic, assign) BOOL disableHighlight;

/**
 *  是否显示红点
 */
@property (nonatomic, assign) BOOL showRightRedPoint;

/**
 *  cell类型，默认default
 */
@property (nonatomic, assign) RCItemType type;
@property (nonatomic, assign) BOOL switchOn;

+ (RCItem *)createItemWithTitle:(NSString *)title;
+ (RCItem *)createItemWithTitle:(NSString *)title iconPath:(NSString *)iconPath;
- (NSString *)cellClassName;


@end
