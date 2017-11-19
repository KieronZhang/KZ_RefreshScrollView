//
//  NSString+KZ_Size.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (KZ_Size)

- (CGFloat)kz_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (CGFloat)kz_widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;
- (CGSize)kz_sizeWithFont:(UIFont *)font;
- (CGSize)kz_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (CGSize)kz_sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;
- (CGSize)kz_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
