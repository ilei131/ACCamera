//
//  FEPersonalGroupHeaderView.h
//  acrophone
//
//  Created by admin on 16/7/28.
//  Copyright © 2016年 hbfec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMASubGroup.h"

@class FEPersonalGroupHeaderView;

@protocol FEPersonalGroupHeaderViewDelegate <NSObject>

- (void)headerViewClicked:(FEPersonalGroupHeaderView *)headerView;

@end

@interface FEPersonalGroupHeaderView : UITableViewHeaderFooterView

@property (nonatomic, weak) id<FEPersonalGroupHeaderViewDelegate> delegate;
@property (nonatomic, strong) IMASubGroup *itemGroup;

+ (instancetype)personalGroupHeaderViewWithTableView:(UITableView *)tableView;

@end
