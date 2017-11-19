//
//  UIView+KZ_Frame.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import "UIView+KZ_Frame.h"

@implementation UIView (KZ_Frame)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setMidX:(CGFloat)midX {
    self.x = midX - self.width / 2;
}

- (CGFloat)midX {
    return self.x + self.width / 2;
}

- (void)setMidY:(CGFloat)midY {
    self.y = midY - self.height / 2;
}

- (CGFloat)midY {
    return self.y + self.height / 2;
}

- (void)setMaxX:(CGFloat)maxX {
    self.x = maxX - self.width;
}

- (CGFloat)maxX {
    return self.x + self.width;
}

- (void)setMaxY:(CGFloat)maxY {
    self.y = maxY - self.height;
}

- (CGFloat)maxY {
    return self.y + self.height;
}

- (void)setLeft:(CGFloat)left {
    self.x = left;
}

- (CGFloat)left {
    return self.x;
}

- (void)setTop:(CGFloat)top {
    self.y = top;
}

- (CGFloat)top {
    return self.y;
}

- (void)setRight:(CGFloat)right {
    if (!self.superview) {
        return;
    }
    self.maxX = self.superview.width - right;
}

- (CGFloat)right {
    if (!self.superview) {
        return 0;
    }
    return self.superview.width - self.maxX;
}

- (void)setBottom:(CGFloat)bottom {
    if (!self.superview) {
        return;
    }
    self.maxY = self.superview.height - bottom;
}

- (CGFloat)bottom {
    if (!self.superview) {
        return 0;
    }
    return self.superview.height - self.maxY;
}

@end
