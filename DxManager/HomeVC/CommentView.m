//
//  CommentView.m
//  DxManager
//
//  Created by ligb on 16/10/19.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "CommentView.h"
#import "AppDefine.h"

@interface CommentView ()<UITableViewDelegate,UITableViewDataSource>
{
    
}
@end

@implementation CommentView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
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
- (void)loadData{
    if (self.dataSource.count) {
        [self.tableView reloadData];
    }
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.rowHeight = 25;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
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
    }
    return _tableView;
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
    static NSString *defineCell = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:defineCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:defineCell];
        
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    NSString *comment = self.dataSource[indexPath.row][@"content"];
    if ([comment hasPrefix:@"回复"]) {
         cell.textLabel.text = [NSString stringWithFormat:@"%@%@",self.dataSource[indexPath.row][@"user_name"],comment];
    }else{
         cell.textLabel.text = [NSString stringWithFormat:@"%@:%@",self.dataSource[indexPath.row][@"user_name"],comment];
    }
   
    
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //发送通知去回复
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reportNotificationCenter" object:@{@"commentid":self.dataSource[indexPath.row][@"id"],@"inputID":@(self.inputID)}];
    
}
@end
