//
//  NSData+KZ_DES.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/5/31.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (KZ_DES)

- (NSData *)kz_encodeDESDataWithKey:(NSString *)key;
- (NSData *)kz_decodeDESDataWithKey:(NSString *)key;

@end
