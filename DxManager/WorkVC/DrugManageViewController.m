//
//  DrugManageViewController.m
//  DxManager
//
//  Created by ligb on 16/10/19.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "DrugManageViewController.h"
#import "AppDefine.h"
@interface DrugManageViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DrugManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"用药条管理";
    
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
