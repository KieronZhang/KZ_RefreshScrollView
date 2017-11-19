//
//  UIImage+KZ_Effects.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KZ_Effects)

- (UIImage *)kz_applyCustomEffect;
- (UIImage *)kz_applyLightEffect;
- (UIImage *)kz_applyExtraLightEffect;
- (UIImage *)kz_applyDarkEffect;
- (UIImage *)kz_applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)kz_applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end
