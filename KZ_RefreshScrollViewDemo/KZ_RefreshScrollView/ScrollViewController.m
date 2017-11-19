//
//  ScrollViewController.m
//  KZ_RefreshScrollView
//
//  Created by Kieron Zhang on 2017/8/12.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "ScrollViewController.h"
#import <KZ_RefreshScrollViewFramework/UIScrollView+KZ_Refresh.h>

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

@end
