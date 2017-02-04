//
//  TLAddMenuCell.m
//  TLChat
//
//  Created by 李伯坤 on 16/3/11.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "TLAddMenuCell.h"

@interface TLAddMenuCell()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TLAddMenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //self.rightSeparatorSpace = 16;
        [self setBackgroundColor:[UIColor addMenuBGColor]];
        UIView *selectedView = [[UIView alloc] init];
        [selectedView setBackgroundColor:[UIColor addMenuHighlightBGColor]];
        [self setSelectedBackgroundView:selectedView];
        
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];

        [self p_addMasonry];
    }
    return self;
}

- (void)setMenuStyle:(NSInteger)menuStyle {
    _menuStyle = menuStyle;
    if (menuStyle == 2) {
        [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).mas_offset(20.0f);
            make.centerY.mas_equalTo(self);
            make.height.and.width.mas_equalTo(11);
        }];
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(10.0f);
            make.centerY.mas_equalTo(self.iconImageView);
        }];
    }
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    if (_menuStyle == 2) {
        self.iconImageView.hidden = !isSelected;
    }
}

- (void)setItem:(TLAddMenuItem *)item {
    _item = item;
    if (_menuStyle == 2) {
        [self.iconImageView setImage:[UIImage imageNamed:@"ic_selected_type"]];
    }else {
        if (item.iconPath.length) {
            [self.iconImageView setImage:[UIImage imageNamed:item.iconPath]];
            [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self).mas_offset(20.0f);
                make.centerY.mas_equalTo(self);
                make.height.and.width.mas_equalTo(18);
            }];
            [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(10.0f);
                make.centerY.mas_equalTo(self.iconImageView);
            }];
        }else {
            self.iconImageView.image = nil;
            [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self).mas_offset(10.0f);
                make.centerY.mas_equalTo(self);
                make.height.and.width.mas_equalTo(2);
            }];
            [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(10.0f);
                make.centerY.mas_equalTo(self.iconImageView);
            }];
        }
    }
    [self.titleLabel setText:item.title];
}

#pragma mark - Private Methods -
- (void)p_addMasonry
{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(18.0f);
        make.centerY.mas_equalTo(self);
        make.height.and.width.mas_equalTo(18);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(10.0f);
        make.centerY.mas_equalTo(self.iconImageView);
    }];
}

#pragma mark - Getter
- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        //_iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconImageView;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    }
    return _titleLabel;
}

@end
