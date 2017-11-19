//
//  UIColor+KZ_Convert.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import "UIColor+KZ_Convert.h"

@implementation UIColor (KZ_Convert)

+ (NSArray *)kz_colorRGBWithColor:(UIColor *)color {
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    CGFloat alpha = 0.0;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    return @[@(red), @(green), @(blue), @(alpha)];
}

+ (UIColor *)kz_convertColorWithColor1:(UIColor *)color1 color2:(UIColor *)color2 percent:(float)percent {
    NSArray *colorArray1 = [[self class] kz_colorRGBWithColor:color1];
    CGFloat red1 = [colorArray1[0] floatValue];
    CGFloat green1 = [colorArray1[1] floatValue];
    CGFloat blue1 = [colorArray1[2] floatValue];
    CGFloat alpha1 = [colorArray1[3] floatValue];
    
    NSArray *colorArray2 = [[self class] kz_colorRGBWithColor:color2];
    CGFloat red2 = [colorArray2[0] floatValue];
    CGFloat green2 = [colorArray2[1] floatValue];
    CGFloat blue2 = [colorArray2[2] floatValue];
    CGFloat alpha2 = [colorArray2[3] floatValue];
    
    CGFloat red = red1 + (red2 - red1) * percent;
    CGFloat green = green1 + (green2 - green1) * percent;
    CGFloat blue = blue1 + (blue2 - blue1) * percent;
    CGFloat alpha = alpha1 + (alpha2 - alpha1) * percent;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)kz_gradientFromColor:(UIColor *)color1 toColor:(UIColor *)color2 startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    CGSize size = CGSizeMake(endPoint.x - startPoint.x, endPoint.y - startPoint.y);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    NSArray *colors = [NSArray arrayWithObjects:(id)color1.CGColor, (id)color2.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)colors, NULL);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

@end
