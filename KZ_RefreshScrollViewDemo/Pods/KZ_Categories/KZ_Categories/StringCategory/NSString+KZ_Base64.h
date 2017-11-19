//
//  NSString+KZ_Base64.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/5/31.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KZ_Base64)

- (NSString *)kz_encodeBase64String;
- (NSString *)kz_decodeBase64String;

@end
