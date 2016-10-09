//
//  GenearchViewController.m
//  DxManager
//
//  Created by ligb on 16/10/9.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "GenearchViewController.h"
#import "GenearchTableViewCell.h"

@interface GenearchViewController ()
{
    __weak IBOutlet UITableView *_tableView;
    
}
@end

@implementation GenearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"家长通讯录";
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)loadNewView{

    _tableView.layer.borderWidth = 1;
    _tableView.layer.borderColor = [UIColor redColor].CGColor;
    
    UINib *nibCell = [UINib nibWithNibName:@"GenearchTableViewCell" bundle:nil];
    [_tableView registerNib:nibCell forCellReuseIdentifier:@"genearchCell"];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GenearchTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"genearchCell" forIndexPath:indexPath];
    cell.info = self.dataSource[indexPath.row];
    return cell;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, 40)];
    headView.backgroundColor = [UIColor colorCellLineBg];
    UITextField *filed = [[UITextField alloc] initWithFrame:CGRectMake(30, 5, self.screen_W-60, 30)];
    filed.borderStyle = UITextBorderStyleRoundedRect;
    filed.keyboardType = UIKeyboardTypeWebSearch;
    filed.placeholder = @"班级";
    [headView addSubview:filed];
    
    return headView;
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
