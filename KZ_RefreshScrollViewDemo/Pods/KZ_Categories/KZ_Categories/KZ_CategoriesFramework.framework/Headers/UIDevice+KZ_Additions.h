//
//  UIDevice+KZ_Additions.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/5/18.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PLATFORM_FORMAT @"%@,%@"
#define DEVICEINFO_FORMAT @"%@_%@"

@interface UIDevice (KZ_Additions)

+ (NSString *)kz_deviceInfo;            // 没有经过ULREncode的原始信息
+ (NSString *)kz_cellularProviderName;  // 获取运营商信息
+ (NSString *)kz_MNC;           //获取移动网络码
+ (NSString *)kz_MCC;           //获取国家码
+ (NSString *)kz_MACAddress;     // 获取MAC地址
+ (BOOL)kz_isJailBreak;        // 判断是否越狱
+ (NSString *)kz_platform; //设备型号信息
+ (NSString *)kz_platformString; //设备型号
+ (BOOL)kz_isRetinaDisplay;

@end
