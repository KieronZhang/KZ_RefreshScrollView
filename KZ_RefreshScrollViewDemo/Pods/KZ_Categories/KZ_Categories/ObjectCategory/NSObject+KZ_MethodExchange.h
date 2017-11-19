//
//  NSObject+KZ_MethodExchange.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KZ_MethodExchange)

+ (void)kz_methodExchangeWithOldMethod:(SEL)oldSelect newSelect:(SEL)newSelect;
+ (void)kz_methodExchangeWithClass:(Class)aClass oldMethod:(SEL)oldSelect newSelect:(SEL)newSelect;

@end
