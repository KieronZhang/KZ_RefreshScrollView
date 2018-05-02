//
//  TableViewCustomLoadMoreView.h
//  KZ_RefreshScrollView_iOS
//
//  Created by Kieron Zhang on 2018/4/28.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
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
