//
//  UIDevice+KZ_Additions.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/5/18.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "UIDevice+KZ_Additions.h"
#include <sys/sysctl.h>														// sysctlbyname
#include <sys/socket.h> 														// MAC地址
#include <sys/sysctl.h>
#include <sys/types.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h> // 获取运营商信息时依赖这两个头文件,需要加入对库"CoreTelephony.framework"的依赖

@implementation UIDevice (KZ_Additions)

- (NSString *)kz_getSysInfoByName:(const char *)aTypeSpecifier {
    size_t size;
    sysctlbyname(aTypeSpecifier, NULL, &size, NULL, 0);
    char *answer = malloc(size);
    sysctlbyname(aTypeSpecifier, answer, &size, NULL, 0);
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    free(answer);
    return results;
}

// 目前没有区分iPad和iPhone的模拟器
- (NSString *)kz_platform {
    NSString *platformInfo = [self kz_getSysInfoByName:"hw.machine"];
    NSString *noUnderlinePlatFromInfo = [platformInfo stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    return noUnderlinePlatFromInfo;
}

- (NSString *)kz_getDeviceInfo {
    NSString *noUnderlineSystemVersion = [[UIDevice currentDevice].systemVersion stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    return [NSString stringWithFormat:DEVICEINFO_FORMAT, [self kz_platform], noUnderlineSystemVersion];
}

- (NSString *)kz_getCellularProviderName {
    @try {
        CTTelephonyNetworkInfo *netInfo = [[CTTelephonyNetworkInfo alloc] init];
        CTCarrier *carrier = [netInfo subscriberCellularProvider];
        NSString *cellularProviderName = [carrier carrierName];
        return cellularProviderName;
    } @catch (NSException *exception) {
        
    }
}

- (NSString *)kz_getMNC {
    CTTelephonyNetworkInfo *netInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netInfo subscriberCellularProvider];
    return [carrier mobileNetworkCode];
}

- (NSString *)kz_getMCC {
    CTTelephonyNetworkInfo *netInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netInfo subscriberCellularProvider];
    return [carrier mobileCountryCode];
}

- (NSString *)kz_getMACAddress {
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        return nil;
    }
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        return nil;
    }
    if ((buf = (char *)malloc(len)) == NULL) {
        return nil;
    }
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        free(buf);
        return nil;
    }
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr + 1), *(ptr + 2), *(ptr + 3), *(ptr + 4), *(ptr + 5)];
    free(buf);
    return [outstring uppercaseString];
}

- (BOOL)kz_isJailBreak {
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"]) {
        return YES;
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"]) {
        return YES;
    }
    return NO;
}

+ (NSString *)kz_platform {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString *)kz_platformString {
    NSString *platform = [self kz_platform];
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (Global)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (Global)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";

    if ([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch (1 Gen)";
    if ([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch (2 Gen)";
    if ([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch (3 Gen)";
    if ([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch (4 Gen)";
    if ([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch (5 Gen)";
    if ([platform isEqualToString:@"iPod7,1"]) return @"iPod Touch (6 Gen)";

    if ([platform isEqualToString:@"iPad1,1"]) return @"iPad";
    if ([platform isEqualToString:@"iPad1,2"]) return @"iPad 3G";
    if ([platform isEqualToString:@"iPad2,1"]) return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"]) return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini";
    if ([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"]) return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"]) return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"]) return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"]) return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,1"]) return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"]) return @"iPad Air (GSM)";
    if ([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini Retina (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini Retina (GSM)";
    if ([platform isEqualToString:@"iPad5,1"]) return @"iPad mini 4 (WiFi)";
    if ([platform isEqualToString:@"iPad5,2"]) return @"iPad mini 4 (Cellular)";
    if ([platform isEqualToString:@"iPad5,3"]) return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:@"iPad5,4"]) return @"iPad Air 2 (Cellular)";
    if ([platform isEqualToString:@"iPad6,3"]) return @"iPad Pro 9.7 inch (WiFi)";
    if ([platform isEqualToString:@"iPad6,4"]) return @"iPad Pro 9.7 inch (Cellular)";
    if ([platform isEqualToString:@"iPad6,7"]) return @"iPad Pro 12.9 inch (WiFi)";
    if ([platform isEqualToString:@"iPad6,8"]) return @"iPad Pro 12.9 inch (Cellular)";

    if ([platform isEqualToString:@"i386"]) return @"Simulator";
    if ([platform isEqualToString:@"x86_64"]) return @"Simulator";
    
    return platform;
}

+ (BOOL)kz_hasRetinaDisplay {
    return ([UIScreen mainScreen].scale > 1.0f);
}

@end
