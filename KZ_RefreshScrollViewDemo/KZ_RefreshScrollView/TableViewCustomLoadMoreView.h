//
//  TableViewCustomLoadMoreView.h
//  KZ_RefreshScrollView
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCustomLoadMoreView : UIView {
    UIActivityIndicatorView *activityView;
    UILabel *titleLabel;
    UIView *squareView;
}

- (void)moveSquareWithPercent:(float)percent;
- (void)normalStatus;
- (void)releaseToLoadMoreStatus;
- (void)loadingMoreStatus;
- (void)noMoreToLoadStatus;

@end
