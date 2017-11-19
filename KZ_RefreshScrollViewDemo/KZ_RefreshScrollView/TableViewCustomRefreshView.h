//
//  TableViewCustomRefreshView.h
//  KZ_RefreshScrollView
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCustomRefreshView : UIView {
    UIImageView *backgroundImageView;
    UIImageView *logoImageView;
}

- (void)moveSquareWithPercent:(float)percent;
- (void)normalStatus;
- (void)releaseToRefreshStatus;
- (void)refreshingStatus;

@end
