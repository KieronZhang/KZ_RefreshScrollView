//
//  NSData+KZ_Base64.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/5/31.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (KZ_Base64)

- (NSData *)kz_encodeBase64Data;
- (NSData *)kz_decodeBase64Data;

@end
