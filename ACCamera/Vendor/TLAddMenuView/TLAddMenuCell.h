//
//  TLAddMenuCell.h
//  TLChat
//
//  Created by 李伯坤 on 16/3/11.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "TLAddMenuItem.h"

@interface TLAddMenuCell : UITableViewCell

@property (nonatomic, strong) TLAddMenuItem *item;
@property (nonatomic, assign) CGFloat rightSeparatorSpace;

@property (nonatomic) NSInteger menuStyle;
@property (nonatomic) BOOL isSelected;

@end
