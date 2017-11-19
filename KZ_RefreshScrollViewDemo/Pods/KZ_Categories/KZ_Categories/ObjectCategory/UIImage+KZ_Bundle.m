//
//  UIImage+KZ_Bundle.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/4/8.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "UIImage+KZ_Bundle.h"

@implementation UIImage (KZ_Bundle)

+ (UIImage *)kz_imageNamed:(NSString *)name bundleClass:(Class)bundleClass bundleName:(NSString *)bundleName {
    NSBundle *resourcesBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:bundleClass] pathForResource:bundleName ofType:@"bundle"]];
    return [UIImage imageNamed:name inBundle:resourcesBundle compatibleWithTraitCollection:nil];
}

@end
