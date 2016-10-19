//
//  CommentView.h
//  DxManager
//
//  Created by ligb on 16/10/19.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentView : UIView

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataSource;

@property (nonatomic , assign) NSUInteger inputID;

- (void)loadData;

@end
