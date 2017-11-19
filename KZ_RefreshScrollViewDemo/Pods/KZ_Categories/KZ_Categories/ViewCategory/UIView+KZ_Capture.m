//
//  UIView+KZ_Capture.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/6/20.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "UIView+KZ_Capture.h"

@implementation UIView (KZ_Capture)

+ (UIImage *)kz_captureOfView:(UIView *)view {
    return [view kz_capture];
}

- (UIImage *)kz_capture {
    CGSize imageSize = self.bounds.size;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self kz_captureContext:context transform:CGAffineTransformIdentity];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)kz_captureContext:(CGContextRef)context transform:(CGAffineTransform)transform {
    CGContextSaveGState(context);
    CGContextConcatCTM(context, transform);
    CGContextTranslateCTM(context, self.center.x, self.center.y);
    CGContextConcatCTM(context, self.transform);
    CGContextTranslateCTM(context, -self.bounds.size.width * self.layer.anchorPoint.x, -self.bounds.size.height * self.layer.anchorPoint.y);
    [self.layer renderInContext:context];
    CGContextRestoreGState(context);
}

@end
