//
//  NSString+KZ_DES.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/5/31.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KZ_DES)

- (NSString *)kz_encodeDESStringWithKey:(NSString *)key;
- (NSString *)kz_decodeDESStringWithKey:(NSString *)key;

@end
