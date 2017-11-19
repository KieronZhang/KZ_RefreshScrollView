//
//  NSString+KZ_AES.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/5/31.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KZ_AES)

- (NSString *)kz_encodeAESStringWithKey:(NSString *)key;
- (NSString *)kz_decodeAESStringWithKey:(NSString *)key;

@end
