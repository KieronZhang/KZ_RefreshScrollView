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

- (NSString *)kz_getDeviceInfo;            // 没有经过ULREncode的原始信息
- (NSString *)kz_getCellularProviderName;  // 获取运营商信息
- (NSString *)kz_getMNC;           //获取移动网络码
- (NSString *)kz_getMCC;           //获取国家码
- (NSString *)kz_getMACAddress;     // 获取MAC地址
- (BOOL)kz_isJailBreak;        // 判断是否越狱
+ (NSString *)kz_platform;
+ (NSString *)kz_platformString;
+ (BOOL)kz_hasRetinaDisplay;

@end
