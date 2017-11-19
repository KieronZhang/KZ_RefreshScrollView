//
//  UIView+KZ_Capture.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/6/20.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KZ_Capture)

+ (UIImage *)kz_captureOfView:(UIView *)view;
- (UIImage *)kz_capture;
- (void)kz_captureContext:(CGContextRef)context transform:(CGAffineTransform)transform;

@end
