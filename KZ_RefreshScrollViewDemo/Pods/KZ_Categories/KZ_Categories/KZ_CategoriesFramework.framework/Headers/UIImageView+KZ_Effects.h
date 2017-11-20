//
//  UIImageView+KZ_Effects.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (KZ_Effects)

@property (nonatomic, strong, readonly) UIVisualEffectView *effectView;

- (void)kz_addBlurEffectWithExtraLightStyle;
- (void)kz_addBlurEffectWithLightStyle;
- (void)kz_addBlurEffectWithDarkStyle;

@end
