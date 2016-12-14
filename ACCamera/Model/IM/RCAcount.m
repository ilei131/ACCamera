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
}

@end

@implementation RCAcount
ImplementSharedIntance(RCAcount);

- (void)autoLoginTIM {
    _loginParam = [IMALoginParam loadFromLocal];
    [IMAPlatform configWith:_loginParam.config];
    if ([_loginParam isVailed]){
        [self autoLogin];
    }else{
        [self registLogin];
    }
}

- (void)autoLogin {
    
}

- (void)registLogin {
    int appid = [kSdkAppId intValue];
    int accType = [kSdkAccountType intValue];
    NSString *version = @"1.0";
    (void)[[QalSDKProxy sharedInstance] initWithAppid:appid andSDKAppid:appid andAccType:accType];
    TLSHelper *helper = [[TLSHelper getInstance] init:appid andAppVer:version];
    [helper TLSStrAccountReg:@"ilei1314" andPassword:@"12345678" andTLSStrAccountRegListener:self];
}

#pragma mark -TLSStrAccountRegListener
/**
 *  注册成功
 */
-(void)	OnStrAccountRegSuccess:(TLSUserInfo*)userInfo {
    [[TLSHelper getInstance] TLSPwdLogin:userInfo.identifier andPassword:@"12345678" andTLSPwdLoginListener:self];
    //[self loginWith:userInfo];
}

/**
 *  注册失败
 *
 *  @param errInfo 错误信息
 */
-(void)	OnStrAccountRegFail:(TLSErrInfo *) errInfo {

}

/**
 *  注册超时
 *
 *  @param errInfo 错误信息
 */
-(void)	OnStrAccountRegTimeout:(TLSErrInfo *) errInfo {
    
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
    [[IMAPlatform sharedInstance] login:_loginParam succ:^{
        [[HUDHelper sharedInstance] syncStopLoadingMessage:@"登录成功"];
        [[IMAPlatform sharedInstance] configOnLoginSucc:_loginParam];
    } fail:^(int code, NSString *msg) {
        [[HUDHelper sharedInstance] syncStopLoadingMessage:IMALocalizedError(code, msg) delay:2 completion:^{
        }];
    }];
}

@end
