//
//  DetailViewController.m
//  DxManager
//
//  Created by ligb on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewCell.h"
#import "ItemVIewsHeight.h"

@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UITableView *_tableView;
    
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"详情";
}
- (void)loadNewView{
    
    _tableView.layer.borderWidth = 1;
    _tableView.layer.borderColor = [UIColor redColor].CGColor;
    
    if (self.dataSource.count) {
        [_tableView reloadData];
    }
    
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
    static NSString *xibName = @"DetailTableViewCell";
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
    }
    
    cell.info = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)itemsImages:(NSDictionary *)item{
    return [ItemVIewsHeight loadTextContents:item[@"zhaiyao"]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [self itemsImages:self.dataSource[indexPath.row]];
    return 172 + height;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
