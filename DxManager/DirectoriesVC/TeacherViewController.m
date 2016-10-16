//
//  TeacherViewController.m
//  DxManager
//
//  Created by ligb on 16/10/8.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "TeacherViewController.h"
#import "TeacherTableViewCell.h"

@interface TeacherViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    __weak IBOutlet UITableView *_tableView;
    
}
@end

@implementation TeacherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"园所通讯录";
}

- (void)loadNewView{
    _tableView.layer.borderWidth = 1;
    _tableView.layer.borderColor = [UIColor redColor].CGColor;
    
    UINib *nibCell = [UINib nibWithNibName:@"TeacherTableViewCell" bundle:nil];
    [_tableView registerNib:nibCell forCellReuseIdentifier:@"teacherCell"];
}

- (void)loadNewData{
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getTeaherPhoneBook"} completion:^(BNetData *model, NSString *netErr) {
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
    NSArray *items = self.dataSource[section][@"teachers"];
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
    TeacherTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"teacherCell" forIndexPath:indexPath];
    if ([[self itemsArr:indexPath.section] count]) {
        cell.info = [self itemsArr:indexPath.section][indexPath.row];
    }
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, 35)];
    //headView.backgroundColor = [UIColor colorCellLineBg];
    UILabel *labTitle = [[UILabel alloc] initWithFrame:CGRectMake(8, 5, 60, 25)];
    labTitle.backgroundColor = [UIColor colorAppBg];
    labTitle.textColor = [UIColor whiteColor];
    labTitle.font = [UIFont systemFontOfSize:14];
    labTitle.textAlignment = NSTextAlignmentCenter;
    labTitle.layer.cornerRadius = 5;
    labTitle.text = self.dataSource[section][@"grade"];
    [headView addSubview:labTitle];
    
    
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
