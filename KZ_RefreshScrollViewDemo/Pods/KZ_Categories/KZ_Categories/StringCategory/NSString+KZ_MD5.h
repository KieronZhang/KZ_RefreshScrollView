//
//  NSString+KZ_MD5.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KZ_MD5)

- (NSString *)kz_md5With32Bit;
- (NSString *)kz_md5With32BitLowercase;
- (NSString *)kz_md5With32BitUppercase;

@end
