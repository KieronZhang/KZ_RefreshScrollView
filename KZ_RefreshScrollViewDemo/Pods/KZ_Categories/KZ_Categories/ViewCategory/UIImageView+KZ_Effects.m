//
//  UIImageView+KZ_Effects.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import "UIImageView+KZ_Effects.h"
#import <objc/runtime.h>

@interface UIImageView ()

@property (nonatomic, strong) UIVisualEffectView *effectView;

@end

@implementation UIImageView (KZ_Effects)

- (void)kz_addBlurEffectWithExtraLightStyle {
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = self.bounds;
    [self addSubview:effectview];
    self.effectView = effectview;
}

- (void)kz_addBlurEffectWithLightStyle {
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = self.bounds;
    [self addSubview:effectview];
    self.effectView = effectview;
}

- (void)kz_addBlurEffectWithDarkStyle {
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = self.bounds;
    [self addSubview:effectview];
    self.effectView = effectview;
}

- (void)setEffectView:(UIVisualEffectView *)effectView {
    objc_setAssociatedObject(self, @"UIImageView_KZ_Effects_EffectView", effectView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIVisualEffectView *)effectView {
    return objc_getAssociatedObject(self, @"UIImageView_KZ_Effects_EffectView");
}

@end
