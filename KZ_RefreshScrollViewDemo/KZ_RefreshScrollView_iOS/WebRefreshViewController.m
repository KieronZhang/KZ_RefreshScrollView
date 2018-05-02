//
//  WebRefreshViewController.m
//  KZ_RefreshScrollView_iOS
//
//  Created by Kieron Zhang on 2018/4/28.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "WebRefreshViewController.h"
#import "TableViewCustomRefreshView.h"
#import "TableViewCustomLoadMoreView.h"
#import <KZ_RefreshScrollView_iOS/UIScrollView+KZ_Refresh.h>

@interface WebRefreshViewController ()

@property (nonatomic, strong) TableViewCustomRefreshView *refreshCustomView;
@property (nonatomic, strong) TableViewCustomLoadMoreView *loadMoreCustomView;

@end

@implementation WebRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"WebView刷新";
    self.view.backgroundColor = [UIColor whiteColor];
    
    mainWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    mainWebView.delegate = self;
    [self.view addSubview:mainWebView];
    
    self.refreshCustomView = [[TableViewCustomRefreshView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 100)];
    self.loadMoreCustomView = [[TableViewCustomLoadMoreView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 100)];
    
    __weak __typeof(self) weakSelf = self;
    [mainWebView.scrollView addRefreshViewWithScrollType:KZ_ComponentScrollType_OnlyScrollWhenMoveCertainDistance viewBlock:^UIView *{
        return weakSelf.refreshCustomView;
    } refreshingCompletionBlock:^{
        [weakSelf startLoadData];
    }];
    [mainWebView.scrollView addLoadMoreViewWithScrollType:KZ_ComponentScrollType_OnlyScrollWhenMoveCertainDistance viewBlock:^UIView *{
        return weakSelf.loadMoreCustomView;
    } loadingMoreCompletionBlock:^{
        [weakSelf startLoadData];
    }];
    
    [mainWebView.scrollView addRefreshNormalStatusBlock:^{
        [weakSelf.refreshCustomView normalStatus];
    }];
    [mainWebView.scrollView addReleaseToRefreshStatusBlock:^{
        [weakSelf.refreshCustomView releaseToRefreshStatus];
    }];
    [mainWebView.scrollView addRefreshingStatusBlock:^{
        [weakSelf.refreshCustomView refreshingStatus];
    }];
    [mainWebView.scrollView addRefreshScrollPercentBlock:^(float percent) {
        [weakSelf.refreshCustomView moveSquareWithPercent:percent];
    }];
    
    [mainWebView.scrollView addLoadMoreNormalStatusBlock:^{
        [weakSelf.loadMoreCustomView normalStatus];
    }];
    [mainWebView.scrollView addReleaseToLoadMoreStatusBlock:^{
        [weakSelf.loadMoreCustomView releaseToLoadMoreStatus];
    }];
    [mainWebView.scrollView addLoadingMoreStatusBlock:^{
        [weakSelf.loadMoreCustomView loadingMoreStatus];
    }];
    [mainWebView.scrollView addNoMoreToLoadStatusBlock:^{
        [weakSelf.loadMoreCustomView noMoreToLoadStatus];
    }];
    [mainWebView.scrollView addLoadMoreScrollPercentBlock:^(float percent) {
        [weakSelf.loadMoreCustomView moveSquareWithPercent:percent];
    }];
}

- (void)startLoadData {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.360.cn"]];
    [mainWebView loadRequest:request];
}

#pragma mark UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [mainWebView.scrollView allLoadCompletion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
