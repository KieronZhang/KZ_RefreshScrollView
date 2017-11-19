//
//  KZ_MacroDefinition.h
//  KZ_MacroDefinition
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#ifndef KZ_MacroDefinition_h
#define KZ_MacroDefinition_h

//-------------------获取设备大小-------------------------
//获取屏幕 宽度、高度
#define KZ_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define KZ_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define KZ_SCREEN_RADIO (([UIScreen mainScreen].bounds.size.width) / 320.0f)

//-------------------打印日志-------------------------
//重写NSLog, Debug模式下打印日志和当前行数
#if DEBUG
#define KZ_DebugLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define KZ_DebugLog(FORMAT, ...) nil
#endif

//----------------------系统----------------------------
//获取系统版本
#define KZ_IOS_Version [UIDevice currentDevice].systemVersion.floatValue
#define KZ_CurrentSystemVersion [UIDevice currentDevice].systemVersion

#define KZ_IOS_8 (KZ_IOS_Version >= 8.0)
#define KZ_IOS_9 (KZ_IOS_Version >= 9.0)
#define KZ_IOS_10 (KZ_IOS_Version >= 10.0)
#define KZ_IOS_11 (KZ_IOS_Version >= 11.0)

//获取当前语言
#define KZ_CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//判断是否是iPad
#define KZ_ISPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define KZ_ColorFromRGBA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:a]
#define KZ_ColorFromRGB(rgbValue) KZ_ColorFromRGBA(rgbValue, 1.0)

//----------------------其他----------------------------
//GCD
#define KZ_Async_Queue(Queue, block) dispatch_async(Queue, block)
#define KZ_Global_Queue(block) KZ_Async_Queue(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define KZ_Main_Queue(block) KZ_Async_Queue(dispatch_get_main_queue(), block)

//NSUserDefaults 实例化
#define KZ_USER_DEFAULT [NSUserDefaults standardUserDefaults]

//由角度获取弧度 有弧度获取角度
#define KZ_DegreesToRadian(x) (M_PI * (x) / 180.0)
#define KZ_RadianToDegrees(radian) (radian*180.0)/(M_PI)

#endif /* KZ_MacroDefinition_h */
