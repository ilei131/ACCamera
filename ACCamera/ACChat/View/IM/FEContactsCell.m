//
//  FEContactsCell.m
//  acrophone
//
//  Created by admin on 16/7/25.
//  Copyright © 2016年 hbfec. All rights reserved.
//

#import "FEContactsCell.h"
#import "UIImageView+WebCache.h"

@interface FEContactsCell()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIButton *chatBtn;
@property (nonatomic, strong) UIButton *phoneBtn;
@property (nonatomic, strong) UIImageView *deviceImageView;

@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *onlineStateLabel;
//@property (nonatomic, strong) UIImageView *rightImageView;
//@property (nonatomic, strong) UIView *redPointView;

@end

@implementation FEContactsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setAccessoryType:UITableViewCellAccessoryNone];
        [self.contentView addSubview:self.avatarImageView];
        [self.contentView addSubview:self.userNameLabel];
        [self.contentView addSubview:self.onlineStateLabel];
        [self.contentView addSubview:self.chatBtn];
        [self p_addMasonry];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setContact:(IMAUser *)contact {
    _contact = contact;
    if (contact.remark) {
        self.userNameLabel.text = contact.remark;
    }else if (contact.nickName) {
        self.userNameLabel.text = contact.nickName;
    }else {
        self.userNameLabel.text = @"";
    }

    [self.avatarImageView sd_setImageWithURL:[contact showIconUrl] placeholderImage:kDefaultUserIcon];
}

#pragma mark - Private Methods
- (void)p_addMasonry {
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(15.0f);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(self.avatarImageView.mas_height);
    }];
    [self.chatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.avatarImageView);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-15);
        make.width.and.height.mas_equalTo(32);
    }];
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImageView.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(self.avatarImageView);
        make.right.mas_equalTo(self.chatBtn.mas_left).mas_offset(4);
    }];
    [self.onlineStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.avatarImageView);
        make.left.mas_equalTo(self.userNameLabel);
        //make.right.mas_lessThanOrEqualTo(self.chatBtn.mas_left).mas_offset(-10);
        make.right.mas_lessThanOrEqualTo(self.chatBtn.mas_right);
    }];
}

#pragma mark - Getter
- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.layer.cornerRadius = 23;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.image = IMAGE(@"ic_default_avatar");
    }
    return _avatarImageView;
}

- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
    }
    return _userNameLabel;
}

- (UILabel *)onlineStateLabel {
    if (!_onlineStateLabel) {
        _onlineStateLabel = [[UILabel alloc] init];
        [_onlineStateLabel setTextColor:[UIColor sectionHeaderColor]];
        [_onlineStateLabel setFont:[UIFont systemFontOfSize:14.0f]];
    }
    return _onlineStateLabel;
}

- (UIButton *)chatBtn {
    if (!_chatBtn) {
        _chatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_chatBtn addTarget:self action:@selector(chatAction:) forControlEvents:UIControlEventTouchUpInside];
        [_chatBtn setImage:IMAGE(@"contacts_chat_icon") forState:UIControlStateNormal];
        [_chatBtn setImage:IMAGE(@"contacts_chat_icon_h") forState:UIControlStateHighlighted];
    }
    return _chatBtn;
}

- (IBAction)chatAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(chatAction:)]) {
        [self.delegate chatAction:_indexPath];
    }
}

- (IBAction)phoneAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(phoneAction:)]) {
        [self.delegate phoneAction:_indexPath];
    }
}

@end
