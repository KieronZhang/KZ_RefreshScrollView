//
//  CollectionRefreshViewController.h
//  KZ_RefreshScrollView_iOS
//
//  Created by Kieron Zhang on 2018/4/28.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionRefreshViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    UICollectionView *mainCollectionView;
    NSMutableArray *array;
}

@end
