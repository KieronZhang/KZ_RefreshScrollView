//
//  NSString+KZ_Radom.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import "NSString+KZ_Radom.h"

@implementation NSString (KZ_Radom)

+ (NSString *)kz_radom8BitString {
    return [self.class kz_radomStringWithLength:8];
}

+ (NSString *)kz_radom16BitString {
    return [self.class kz_radomStringWithLength:16];
}

+ (NSString *)kz_radom32BitString {
    return [self.class kz_radomStringWithLength:32];
}

+ (NSString *)kz_radom64BitString {
    return [self.class kz_radomStringWithLength:64];
}

+ (NSString *)kz_radomStringWithLength:(int)length {
    char data[length];
    for (int x = 0; x < length; data[x++] = (char)('A' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:length encoding:NSUTF8StringEncoding];
}

@end
