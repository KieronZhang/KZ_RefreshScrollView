//
//  NSString+KZ_Radom.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KZ_Radom)

+ (NSString *)kz_radom8BitString;
+ (NSString *)kz_radom16BitString;
+ (NSString *)kz_radom32BitString;
+ (NSString *)kz_radom64BitString;
+ (NSString *)kz_radomStringWithLength:(int)length;

@end
