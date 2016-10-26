//
//  GenearchViewController.m
//  DxManager
//
//  Created by ligb on 16/10/9.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "GenearchViewController.h"
#import "GenearchTableViewCell.h"

@interface GenearchViewController ()<UITextFieldDelegate>
{
    __weak IBOutlet UITableView *_tableView;
    
    UITextField                 *_searchFiled;//要搜索的关键字
}
@end

@implementation GenearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"家长通讯录";
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)loadNewView{

//    _tableView.layer.borderWidth = 1;
//    _tableView.layer.borderColor = [UIColor redColor].CGColor;
    
    UINib *nibCell = [UINib nibWithNibName:@"GenearchTableViewCell" bundle:nil];
    [_tableView registerNib:nibCell forCellReuseIdentifier:@"genearchCell"];
    
    [_tableView setTableHeaderView:[self searchView]];
    
}
- (UIView *)searchView{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, 40)];
    headView.backgroundColor = [UIColor colorCellLineBg];
    _searchFiled = [[UITextField alloc] initWithFrame:CGRectMake(30, 5, self.screen_W-120, 30)];
    _searchFiled.delegate = self;
    _searchFiled.borderStyle = UITextBorderStyleRoundedRect;
    _searchFiled.returnKeyType = UIReturnKeySearch;
    _searchFiled.placeholder = @"请输入姓名";
    [headView addSubview:_searchFiled];

    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(self.screen_W-65, 5, 50, 30);
    [searchBtn setTitle:@"搜索" forState:0];
    searchBtn.layer.cornerRadius = 3;
    searchBtn.backgroundColor = [UIColor colorAppBg];
    [searchBtn setTitleColor:[UIColor whiteColor] forState:0];
    [headView addSubview:searchBtn];
    [searchBtn addTarget:self action:@selector(beginSearchAction) forControlEvents:UIControlEventTouchUpInside];
    return headView;
}
- (void)loadNewData{
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getStudentPhoneBook"} completion:^(BNetData *model, NSString *netErr) {
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (NSArray *)itemsArr:(NSInteger)section{
    NSArray *items = self.dataSource[section][@"childrens"];
    if ([items isKindOfClass:[NSArray class]] && items.count) {
        return items;
    }else{
        return @[];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self itemsArr:section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GenearchTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"genearchCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([[self itemsArr:indexPath.section] count]) {
        cell.info = [self itemsArr:indexPath.section][indexPath.row];
    }
    return cell;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, 35)];
    //headView.backgroundColor = [UIColor colorCellLineBg];
    UILabel *labTitle = [[UILabel alloc] initWithFrame:CGRectMake(8, 5, 60, 25)];
    labTitle.backgroundColor = [UIColor colorAppBg];
    labTitle.textColor = [UIColor whiteColor];
    labTitle.font = [UIFont systemFontOfSize:14];
    labTitle.textAlignment = NSTextAlignmentCenter;
    labTitle.layer.cornerRadius = 3;
    labTitle.clipsToBounds = YES;
    labTitle.text = self.dataSource[section][@"grade"];
    [headView addSubview:labTitle];
    //画线
    UILabel *labLine = [[UILabel alloc] initWithFrame:CGRectMake(15, headView.h-1, self.screen_W-15, 1)];
    labLine.backgroundColor = [UIColor colorCellLineBg];
    [headView addSubview:labLine];
    return headView;
}

- (void)beginSearchAction{
    if ([_searchFiled isFirstResponder]) {
        [_searchFiled resignFirstResponder];
    }
    //搜索
    NSLog(@"search key = %@",_searchFiled.text);
   
    [self.view showHUDActivityView:@"正在搜索..." shade:YES];
    //模拟登陆，后面需要与接口对接
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view removeHUDActivity];
        [self.view showHUDTitleView:@"没有数据" image:nil];

    });
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    _searchFiled = textField;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
