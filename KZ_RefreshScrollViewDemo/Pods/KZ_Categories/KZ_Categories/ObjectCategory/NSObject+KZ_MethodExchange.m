//
//  NSObject+KZ_MethodExchange.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import "NSObject+KZ_MethodExchange.h"
#import <objc/runtime.h>

@implementation NSObject (KZ_MethodExchange)

+ (void)kz_methodExchangeWithOldMethod:(SEL)oldSelect newSelect:(SEL)newSelect {
    [self kz_methodExchangeWithClass:[self class] oldMethod:oldSelect newSelect:newSelect];
}

+ (void)kz_methodExchangeWithClass:(Class)aClass oldMethod:(SEL)oldSelect newSelect:(SEL)newSelect {
    Method oldMethod = class_getInstanceMethod(aClass, oldSelect);
    Method newMethod = class_getInstanceMethod(aClass, newSelect);
    if (class_addMethod(aClass, oldSelect, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(aClass, newSelect, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
    }
    else {
        method_exchangeImplementations(oldMethod, newMethod);
    }
}

@end
