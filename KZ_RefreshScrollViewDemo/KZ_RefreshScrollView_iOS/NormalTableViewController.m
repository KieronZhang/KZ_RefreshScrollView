//
//  NormalTableViewController.m
//  KZ_RefreshScrollView_iOS
//
//  Created by Kieron Zhang on 2018/4/28.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "NormalTableViewController.h"
#import <KZ_RefreshScrollView_iOS/UIScrollView+KZ_Refresh.h>

#define kDefaultCount 3

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wimplicit-retain-self"

@interface NormalTableViewController ()

@property (nonatomic, assign) int type;
@property (nonatomic, strong) NSString *titleString;

@end

@implementation NormalTableViewController

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
    for (int i = 0; i < kDefaultCount; i++) {
        [array addObject:@(i)];
    }
    
    mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    mainTableView.backgroundColor = [UIColor clearColor];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    [self.view addSubview:mainTableView];
    mainTableView.tableFooterView = [[UIView alloc] init];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDisplayController.delegate = self;
    searchDisplayController.searchResultsDelegate = self;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsTableView.tableFooterView = [[UIView alloc] init];
    mainTableView.tableHeaderView = searchBar; // 如果添加搜索框，需要在设置searchDisplayController之后再设置tableHeaderView，否则层级会出问题
    
    __weak __typeof(self) weakSelf = self;
    [mainTableView addRefreshViewWithScrollType:self.type viewBlock:nil refreshingCompletionBlock:^{
        [weakSelf endRefresh];
    }];
    [mainTableView addLoadMoreViewWithScrollType:self.type viewBlock:nil loadingMoreCompletionBlock:^{
        [weakSelf endLoadMore];
    }];
    
    [searchDisplayController.searchResultsTableView addLoadMoreViewWithScrollType:self.type viewBlock:nil loadingMoreCompletionBlock:^{
        [weakSelf searchEndLoadMore];
    }];
    
    //    [mainTableView beginRefresh];
}

- (void)endRefresh {
    NSLog(@"refresh");
    [array removeAllObjects];
    for (int i = 0; i < kDefaultCount; i++) {
        [array addObject:@(i)];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [mainTableView reloadData];
        [mainTableView allLoadCompletion];
        if (array.count >= kDefaultCount * 3) {
            [mainTableView noMoreToLoad];
        }
    });
}

- (void)endLoadMore {
    for (int i = 0; i < kDefaultCount; i++) {
        [array addObject:@(i)];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [mainTableView allLoadCompletion];
        if (array.count >= kDefaultCount * 3) {
            [mainTableView noMoreToLoad];
        }
        [mainTableView reloadData];
    });
}

- (void)searchEndLoadMore {
    for (int i = 0; i < kDefaultCount; i++) {
        [array addObject:@(i)];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [searchDisplayController.searchResultsTableView reloadData];
        [searchDisplayController.searchResultsTableView allLoadCompletion];
        if (array.count >= kDefaultCount) {
            [searchDisplayController.searchResultsTableView noMoreToLoad];
        }
    });
}

#pragma mark UISearchDisplayDelegate
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [searchDisplayController.searchResultsTableView allLoadCompletion];
    return YES;
}

#pragma mark UITableViewDelegate
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
