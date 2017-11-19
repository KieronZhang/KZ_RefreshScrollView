//
//  NSString+KZ_Base64.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/5/31.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "NSString+KZ_Base64.h"
#import "NSData+KZ_Base64.h"

@implementation NSString (KZ_Base64)

- (NSString *)kz_encodeBase64String {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (NSString *)kz_decodeBase64String {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [[NSString alloc] initWithData:[data kz_decodeBase64Data] encoding:NSUTF8StringEncoding];
}

@end
