//
//  UIScreen+KZ_Capture.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/6/20.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "UIScreen+KZ_Capture.h"
#import "UIView+KZ_Capture.h"
#import "UIView+KZ_StatusBar.h"

@implementation UIScreen (KZ_Capture)

+ (UIImage *)kz_capture {
    return [[self class] kz_captureWithStatusBar:YES];
}

+ (UIImage *)kz_captureWithStatusBar:(BOOL)statusBar {
    CGRect captureRect = [UIScreen mainScreen].bounds;
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        CGFloat oldWidth = captureRect.size.width;
        captureRect.size.width = captureRect.size.height;
        captureRect.size.height = oldWidth;
    }
    return [[self class] kz_captureWithStatusBar:statusBar rect:captureRect];
}

+ (UIImage *)kz_captureWithStatusBar:(BOOL)statusBar rect:(CGRect)rect {
    return [[self class] kz_captureWithStatusBar:statusBar rect:rect orientation:[UIApplication sharedApplication].statusBarOrientation];
}

+ (UIImage *)kz_captureWithStatusBar:(BOOL)statusBar rect:(CGRect)rect orientation:(UIInterfaceOrientation)orientation {
    CGRect screenRect = [UIScreen mainScreen].bounds;
    CGFloat screenWidth = CGRectGetWidth(screenRect);
    CGFloat screenHeight = CGRectGetHeight(screenRect);
    CGAffineTransform preTransform = CGAffineTransformIdentity;
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
            preTransform = CGAffineTransformTranslate(preTransform, -rect.origin.x, -rect.origin.y);
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            preTransform = CGAffineTransformTranslate(preTransform, screenWidth - rect.origin.x, -rect.origin.y);
            preTransform = CGAffineTransformRotate(preTransform, M_PI);
            preTransform = CGAffineTransformTranslate(preTransform, 0, -screenHeight);
            break;
        case UIInterfaceOrientationLandscapeLeft:
            preTransform = CGAffineTransformTranslate(preTransform, -rect.origin.x, -rect.origin.y);
            preTransform = CGAffineTransformRotate(preTransform, M_PI_2);
            preTransform = CGAffineTransformTranslate(preTransform, 0, -screenHeight);
            break;
        case UIInterfaceOrientationLandscapeRight:
            preTransform = CGAffineTransformTranslate(preTransform, screenHeight - rect.origin.x, screenWidth - rect.origin.y);
            preTransform = CGAffineTransformRotate(preTransform, - M_PI_2);
            preTransform = CGAffineTransformTranslate(preTransform, 0, -screenHeight);
            break;
        default:
            break;
    }
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    BOOL hasTakenStatusBarcapture = NO;
    for (UIWindow *window in [UIApplication sharedApplication].windows) {
        if (![window respondsToSelector:@selector(screen)] || window.screen == [UIScreen mainScreen]) {
            [window kz_captureContext:context transform:preTransform];
        }
        if (statusBar && !hasTakenStatusBarcapture) {
            NSArray *windows = [UIApplication sharedApplication].windows;
            NSUInteger currentWindowIndex = [windows indexOfObject:window];
            if (windows.count > currentWindowIndex + 1) {
                UIWindow *nextWindow = windows[currentWindowIndex + 1];
                if (nextWindow.windowLevel > UIWindowLevelStatusBar) {
                    [[self class] kz_mergeStatusBarToContext:context rect:rect captureOrientation:orientation];
                    hasTakenStatusBarcapture = YES;
                }
            }
            else {
                [[self class] kz_mergeStatusBarToContext:context rect:rect captureOrientation:orientation];
                hasTakenStatusBarcapture = YES;
            }
        }
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (void)kz_mergeStatusBarToContext:(CGContextRef)context rect:(CGRect)rect captureOrientation:(UIInterfaceOrientation)orientation {
    UIView *statusBarView = [UIView kz_statusBarInstance];
    UIInterfaceOrientation statusBarOrientation = [UIApplication sharedApplication].statusBarOrientation;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGAffineTransform preTransform = CGAffineTransformIdentity;
    if (orientation == statusBarOrientation) {
        preTransform = CGAffineTransformTranslate(preTransform, -rect.origin.x, -rect.origin.y);
    }
    else if ((orientation == UIInterfaceOrientationPortrait && statusBarOrientation == UIInterfaceOrientationLandscapeLeft) || (orientation == UIInterfaceOrientationPortraitUpsideDown && statusBarOrientation == UIInterfaceOrientationLandscapeRight)) {
        preTransform = CGAffineTransformTranslate(preTransform, 0, rect.size.height);
        preTransform = CGAffineTransformRotate(preTransform, - M_PI_2);
        preTransform = CGAffineTransformTranslate(preTransform, CGRectGetMaxY(rect) - screenHeight, -rect.origin.x);
    }
    else if ((orientation == UIInterfaceOrientationPortrait && statusBarOrientation == UIInterfaceOrientationLandscapeRight) ||
             (orientation == UIInterfaceOrientationPortraitUpsideDown && statusBarOrientation == UIInterfaceOrientationLandscapeLeft)) {
        preTransform = CGAffineTransformTranslate(preTransform, 0, rect.size.height);
        preTransform = CGAffineTransformRotate(preTransform, M_PI_2);
        preTransform = CGAffineTransformTranslate(preTransform, -CGRectGetMaxY(rect), rect.origin.x - screenWidth);
    }
    else if ((orientation == UIInterfaceOrientationPortrait && statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown) ||
             (orientation == UIInterfaceOrientationPortraitUpsideDown && statusBarOrientation == UIInterfaceOrientationPortrait)) {
        preTransform = CGAffineTransformTranslate(preTransform, 0, rect.size.height);
        preTransform = CGAffineTransformRotate(preTransform, - M_PI);
        preTransform = CGAffineTransformTranslate(preTransform, rect.origin.x - screenWidth, CGRectGetMaxY(rect) - screenHeight);
    }
    else if ((orientation == UIInterfaceOrientationLandscapeLeft && statusBarOrientation == UIInterfaceOrientationPortrait) ||
             (orientation == UIInterfaceOrientationLandscapeRight && statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) {
        preTransform = CGAffineTransformTranslate(preTransform, 0, rect.size.height);
        preTransform = CGAffineTransformRotate(preTransform, M_PI_2);
        preTransform = CGAffineTransformTranslate(preTransform, -CGRectGetMaxY(rect), rect.origin.x - screenHeight);
    }
    else if ((orientation == UIInterfaceOrientationLandscapeLeft && statusBarOrientation == UIInterfaceOrientationLandscapeRight) ||
             (orientation == UIInterfaceOrientationLandscapeRight && statusBarOrientation == UIInterfaceOrientationLandscapeLeft)) {
        preTransform = CGAffineTransformTranslate(preTransform, 0, rect.size.height);
        preTransform = CGAffineTransformRotate(preTransform, M_PI);
        preTransform = CGAffineTransformTranslate(preTransform, rect.origin.x - screenHeight, CGRectGetMaxY(rect) - screenWidth);
    }
    else if ((orientation == UIInterfaceOrientationLandscapeLeft && statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown) ||
             (orientation == UIInterfaceOrientationLandscapeRight && statusBarOrientation == UIInterfaceOrientationPortrait)) {
        preTransform = CGAffineTransformTranslate(preTransform, 0, rect.size.height);
        preTransform = CGAffineTransformRotate(preTransform, - M_PI_2);
        preTransform = CGAffineTransformTranslate(preTransform, CGRectGetMaxY(rect) - screenWidth, -rect.origin.x);
    }
    [statusBarView kz_captureContext:context transform:preTransform];
}

@end
