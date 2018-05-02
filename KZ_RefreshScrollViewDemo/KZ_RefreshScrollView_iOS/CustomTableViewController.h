//
//  CustomTableViewController.h
//  KZ_RefreshScrollView_iOS
//
//  Created by Kieron Zhang on 2018/4/28.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate> {
    UITableView *mainTableView;
    UISearchBar *searchBar;
    UISearchDisplayController *searchDisplayController;
    NSMutableArray *array;
}

- (id)initWithRefreshType:(int)type title:(NSString *)title;

@end
