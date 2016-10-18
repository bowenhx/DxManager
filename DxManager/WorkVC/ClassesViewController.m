//
//  ClassesViewController.m
//  DxManager
//
//  Created by ligb on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "ClassesViewController.h"
#import "HomeCustomTableView.h"
#import "AppDefine.h"
@interface ClassesViewController ()

@end

@implementation ClassesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (void)loadNewView{
    HomeCustomTableView *tableView = [[HomeCustomTableView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, self.screen_H)];
    [tableView loadNewData:self.index];
    tableView.homeVC = self;
    [self.view addSubview:tableView];
    
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
