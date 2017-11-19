//
//  NSString+KZ_Size.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import "NSString+KZ_Size.h"

@implementation NSString (KZ_Size)

- (CGFloat)kz_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width {
    return [self kz_sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)].height;
}

- (CGFloat)kz_widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height {
    return [self kz_sizeWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, height)].width;
}

- (CGSize)kz_sizeWithFont:(UIFont *)font {
    return [self kz_sizeWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
}

- (CGSize)kz_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width {
    return [self kz_sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)];
}

- (CGSize)kz_sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height {
    return [self kz_sizeWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, height)];
}

- (CGSize)kz_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    CGSize textSize;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName : textFont, NSParagraphStyleAttributeName : paragraph};
        textSize = [self boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine) attributes:attributes context:nil].size;
    }
    else {
        textSize = [self sizeWithFont:textFont constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName : textFont, NSParagraphStyleAttributeName : paragraph};
    textSize = [self boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine) attributes:attributes context:nil].size;
#endif
    return CGSizeMake(ceil(textSize.width), ceil(textSize.height));
}

@end
