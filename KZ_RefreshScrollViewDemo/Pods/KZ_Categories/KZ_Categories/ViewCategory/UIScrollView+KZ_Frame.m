//
//  UIScrollView+KZ_Frame.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import "UIScrollView+KZ_Frame.h"

@implementation UIScrollView (KZ_Frame)

- (void)setInsetTop:(CGFloat)insetTop {
    UIEdgeInsets inset = self.contentInset;
    inset.top = insetTop;
    self.contentInset = inset;
}

- (CGFloat)insetTop {
    return self.contentInset.top;
}

- (void)setInsetBottom:(CGFloat)insetBottom {
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = insetBottom;
    self.contentInset = inset;
}

- (CGFloat)insetBottom {
    return self.contentInset.bottom;
}

- (void)setInsetLeft:(CGFloat)insetLeft {
    UIEdgeInsets inset = self.contentInset;
    inset.left = insetLeft;
    self.contentInset = inset;
}

- (CGFloat)insetLeft {
    return self.contentInset.left;
}

- (void)setInsetRight:(CGFloat)insetRight {
    UIEdgeInsets inset = self.contentInset;
    inset.right = insetRight;
    self.contentInset = inset;
}

- (CGFloat)insetRight {
    return self.contentInset.right;
}

- (void)setOffsetX:(CGFloat)offsetX {
    CGPoint offset = self.contentOffset;
    offset.x = offsetX;
    self.contentOffset = offset;
}

- (CGFloat)offsetX {
    return self.contentOffset.x;
}

- (void)setOffsetY:(CGFloat)offsetY {
    CGPoint offset = self.contentOffset;
    offset.y = offsetY;
    self.contentOffset = offset;
}

- (CGFloat)offsetY {
    return self.contentOffset.y;
}

- (void)setContentWidth:(CGFloat)contentWidth {
    CGSize size = self.contentSize;
    size.width = contentWidth;
    self.contentSize = size;
}

- (CGFloat)contentWidth {
    return self.contentSize.width;
}

- (void)setContentHeight:(CGFloat)contentHeight {
    CGSize size = self.contentSize;
    size.height = contentHeight;
    self.contentSize = size;
}

- (CGFloat)contentHeight {
    return self.contentSize.height;
}

- (CGFloat)adjustedInsetTop {
    return self.adjustedContentInset.top;
}

- (CGFloat)adjustedInsetBottom {
    return self.adjustedContentInset.bottom;
}

- (CGFloat)adjustedInsetLeft {
    return self.adjustedContentInset.left;
}

- (CGFloat)adjustedInsetRight {
    return self.adjustedContentInset.right;
}

@end
