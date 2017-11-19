//
//  NSData+KZ_Base64.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/5/31.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "NSData+KZ_Base64.h"

@implementation NSData (KZ_Base64)

- (NSData *)kz_encodeBase64Data {
    return [self base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (NSData *)kz_decodeBase64Data {
    return [[NSData alloc] initWithBase64EncodedData:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
}

@end
