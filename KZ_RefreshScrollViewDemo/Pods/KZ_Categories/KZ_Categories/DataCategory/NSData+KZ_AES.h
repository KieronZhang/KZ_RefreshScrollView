//
//  NSData+KZ_AES.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/5/31.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (KZ_AES)

- (NSData *)kz_encodeAESDataWithKey:(NSString *)key;
- (NSData *)kz_decodeAESDataWithKey:(NSString *)key;

@end
