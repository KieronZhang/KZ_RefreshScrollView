//
//  UIImage+KZ_Bundle.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2017/4/8.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KZ_Bundle)

+ (UIImage *)kz_imageNamed:(NSString *)name bundleClass:(Class)bundleClass bundleName:(NSString *)bundleName;

@end
