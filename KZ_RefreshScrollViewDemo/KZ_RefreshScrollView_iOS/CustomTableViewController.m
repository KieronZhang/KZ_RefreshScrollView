//
//  CustomTableViewController.m
//  KZ_RefreshScrollView_iOS
//
//  Created by Kieron Zhang on 2018/4/28.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "CustomTableViewController.h"
#import "TableViewCustomRefreshView.h"
#import "TableViewCustomLoadMoreView.h"
#import <KZ_RefreshScrollView_iOS/UIScrollView+KZ_Refresh.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wimplicit-retain-self"

@interface CustomTableViewController ()

@property (nonatomic, assign) int type;
@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) TableViewCustomRefreshView *refreshView;
@property (nonatomic, strong) TableViewCustomLoadMoreView *loadMoreView;

@end

@implementation CustomTableViewController

- (id)initWithRefreshType:(int)type title:(NSString *)title {
    self = [super init];
    if (self) {
        self.type = type;
        self.titleString = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleString;
    self.view.backgroundColor = [UIColor whiteColor];
    
    array = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 5; i++) {
        [array addObject:@(i)];
    }
    
    mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    mainTableView.backgroundColor = [UIColor clearColor];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    mainTableView.estimatedRowHeight = 0;
    mainTableView.estimatedSectionFooterHeight = 0;
    mainTableView.estimatedSectionHeaderHeight = 0;
    [self.view addSubview:mainTableView];
    mainTableView.tableFooterView = [[UIView alloc] init];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDisplayController.searchResultsDelegate = self;
    searchDisplayController.searchResultsDataSource = self;
    mainTableView.tableHeaderView = searchBar; // 如果添加搜索框，需要在设置searchDisplayController之后再设置tableHeaderView，否则层级会出问题
    
    self.refreshView = [[TableViewCustomRefreshView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(mainTableView.bounds), 100)];
    self.loadMoreView = [[TableViewCustomLoadMoreView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(mainTableView.bounds), 100)];
    
    __weak __typeof(self) weakSelf = self;
    [mainTableView addRefreshViewWithScrollType:self.type viewBlock:^UIView *{
        return weakSelf.refreshView;
    } refreshingCompletionBlock:^{
        [weakSelf endRefresh];
    }];
    [mainTableView addLoadMoreViewWithScrollType:self.type viewBlock:^UIView *{
        return weakSelf.loadMoreView;
    } loadingMoreCompletionBlock:^{
        [weakSelf endLoadMore];
    }];
    
    [mainTableView addRefreshNormalStatusBlock:^{
        [weakSelf.refreshView normalStatus];
    }];
    [mainTableView addReleaseToRefreshStatusBlock:^{
        [weakSelf.refreshView releaseToRefreshStatus];
    }];
    [mainTableView addRefreshingStatusBlock:^{
        [weakSelf.refreshView refreshingStatus];
    }];
    [mainTableView addRefreshScrollPercentBlock:^(float percent) {
        [weakSelf.refreshView moveSquareWithPercent:percent];
    }];
    
    [mainTableView addLoadMoreNormalStatusBlock:^{
        [weakSelf.loadMoreView normalStatus];
    }];
    [mainTableView addReleaseToLoadMoreStatusBlock:^{
        [weakSelf.loadMoreView releaseToLoadMoreStatus];
    }];
    [mainTableView addLoadingMoreStatusBlock:^{
        [weakSelf.loadMoreView loadingMoreStatus];
    }];
    [mainTableView addNoMoreToLoadStatusBlock:^{
        [weakSelf.loadMoreView noMoreToLoadStatus];
    }];
    [mainTableView addLoadMoreScrollPercentBlock:^(float percent) {
        [weakSelf.loadMoreView moveSquareWithPercent:percent];
    }];
}

- (void)endRefresh {
    NSLog(@"refresh");
    [array removeAllObjects];
    for (int i = 0; i < 5; i++) {
        [array addObject:@(i)];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [mainTableView allLoadCompletion];
        [mainTableView reloadData];
    });
}

- (void)endLoadMore {
    for (int i = 0; i < 5; i++) {
        [array addObject:@(i)];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [mainTableView allLoadCompletion];
        if (array.count >= 20) {
            [mainTableView noMoreToLoad];
        }
        [mainTableView reloadData];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *NameCell = @"NameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NameCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NameCell];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d", (int)indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma clang diagnostic pop

@end
