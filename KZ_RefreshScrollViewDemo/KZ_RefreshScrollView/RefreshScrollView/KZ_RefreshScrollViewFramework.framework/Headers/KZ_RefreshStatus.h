//
//  KZ_RefreshStatus.h
//  KZ_RefreshScrollView
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

typedef NS_ENUM(NSUInteger, KZ_RefreshStatus) {
    KZ_RefreshStatus_None,
    KZ_RefreshStatus_Normal,
    KZ_RefreshStatus_ReleaseToRefresh,
    KZ_RefreshStatus_Refreshing,
};

typedef NS_ENUM(NSUInteger, KZ_LoadMoreStatus) {
    KZ_LoadMoreStatus_None,
    KZ_LoadMoreStatus_Normal,
    KZ_LoadMoreStatus_ReleaseToLoadMore,
    KZ_LoadMoreStatus_LoadingMore,
    KZ_LoadMoreStatus_NoMoreToLoad
};
