//
//  HomeCustomTableView.h
//  DxManager
//
//  Created by ligb on 16/9/7.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCustomTableView : UIView

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataSource;

@property (nonatomic , strong) UIViewController *homeVC;

@property (nonatomic , assign) NSUInteger index;

@property (nonatomic , assign) NSUInteger page;
@end
