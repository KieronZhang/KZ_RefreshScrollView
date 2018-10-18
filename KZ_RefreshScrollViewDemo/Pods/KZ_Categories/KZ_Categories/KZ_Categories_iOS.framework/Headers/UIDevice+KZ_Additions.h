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

+ (NSString *)kz_platform; //设备型号信息
+ (NSString *)kz_platformString; //设备型号

+ (NSString *)kz_deviceInfo;            // 没有经过ULREncode的原始信息
+ (NSString *)kz_cellularProviderName;  // 运营商信息
+ (NSString *)kz_MNC;           //移动网络码
+ (NSString *)kz_MCC;           //国家码
+ (NSString *)kz_MACAddress;     // MAC地址
+ (NSString *)kz_IPAddresses; //IP地址
+ (BOOL)kz_isJailBreak;        // 判断是否越狱
+ (BOOL)kz_isRetinaDisplay;

+ (NSUInteger)kz_CPUCount;  //CPU总数目
+ (float)kz_CPUUsage;   //已使用的CPU比例
+ (NSArray *)kz_PerCPUUsage;  //每个cpu的使用比例

+ (int64_t)kz_totalDiskSpace;  //磁盘总空间
+ (int64_t)kz_freeDiskSpace;  //未使用的磁盘空间
+ (int64_t)kz_usedDiskSpace;  //已使用的磁盘空间

+ (int64_t)kz_TotalMemory;  //系统总内存空间
+ (int64_t)kz_ActiveMemory;   //活跃的内存, 正在使用或者很短时间内被使用过
+ (int64_t)kz_InActiveMemory;   //最近使用过,但是目前处于不活跃状态的内存
+ (int64_t)kz_FreeMemory;   //空闲的内存空间
+ (int64_t)kz_UsedMemory;   //已使用的内存空间
+ (int64_t)kz_WiredMemory;  //用来存放内核和数据结构的内存, framework, 用户级别的应用无法分配
+ (int64_t)kz_PurgableMemory;   //可释放的内存空间: 内存吃紧自动释放, 针对大对象存放所需的大块内存空间

@end
