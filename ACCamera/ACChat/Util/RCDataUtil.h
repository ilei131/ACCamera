//
//  RCDataUtil.h
//  ACCamera
//
//  Created by zhanggf on 17/2/2.
//  Copyright © 2017年 Zhanggf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCDataUtil : NSObject

+ (void)writeUserData:(id)data forKey:(NSString*)key;
//读取用户偏好设置
+ (id)readUserDataForKey:(NSString*)key;
//删除用户偏好设置
+ (void)removeUserDataForkey:(NSString*)key;

+ (NSString *)readStringForKey:(NSString *)key;

+ (NSString *)randomUser;
+ (NSString *)randomPassword;

@end
