//
//  ScrollViewController.m
//  KZ_RefreshScrollView_iOS
//
//  Created by Kieron Zhang on 2018/4/28.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "ScrollViewController.h"
#import <KZ_RefreshScrollView_iOS/UIScrollView+KZ_Refresh.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wimplicit-retain-self"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    mainScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:mainScrollView];
    
    __weak __typeof(self) weakSelf = self;
    [mainScrollView addRefreshViewWithRefreshingCompletionBlock:^{
        [weakSelf endRefresh];
    }];
}

- (void)endRefresh {
    NSLog(@"refresh");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [mainScrollView allLoadCompletion];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma clang diagnostic pop

@end
