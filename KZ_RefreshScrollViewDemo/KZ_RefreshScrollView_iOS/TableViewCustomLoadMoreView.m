//
//  TableViewCustomLoadMoreView.m
//  KZ_RefreshScrollView_iOS
//
//  Created by Kieron Zhang on 2018/4/28.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "TableViewCustomLoadMoreView.h"

@implementation TableViewCustomLoadMoreView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 75)];
    if (self) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, [UIScreen mainScreen].bounds.size.width - 100, CGRectGetHeight(self.bounds))];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:13.0f];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor colorWithRed:0x2a / 255.0f green:0x2a / 255.0f blue:0x2a / 255.0f alpha:1.0f];
        [self addSubview:titleLabel];
        
        activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityView.center = CGPointMake(40, CGRectGetMidY(self.bounds));
        [self addSubview:activityView];
        
        squareView = [[UIView alloc] initWithFrame:CGRectMake(5, CGRectGetHeight(self.bounds) - 10, 10, 10)];
        squareView.backgroundColor = [UIColor yellowColor];
        [self addSubview:squareView];
    }
    return self;
}

- (void)moveSquareWithPercent:(float)percent {
    squareView.center = CGPointMake(CGRectGetWidth(self.bounds) * percent, CGRectGetHeight(self.bounds) - 10);
}

- (void)normalStatus {
    [activityView stopAnimating];
    titleLabel.text = @"上拉刷新";
}

- (void)releaseToLoadMoreStatus {
    [activityView stopAnimating];
    titleLabel.text = @"释放刷新";
}

- (void)loadingMoreStatus {
    [activityView startAnimating];
    titleLabel.text = @"正在刷新";
}

- (void)noMoreToLoadStatus {
    [activityView stopAnimating];
    titleLabel.text = @"没有更多";
}

@end
