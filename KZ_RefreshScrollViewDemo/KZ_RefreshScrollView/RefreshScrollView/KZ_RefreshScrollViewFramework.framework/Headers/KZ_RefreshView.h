//
//  KZ_RefreshView.h
//  KZ_RefreshScrollView
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KZ_RefreshStatus.h"

@interface KZ_RefreshView : UIView {
    UILabel *titleLabel;
    UIActivityIndicatorView *activityView;
    UIImageView *arrowImageView;
    NSMutableDictionary *statusDictionary;
}
@property (nonatomic, assign) KZ_RefreshStatus status;

- (void)setText:(NSString *)text forStatus:(KZ_RefreshStatus)status;

@end
