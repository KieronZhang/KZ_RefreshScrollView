//
//  UIScrollView+KZ_Frame.h
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (KZ_Frame)

@property (nonatomic, assign) CGFloat insetTop;
@property (nonatomic, assign) CGFloat insetBottom;
@property (nonatomic, assign) CGFloat insetLeft;
@property (nonatomic, assign) CGFloat insetRight;

@property (nonatomic, assign) CGFloat offsetX;
@property (nonatomic, assign) CGFloat offsetY;

@property (nonatomic, assign) CGFloat contentWidth;
@property (nonatomic, assign) CGFloat contentHeight;

@property (nonatomic, assign, readonly) CGFloat adjustedInsetTop API_AVAILABLE(ios(11.0),tvos(11.0));
@property (nonatomic, assign, readonly) CGFloat adjustedInsetBottom API_AVAILABLE(ios(11.0),tvos(11.0));
@property (nonatomic, assign, readonly) CGFloat adjustedInsetLeft API_AVAILABLE(ios(11.0),tvos(11.0));
@property (nonatomic, assign, readonly) CGFloat adjustedInsetRight API_AVAILABLE(ios(11.0),tvos(11.0));

@end
