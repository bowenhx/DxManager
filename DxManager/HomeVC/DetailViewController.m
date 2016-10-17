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
    
//    _tableView.layer.borderWidth = 1;
//    _tableView.layer.borderColor = [UIColor redColor].CGColor;
    
    [_tableView setTableFooterView:[self addFootView]];
    
    if (self.info) {
        [_tableView reloadData];
    }
    
}

- (UIView *)addFootView{
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, 100)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, footView.h - 40, self.screen_W - 40, 40);
    [btn setTitle:[self.info[@"status"] integerValue]? @"确认通过审核" : @"取消通过审核" forState:0];
    btn.backgroundColor = [UIColor colorAppBg];
    btn.layer.cornerRadius = 3;
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(didSelectAction) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn];
    return footView;
}
- (void)didSelectAction{
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    NSInteger status = [self.info[@"status"] integerValue] ? 0 : 2;
    [[ANet share] post:BASE_URL params:@{@"action":@"doReviewed",@"id":self.info[@"id"],@"state":@(status)} completion:^(BNetData *model, NSString *netErr) {
        [self.view removeHUDActivity];
        
        NSLog(@"data = %@",model.data);
        if (model.status == 0) {
            [self.view showSuccess:model.message];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"updataHomeStatus" object:nil];
            [self performSelector:@selector(tapBackBtn) withObject:nil afterDelay:.7];
        }else{
            [self.view showHUDTitleView:model.message image:nil];
        }
        
    }];
}
#pragma mark
#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *xibName = @"DetailTableViewCell";
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
    }
    
    cell.info = self.info;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [ItemVIewsHeight loadTextContents:self.info[@"zhaiyao"]];
    return 85 + height;
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
