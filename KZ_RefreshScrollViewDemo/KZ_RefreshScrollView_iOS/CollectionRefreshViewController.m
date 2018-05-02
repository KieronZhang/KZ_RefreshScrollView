//
//  CollectionRefreshViewController.m
//  KZ_RefreshScrollView_iOS
//
//  Created by Kieron Zhang on 2018/4/28.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "CollectionRefreshViewController.h"
#import <KZ_RefreshScrollView_iOS/UIScrollView+KZ_Refresh.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wimplicit-retain-self"

@implementation CollectionRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CollectionView刷新";
    self.view.backgroundColor = [UIColor whiteColor];
    
    array = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 10; i++) {
        [array addObject:@(i)];
    }
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow.itemSize = CGSizeMake(100, 100);
    mainCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flow];
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    [self.view addSubview:mainCollectionView];
    [mainCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
    mainCollectionView.backgroundColor = [UIColor whiteColor];
    
    __weak __typeof(self) weakSelf = self;
    [mainCollectionView addRefreshViewWithRefreshingCompletionBlock:^{
        [weakSelf endRefresh];
    }];
    [mainCollectionView addLoadMoreViewWithLoadingMoreCompletionBlock:^{
        [weakSelf endLoadMore];
    }];
}

- (void)endRefresh {
    NSLog(@"refresh");
    [array removeAllObjects];
    for (int i = 0; i < 5; i++) {
        [array addObject:@(i)];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@", [NSValue valueWithUIEdgeInsets:mainCollectionView.contentInset]);
        [mainCollectionView allLoadCompletion];
        [mainCollectionView reloadData];
        NSLog(@"%@", [NSValue valueWithUIEdgeInsets:mainCollectionView.contentInset]);
    });
}

- (void)endLoadMore {
    for (int i = 0; i < 5; i++) {
        [array addObject:@(i)];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [mainCollectionView allLoadCompletion];
        if (array.count >= 20) {
            [mainCollectionView noMoreToLoad];
        }
        [mainCollectionView reloadData];
    });
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", [NSValue valueWithCGSize:collectionView.contentSize]);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma clang diagnostic pop

@end
