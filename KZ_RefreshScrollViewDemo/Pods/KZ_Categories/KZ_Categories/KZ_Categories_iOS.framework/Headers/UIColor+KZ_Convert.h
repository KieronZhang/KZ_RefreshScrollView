//
//  UIColor+KZ_Convert.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KZ_Convert)

+ (NSArray *)kz_colorRGBWithColor:(UIColor *)color;
+ (UIColor *)kz_convertColorWithColor1:(UIColor *)color1 color2:(UIColor *)color2 percent:(float)percent;
+ (UIColor *)kz_gradientFromColor:(UIColor *)color1 toColor:(UIColor *)color2 startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end
