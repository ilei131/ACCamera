//
//  RCUserInfoCell.m
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/8.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import "RCUserInfoCell.h"
#import "UIImageView+WebCache.h"
#import "UIFont+Size.h"

#define     MINE_SPACE_X        14.0f
#define     MINE_SPACE_Y        12.0f

@interface RCUserInfoCell ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nikenameLabel;
@property (nonatomic, strong) UILabel *useridLabel;

@end

@implementation RCUserInfoCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        [self.contentView addSubview:self.avatarImageView];
        [self.contentView addSubview:self.nikenameLabel];
        [self.contentView addSubview:self.useridLabel];
        //[self.contentView addSubview:self.QRImageView];
        
        [self addMasonry];
    }
    return self;
}

- (void) addMasonry
{
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(MINE_SPACE_X);
        make.top.mas_equalTo(MINE_SPACE_Y);
        make.bottom.mas_equalTo(- MINE_SPACE_Y);
        make.width.mas_equalTo(self.avatarImageView.mas_height);
    }];
    
    [self.nikenameLabel setContentCompressionResistancePriority:100 forAxis:UILayoutConstraintAxisHorizontal];
    [self.nikenameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImageView.mas_right).mas_offset(MINE_SPACE_Y);
        make.bottom.mas_equalTo(self.avatarImageView.mas_centerY).mas_offset(-3.5);
    }];
    
    [self.useridLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nikenameLabel);
        make.top.mas_equalTo(self.avatarImageView.mas_centerY).mas_offset(5.0);
    }];
    
    //    [self.QRImageView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.mas_equalTo(self.contentView).mas_offset(-0.5);
    //        make.right.mas_equalTo(self.contentView);
    //        make.height.and.width.mas_equalTo(18);
    //    }];
}

- (void)setHost:(IMAHost *)host {
    _host = host;
    if (host.profile.faceURL) {
        NSString *avatarURL = @"";
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:[avatarURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:DefaultAvatar];
    }else{
        [self.avatarImageView sd_setImageWithURL:nil placeholderImage:DefaultAvatar];
    }
    [self.nikenameLabel setText:host.nickName];
    [self.useridLabel setText:host.userId ? [@"帐号ID：" stringByAppendingString:host.userId] : @""];
}

#pragma mark - Getter
- (UIImageView *)avatarImageView
{
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc] init];
        [_avatarImageView.layer setMasksToBounds:YES];
        [_avatarImageView.layer setCornerRadius:5.0f];
    }
    return _avatarImageView;
}

- (UILabel *)nikenameLabel
{
    if (_nikenameLabel == nil) {
        _nikenameLabel = [[UILabel alloc] init];
        [_nikenameLabel setFont:[UIFont systemFontOfSize:17]];
    }
    return _nikenameLabel;
}

- (UILabel *)useridLabel
{
    if (_useridLabel == nil) {
        _useridLabel = [[UILabel alloc] init];
        [_useridLabel setFont:[UIFont systemFontOfSize:14]];
    }
    return _useridLabel;
}

@end
