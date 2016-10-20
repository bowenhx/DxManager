//
//  DrugManageViewController.m
//  DxManager
//
//  Created by ligb on 16/10/19.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "DrugManageViewController.h"
#import "AppDefine.h"
#import "DrugManageTableViewCell.h"
#import "SearchDrugHeadView.h"
#import "DrugFormDataViewController.h"

@interface DrugManageViewController ()
{
    IBOutlet UIView *_datePickViewBg;
    __weak IBOutlet UIDatePicker *_datePickerView;
    
    UIButton *_tempBtn;
    
    BOOL _isSearch;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic , strong) SearchDrugHeadView *searchView;
@property (nonatomic , strong) UIView *footView;

@end

@implementation DrugManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"用药条管理";
    
}
- (void)loadNewView{
//    self.tableView.layer.borderWidth = 1;
//    self.tableView.layer.borderColor = [UIColor redColor].CGColor;
    
    _isSearch = NO;
    
    [self.tableView setTableHeaderView:self.searchView];
    
    [self footView];
    
    [self pickerDateView];
    
}
- (void)pickerDateView
{
    /**
     *  设置_datePckerVIew 的frame适应屏幕尺寸
     */
    _datePickViewBg.backgroundColor = [UIColor colorViewBg];
    [_datePickViewBg setW:self.screen_W];
    
    UIView *pickerV = (UIView *)[_datePickViewBg viewWithTag:20];
    for (UIView *label in pickerV.subviews) {
        label.backgroundColor = [UIColor colorAppBg];
    }
    
    [_datePickerView setDatePickerMode:UIDatePickerModeDate];
     [_datePickerView setMaximumDate:[NSDate date]];
}

- (SearchDrugHeadView *)searchView{
    if (!_searchView) {
        _searchView = [[SearchDrugHeadView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, 150)];
        
        @WeakObj(self);
        _searchView.selectActionType = ^(UIButton *btn){
            [selfWeak didSelectStartDate:btn];
        };
    
    }
    return _searchView;
}
- (UIView *)footView{
    if (!_footView) {
        _footView = [[UIView alloc] initWithFrame:CGRectMake(0, self.screen_H - 40, self.screen_W, 40)];
        //_footView.backgroundColor = [UIColor redColor];
        UIButton *footBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        footBtn.frame = CGRectMake(20, 0, self.screen_W - 40, 35);
        [footBtn setTitle:@"生成班级用药报告" forState:0];
        [footBtn setTitleColor:[UIColor colorAppBg] forState:0];
        footBtn.layer.borderWidth = .5;
        footBtn.layer.cornerRadius = 6;
        footBtn.layer.borderColor = [UIColor colorAppBg].CGColor;
        [_footView addSubview:footBtn];
        [self.view addSubview:_footView];
        
        [footBtn addTarget:self action:@selector(didPresentationAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _footView;
}

- (void)didPresentationAction{
    DrugFormDataViewController *drugFormDataVC = [[DrugFormDataViewController alloc] initWithNibName:@"DrugFormDataViewController" bundle:nil];
    [self.navigationController pushViewController:drugFormDataVC animated:YES];
}

- (void)loadNewData{
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getNewsList",@"aid":@(69)} completion:^(BNetData *model, NSString *netErr) {
        [self.view removeHUDActivity];
        
        NSLog(@"data = %@",model.data);
        if (model.status == 0) {
            //请求成功
            [self.dataSource setArray:model.data];
            [_tableView reloadData];
            
        }else{
            [self.view showHUDTitleView:model.message image:nil];
        }
        
    }];
}
#pragma mark 选择时间
- (void)didSelectStartDate:(UIButton *)btn{
    _tempBtn = btn;
    if (btn.tag == 100) {
        //选择起始时间
        [self showDatePickerView];
        
    }else if (btn.tag == 101){
        //选择结束时间
        [self showDatePickerView];
        
    }else{
        //搜索
        _isSearch = YES;
        
        NSDictionary *info = @{@"action":@"getDrugSearch",
                               @"grade":_searchView.textField.text,
                               @"date1":_searchView.btnStart.titleLabel.text,
                               @"date2":_searchView.btnEnd.titleLabel.text};
        
        [self.view showHUDActivityView:@"正在加载" shade:NO];
        [[ANet share] post:BASE_URL params:info completion:^(BNetData *model, NSString *netErr) {
            [self.view removeHUDActivity];
            
            NSLog(@"data = %@",model.data);
            if (model.status == 0) {
                //请求成功
                [self.dataSource setArray:model.data];
                [_tableView reloadData];
                
            }else{
                [self.view showHUDTitleView:model.message image:nil];
            }
            
        }];
        
    }
}
#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *xibName = @"DrugManageTableViewCell";
    DrugManageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (_isSearch) {
        cell.searchInfo = self.dataSource[indexPath.section];
        
    }else{
        cell.info = self.dataSource[indexPath.section];
    }
   
    cell.viewController = self;
    return cell;
}




#pragma mark 选择完成操作PickerDate
- (IBAction)didSelectCancelDateAction:(UIButton *)sender {
    [self didHiddenDatePickerView];
}
#pragma mark 选择完成并保存
- (IBAction)didSelectFinishDateAction:(UIButton *)sender {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [formatter stringFromDate:_datePickerView.date];
    
    if (_tempBtn.tag != 102) {
        [_tempBtn setTitle:strDate forState:0];
    }
    [self didHiddenDatePickerView];
    
}


- (void)showDatePickerView
{
    CGRect rect = _datePickViewBg.frame;
    rect.origin.x = 0;
    rect.origin.y = self.screen_H;
    _datePickViewBg.frame = rect;
    if (!_datePickViewBg.superview) {
        [self.view addSubview:_datePickViewBg];
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = _datePickViewBg.frame;
        frame.origin.y = self.screen_H - _datePickViewBg.h;
        _datePickViewBg.frame = frame;
    }];
    
}
- (void)didHiddenDatePickerView
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = _datePickViewBg.frame;
        rect.origin.y = self.screen_H;
        _datePickViewBg.frame = rect;
        
    } completion:^(BOOL finished) {
        [_datePickViewBg removeFromSuperview];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([_searchView.textField isFirstResponder]) {
        [_searchView.textField resignFirstResponder];
    }
    
    if (_datePickViewBg.y != self.screen_H) {
        [self didHiddenDatePickerView];
    }
    
//    if (self.footView) {
//        float y = scrollView.contentOffset.y;
//        float h = scrollView.contentSize.height;
//        float height = scrollView.h;
//        if (y > height || (y + height+20) >= h ) {
//            [self.footView setHidden:YES];
//        }else{
//            [self.footView setHidden:NO];
//        }
//    }
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
