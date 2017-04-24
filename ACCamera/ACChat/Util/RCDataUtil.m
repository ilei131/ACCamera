//
//  RCDataUtil.m
//  ACCamera
//
//  Created by zhanggf on 17/2/2.
//  Copyright © 2017年 Zhanggf. All rights reserved.
//

#import "RCDataUtil.h"

@implementation RCDataUtil


+ (void)writeUserData:(id)data forKey:(NSString*)key {
    if (data == nil) {
        return;
    }else {
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

//读取用户偏好设置
+ (id)readUserDataForKey:(NSString*)key {
    id temp = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    if(temp != nil) {
        return temp;
    }
    
    return nil;
}

//删除用户偏好设置
+ (void)removeUserDataForkey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}

+ (NSString *)readStringForKey:(NSString *)key {
    NSString *temp = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    if(temp != nil) {
        return temp;
    }
    return nil;
}

+ (NSString *)getDeviceId {
    NSString * currentDeviceUUIDStr = [RCDataUtil readStringForKey:@"uuid"];
    if (currentDeviceUUIDStr == nil || [currentDeviceUUIDStr isEqualToString:@""])
    {
        NSUUID * currentDeviceUUID  = [UIDevice currentDevice].identifierForVendor;
        currentDeviceUUIDStr = currentDeviceUUID.UUIDString;
        currentDeviceUUIDStr = [currentDeviceUUIDStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
        currentDeviceUUIDStr = [currentDeviceUUIDStr lowercaseString];
        [RCDataUtil writeUserData:currentDeviceUUIDStr forKey:@"uuid"];
    }
    return currentDeviceUUIDStr;
}

+ (NSString *)randomUser {
    static int kNumber = 8;
    NSString *sourceStr = @"0123456789abcdefghijklmnopqrstuvwxyz";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++) {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

+ (NSString *)randomPassword {
    static int kNumber = 8;
    NSString *sourceStr = @"0123456789abcdefghijklmnopqrstuvwxyz";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++) {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

@end
