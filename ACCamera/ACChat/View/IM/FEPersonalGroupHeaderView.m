//
//  FEPersonalGroupHeaderView.m
//  acrophone
//
//  Created by admin on 16/7/28.
//  Copyright © 2016年 hbfec. All rights reserved.
//

#import "FEPersonalGroupHeaderView.h"

@interface FEPersonalGroupHeaderView()

@property (nonatomic, strong) UIButton *headerBtn;
@property (nonatomic, strong) UILabel *countOnline;
@property (nonatomic, strong) UIImageView *downline;
@property (nonatomic, strong) UIImageView *arrowView;

@end

@implementation FEPersonalGroupHeaderView

+ (instancetype)personalGroupHeaderViewWithTableView:(UITableView *)tableView {
    static NSString *headerID = @"personalGroupHeader";
    FEPersonalGroupHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    if (headerView == nil) {
        headerView = [[self alloc] initWithReuseIdentifier:headerID];
    }
    
    return headerView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        //布局子控件
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupChlidView];
    }
    return self;
}

- (void)setupChlidView{
    //头视图  按钮
    UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:headerBtn];
    self.headerBtn = headerBtn;
    [self.headerBtn setTitleColor:[UIColor blackColor] forState:0];
    [self.headerBtn setImage:[UIImage imageNamed:@"friendgroup_arrow"] forState:0];
    ///这是对齐方式
    self.headerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    ///设置内边距
    self.headerBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    self.headerBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    //按钮的背景图片
    [self.headerBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:0];
    [self.headerBtn setBackgroundImage:[UIImage imageNamed:@"friendgroup_headerbg"] forState:1];
    self.headerBtn.imageView.contentMode = UIViewContentModeCenter;
    self.headerBtn.imageView.clipsToBounds = NO;
    [self.headerBtn addTarget:self action:@selector(headerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *countOnline = [[UILabel alloc] init];
    [self.contentView addSubview:countOnline];
    self.countOnline = countOnline;
    self.countOnline.textAlignment = NSTextAlignmentRight;
    self.countOnline.font = [UIFont  systemFontOfSize:14.0];
    self.countOnline.textColor = [UIColor grayColor];
    
    self.downline = [UIImageView downLineWidth:screenW];
    [self.contentView addSubview:_downline];
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    view.image = IMAGE(@"friendgroup_cell_arrow");
    self.arrowView = view;
    [self.contentView addSubview:_arrowView];
    self.arrowView.hidden = YES;
}

/// 按钮的监听事件
- (void)headerBtnClick:(UIButton *)sender {
    self.itemGroup.isFold = !self.itemGroup.isFold;
    if (!self.itemGroup.isFold) {
        //没有展开
        self.headerBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }else {
        //展开
        self.headerBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    if ([self.delegate respondsToSelector:@selector(headerViewClicked:)]) {
        [self.delegate headerViewClicked:self];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.headerBtn.frame = self.bounds;
    CGFloat countX = self.bounds.size.width - 160;
    self.countOnline.frame = CGRectMake(countX, 0, 150, 50);
    countX = self.bounds.size.width - 30;
    self.arrowView.frame = CGRectMake(countX, 15, 20, 20);
    self.downline.frame = CGRectMake(0, 49, screenW, 1);
}

- (void)setItemGroup:(IMASubGroup *)itemGroup {
    _arrowView.hidden = YES;
    _countOnline.hidden = NO;
    [self.headerBtn setImage:[UIImage imageNamed:@"friendgroup_arrow"] forState:0];
    _itemGroup = itemGroup;
    NSString *showTitle = [itemGroup showTitle];
    [self.headerBtn setTitle:showTitle forState:0];
    NSString *count = [NSString stringWithFormat:@"%@",@(itemGroup.friends.count)];
    self.countOnline.text = count;
    if (self.itemGroup.isFold) {
        self.headerBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.headerBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}


@end
