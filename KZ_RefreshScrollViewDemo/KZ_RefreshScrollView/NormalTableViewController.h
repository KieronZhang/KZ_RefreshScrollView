//
//  NormalTableViewController.h
//  KZ_RefreshScrollView
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NormalTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate> {
    UITableView *mainTableView;
    UISearchBar *searchBar;
    UISearchDisplayController *searchDisplayController;
    NSMutableArray *array;
}

- (id)initWithRefreshType:(int)type title:(NSString *)title;

@end
