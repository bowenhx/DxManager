//
//  MoreViewController.m
//  DxManager
//
//  Created by ligb on 16/9/5.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "MoreViewController.h"
#import "AppDefine.h"
#import "AppDelegate.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
}
- (void)loadNewData{
    NSDictionary *info = [SavaData parseDicFromFile:User_File];
    NSLog(@"info = %@",info);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//退出登陆
- (IBAction)logOutAction:(id)sender {
    //标记登陆
    [[SavaData shareInstance] savaDataInteger:1 KeyString:@"finishGuide"];
    
    //清除用户信息
    //TODO
    
    
    //退出登陆代理
    [[AppDelegate getAppDelegate] showLoginVC];
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
