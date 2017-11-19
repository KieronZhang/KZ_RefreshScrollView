//
//  UIView+KZ_StatusBar.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/6/20.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "UIView+KZ_StatusBar.h"
#import "NSObject+KZ_MethodExchange.h"

static UIView *statusBarInstance = nil;

@implementation UIView (KZ_StatusBar)

+ (UIView *)kz_statusBarInstance {
    return statusBarInstance;
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class statusBarClass = NSClassFromString(@"UIStatusBar");
        [statusBarClass kz_methodExchangeWithOldMethod:@selector(setFrame:) newSelect:@selector(kz_StatusBarSetFrame:)];
        [statusBarClass kz_methodExchangeWithOldMethod:NSSelectorFromString(@"dealloc") newSelect:@selector(kz_StatusBarDealloc)];
    });
}

- (void)kz_StatusBarSetFrame:(CGRect)frame {
    [self kz_StatusBarSetFrame:frame];
    statusBarInstance = self;
}

- (void)kz_StatusBarDealloc {
    statusBarInstance = nil;
    [self kz_StatusBarDealloc];
}

@end
