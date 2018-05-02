//
//  KZ_LoadMoreView.h
//  KZ_RefreshScrollView
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KZ_RefreshStatus.h"

@interface KZ_LoadMoreView : UIView {
    UIActivityIndicatorView *activityView;
    UILabel *titleLabel;
    NSMutableDictionary *statusDictionary;
}
@property (nonatomic, assign) KZ_LoadMoreStatus status;

- (void)setText:(NSString *)text forStatus:(KZ_LoadMoreStatus)status;

@end
