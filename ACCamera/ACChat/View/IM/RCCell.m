//
//  RCCell.m
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/5.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import "RCCell.h"
#import "Masonry.h"

@interface RCCell()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *midLabel;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UIView *redPointView;

@end

@implementation RCCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.midLabel];
        [self.contentView addSubview:self.rightImageView];
        [self.contentView addSubview:self.redPointView];
        
        [self p_addMasonry];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setItem:(RCItem *)item {
    _item = item;
    [self.iconImageView setImage:[UIImage imageNamed:item.iconPath]];
    [self.titleLabel setText:item.title];
    [self.midLabel setText:item.subTitle];
    //TODO rightIconPath
    [self.redPointView setHidden:!item.showRightRedPoint];
}

#pragma mark - Private Methods
- (void)p_addMasonry
{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(15.0f);
        make.centerY.mas_equalTo(self.contentView);
        make.width.and.height.mas_equalTo(25.0f);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.iconImageView);
        make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(15.0f);
        make.right.mas_lessThanOrEqualTo(self.contentView).mas_offset(15.0f);
    }];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView);
        make.centerY.mas_equalTo(self.iconImageView);
        make.width.and.height.mas_equalTo(31);
    }];
    [self.midLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_greaterThanOrEqualTo(self.titleLabel.mas_right).mas_offset(15);
        make.right.mas_equalTo(self.rightImageView.mas_left).mas_offset(-5);
        make.centerY.mas_equalTo(self.iconImageView);
    }];
    [self.redPointView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.rightImageView.mas_right).mas_offset(1);
        make.centerY.mas_equalTo(self.rightImageView.mas_top).mas_offset(1);
        make.width.and.height.mas_equalTo(REDPOINT_WIDTH);
    }];
}

#pragma mark - Getter
- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

- (UILabel *)midLabel
{
    if (_midLabel == nil) {
        _midLabel = [[UILabel alloc] init];
        [_midLabel setTextColor:[UIColor grayColor]];
        [_midLabel setFont:[UIFont systemFontOfSize:14.0f]];
    }
    return _midLabel;
}

- (UIImageView *)rightImageView
{
    if (_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc] init];
    }
    return _rightImageView;
}

- (UIView *)redPointView
{
    if (_redPointView == nil) {
        _redPointView = [[UIView alloc] init];
        [_redPointView setBackgroundColor:[UIColor redColor]];
        
        [_redPointView.layer setMasksToBounds:YES];
        [_redPointView.layer setCornerRadius:REDPOINT_WIDTH / 2.0];
        [_redPointView setHidden:YES];
    }
    return _redPointView;
}

@end
