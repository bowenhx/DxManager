//
//  TeacherViewController.m
//  DxManager
//
//  Created by ligb on 16/10/8.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "TeacherViewController.h"
#import "TeacherTableViewCell.h"

@interface TeacherViewController ()
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
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TeacherTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"teacherCell" forIndexPath:indexPath];
    cell.info = self.dataSource[indexPath.row];
    return cell;
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
