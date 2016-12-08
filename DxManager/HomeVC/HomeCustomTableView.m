//
//  HomeCustomTableView.m
//  DxManager
//
//  Created by ligb on 16/9/7.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "HomeCustomTableView.h"
#import "TrendsTableViewCell.h"
#import "AppDefine.h"
#import "ItemVIewsHeight.h"
#import "DetailViewController.h"
#import "BKReplyInputView.h"
#import "ReportTableViewCell.h"

@interface HomeCustomTableView ()<UITableViewDelegate,UITableViewDataSource,InputDelegate>
{
    NSInteger       _commentId;
  
}
@property (nonatomic , strong)BKReplyInputView *replyView;
@property (nonatomic , assign) BOOL addNotCent;
@end

@implementation HomeCustomTableView

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"reportNotificationCenter" object:nil];
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _page = 1;
        self.addNotCent = YES;
        [self addSubview:self.tableView];
    }
    return self;
}
- (NSMutableArray *)dataSource{
    if (nil == _dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _dataSource;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.layer.borderWidth = 1;
//        _tableView.layer.borderColor = [UIColor redColor].CGColor;
        [self addSubview:_tableView];
        
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        
        //寬度
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)]];
        
        //高度
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)]];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(beginRefreshingAction)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(uploadingAction)];
    }
    return _tableView;
}
- (BKReplyInputView *)replyView{
    if (!_replyView) {
        _replyView = [[BKReplyInputView alloc] initWithFrame:CGRectMake(0, self.screen_H- 300, self.screen_W, 300)];
        _replyView.delegate = self;
        [self addSubview:_replyView];
        
    }
    return _replyView;
}
//下拉刷新
- (void)beginRefreshingAction{
    _page = 1;
    self.index = _index;
}
//上拉加载更多
- (void)uploadingAction{
    _page ++;
    self.index = _index;
}
- (void)setIndex:(NSUInteger)index{
    _index = index;
    [self showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getNewsList",@"aid":@(index),@"page":@(_page)} completion:^(BNetData *model, NSString *netErr) {
        [self removeHUDActivity];
        
        NSLog(@"data = %@",model.data);
        if (model.status == 0) {
            //请求成功
            NSArray *array = model.data;
            if ( _page == 1 ) {
                if ([array isKindOfClass:[NSArray class]] && array.count) {
                    [self.dataSource setArray:model.data];
                    [_tableView.mj_footer resetNoMoreData];
                }
            }else{
                if ([array isKindOfClass:[NSArray class]] && array.count) {
                    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        [self.dataSource addObject:obj];
                    }];
                }else{
                    [self showHUDTitleView:@"没有更多数据" image:nil];
                    [_tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            
            [_tableView reloadData];
            
            if (self.dataSource.count == 0) {
                [self showHUDTitleView:@"此分类暂无数据" image:nil];
            }
            
        }else{
            [self showHUDTitleView:model.message image:nil];
        }
        [_tableView endRefreshing];
        
    }];
    
    if (index == 68) {
        _commentId = 0;
        
        if (self.addNotCent) {
            //添加互动投诉 回复通知
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"reportNotificationCenter" object:nil];
            self.addNotCent = NO;
        }
       
    }
    
}
- (void)handleNotification:(NSNotification *)notification{
    NSDictionary *info = [notification object];
    NSLog(@"info -= %@",info);
    self.replyView.replyTag = [info[@"inputID"] integerValue];
    _commentId = [info[@"commentid"] integerValue];
    [self.replyView.textView becomeFirstResponder];
}

#pragma mark
#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.index == 68) {
        //互动投诉
        static NSString *xibName = @"ReportTableViewCell";
        ReportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.info = self.dataSource[indexPath.row];
        cell.btnCheck.tag = indexPath.row;
        cell.imagesView.viewController = self.homeVC;
        //添加回复button
        [cell.btnCheck addTarget:self action:@selector(didDetailAction:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else{
        static NSString *xibName = @"TrendsTableViewCell";
        TrendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.info = self.dataSource[indexPath.row];
        cell.btnCheck.tag = indexPath.row;
        cell.imagesView.viewController = self.homeVC;

        [cell.btnCheck addTarget:self action:@selector(didDetailAction:) forControlEvents:UIControlEventTouchUpInside];
        return cell;

    }
}
- (void)didDetailAction:(UIButton *)btn{
    if (self.index == 68) {
        //回复互动投诉
        self.replyView.replyTag = [self.dataSource[btn.tag][@"id"] integerValue];
         [self.replyView.textView becomeFirstResponder];
        return;
    }
    DetailViewController *detailVC = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailVC.info = self.dataSource[btn.tag];
    [self.homeVC.navigationController pushViewController:detailVC animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)itemsImages:(NSDictionary *)item{
    NSArray *items = item[@"albums"];
    return [ItemVIewsHeight loadItmesCounts:items.count] + [ItemVIewsHeight loadTextContentsMaxWidth:95 string:item[@"zhaiyao"]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [self itemsImages:self.dataSource[indexPath.row]];
    if (self.index == 68) {//互动投诉 高度
        NSArray *comment = self.dataSource[indexPath.row][@"comment"];
        float comH = comment.count * 25;
        return 115 + height + comH;
    }
    return 100 + height;
}
#pragma mark  回复
#pragma mark InputDeledate
//发表回复
- (void)replyInputWithText:(NSString *)replyText appendTag:(NSInteger)inputTag{
    if ([@"" isStringBlank:replyText]) {
       [self showHUDTitleView:@"请添加描述文字再评论" image:nil];
        return;
    }
    NSDictionary *userInfo = [SavaData parseDicFromFile:User_File];
    NSDictionary *info = @{@"action":@"doNewsComment",
                           @"id":@(inputTag),
                           @"commentid":@(_commentId),
                           @"userid":userInfo[@"id"],
                           @"username":userInfo[@"real_name"],
                           @"content":replyText
                           };
    [self showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:info completion:^(BNetData *model, NSString *netErr) {
        [self removeHUDActivity];
        //提示
        [self showHUDTitleView:model.message image:nil];
        if (model.status == 0) {
            self.index = 68; //重新载入互动投诉接口id
        }
            
    }];

    
}

@end
