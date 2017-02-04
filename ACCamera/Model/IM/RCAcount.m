//
//  RCAcount.m
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/14.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import "RCAcount.h"

@interface RCAcount() <TLSStrAccountRegListener,TLSPwdLoginListener> {
    IMALoginParam               *_loginParam;
    BOOL                        _isRegist;
}

@end

@implementation RCAcount
ImplementSharedIntance(RCAcount);

- (void)autoLoginTIM {
    _loginParam = [IMALoginParam loadFromLocal];
    [IMAPlatform configWith:_loginParam.config];
    if ([_loginParam isVailed]){
        _isRegist = NO;
        [self autoLogin];
    }else{
        _isRegist = YES;
        [self registLogin];
    }
}

- (void)autoLogin {
    NSString *userName = [RCDataUtil readStringForKey:kUserName];
    NSString *password = [RCDataUtil readStringForKey:kUserPassword];
    [[TLSHelper getInstance] TLSPwdLogin:userName andPassword:password andTLSPwdLoginListener:self];
}

- (void)registLogin {
    int appid = [kSdkAppId intValue];
    int accType = [kSdkAccountType intValue];
    NSString *version = @"1.0";
    (void)[[QalSDKProxy sharedInstance] initWithAppid:appid andSDKAppid:appid andAccType:accType];
    TLSHelper *helper = [[TLSHelper getInstance] init:appid andAppVer:version];
    [helper TLSStrAccountReg:@"ilei1" andPassword:@"12345678" andTLSStrAccountRegListener:self];
    [RCDataUtil writeUserData:@"ilei1" forKey:kUserName];
    [RCDataUtil writeUserData:@"12345678" forKey:kUserPassword];
}

#pragma mark -TLSStrAccountRegListener
/**
 *  注册成功
 */
-(void)	OnStrAccountRegSuccess:(TLSUserInfo*)userInfo {
    //userInfo.identifier即为kUserName
    [[TLSHelper getInstance] TLSPwdLogin:userInfo.identifier andPassword:@"12345678" andTLSPwdLoginListener:self];
    //[self loginWith:userInfo];
}

/**
 *  注册失败
 *
 *  @param errInfo 错误信息
 */
-(void)	OnStrAccountRegFail:(TLSErrInfo *) errInfo {
    DLog(@"%@",errInfo.sErrorMsg);
    //已经注册过了 需要换个随机账号重新注册
    if (errInfo.dwErrorCode == 2) {
        //TODO:
    }
}

/**
 *  注册超时
 *
 *  @param errInfo 错误信息
 */
-(void)	OnStrAccountRegTimeout:(TLSErrInfo *) errInfo {
    [[HUDHelper sharedInstance] syncStopLoadingMessage:errInfo.sErrorMsg];
}

#pragma mark -TLSPwdLoginListener
/**
 *  密码登陆要求验证图片验证码
 *
 *  @param picData 图片验证码
 *  @param errInfo 错误信息
 */
-(void)	OnPwdLoginNeedImgcode:(NSData *)picData andErrInfo:(TLSErrInfo *)errInfo {
    
}

/**
 *  密码登陆请求图片验证成功
 *
 *  @param picData 图片验证码
 */
-(void)	OnPwdLoginReaskImgcodeSuccess:(NSData *)picData {
    
}

/**
 *  密码登陆成功
 *
 *  @param userInfo 用户信息
 */
-(void)	OnPwdLoginSuccess:(TLSUserInfo *)userInfo {
    [self loginWith:userInfo];
}

/**
 *  密码登陆失败
 *
 *  @param errInfo 错误信息
 */
-(void)	OnPwdLoginFail:(TLSErrInfo *)errInfo {
    
}

/**
 *  秘密登陆超时
 *
 *  @param errInfo 错误信息
 */
-(void)	OnPwdLoginTimeout:(TLSErrInfo *)errInfo {
    
}

#pragma mark -登录IMSDK
/**
 *  成功登录TLS之后，再登录IMSDK
 *
 *  @param userinfo 登录TLS成功之后回调回来的用户信息
 */
- (void)loginWith:(TLSUserInfo *)userinfo {
    //    _openQQ = nil;
    //    _tlsuiwx = nil;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (userinfo) {
            _loginParam.identifier = userinfo.identifier;
            _loginParam.userSig = [[TLSHelper getInstance] getTLSUserSig:userinfo.identifier];
            _loginParam.tokenTime = [[NSDate date] timeIntervalSince1970];
            // 获取本地的登录config
            [self loginIMSDK];
        }
    });
}

/**
 *  登录IMSDK
 */
- (void)loginIMSDK {
    //直接登录
    WEAKSELF
    [[IMAPlatform sharedInstance] login:_loginParam succ:^{
        DLog(@"%@",@"登录成功");
        [[IMAPlatform sharedInstance] configOnLoginSucc:_loginParam];
        [weakSelf configNickName];
    } fail:^(int code, NSString *msg) {
        [[HUDHelper sharedInstance] syncStopLoadingMessage:IMALocalizedError(code, msg) delay:2 completion:^{
        }];
    }];
}

- (void)configNickName {
    //如果是注册，默认设置nickName为kUserName
    if (_isRegist) {
        NSString *userName = [RCDataUtil readStringForKey:kUserName];
        [[IMAPlatform sharedInstance].host asyncSetNickname:userName succ:^{
            //[[HUDHelper sharedInstance] tipMessage:@"修改成功"];
            DLog(@"%@",@"设置nickName成功");
        } fail:nil];
    }
}

@end
