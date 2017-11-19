//
//  UIScreen+KZ_Capture.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/6/20.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (KZ_Capture)

+ (UIImage *)kz_capture;
+ (UIImage *)kz_captureWithStatusBar:(BOOL)statusBar;
+ (UIImage *)kz_captureWithStatusBar:(BOOL)statusBar rect:(CGRect)rect;
+ (UIImage *)kz_captureWithStatusBar:(BOOL)statusBar rect:(CGRect)rect orientation:(UIInterfaceOrientation)orientation;

@end
