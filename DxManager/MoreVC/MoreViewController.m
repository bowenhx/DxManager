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
#import "LoginViewController.h"
#import "ForgetPwViewController.h"
#import "AboutViewController.h"

@interface MoreViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"更多";
}
- (void)loadNewData{
    
    
    [self.dataSource setArray:@[@"修改密码",@"清空缓存",@"关于大象",@"退出登录"]];
    
    [self.tableView setTableHeaderView:[self headView]];
    [self.tableView setTableFooterView:[[UIView alloc] init]];
}
- (UIView *)headView{
    NSDictionary *info = [SavaData parseDicFromFile:User_File];
    NSLog(@"info = %@",info);
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, 200)];
    headView.backgroundColor = [UIColor colorCellLineBg];
    //头像
    UIImageView *headImg = [[UIImageView alloc] initWithFrame:CGRectMake((self.screen_W - 70)/2, 20, 70, 70)];
    
    [headImg img_setImageWithURL:info[@"email"] placeholderImage:[UIImage imageNamed:@"userDefineIcon"]];
    [headView addSubview:headImg];

    //用户名
    UILabel *userName = [[UILabel alloc] initWithFrame:CGRectMake(headImg.x, headImg.max_Y + 5, headImg.w, 25)];
    userName.textAlignment = NSTextAlignmentCenter;
    userName.textColor = [UIColor darkGrayColor];
    userName.text = info[@"real_name"];
    [headView addSubview:userName];
    //内容电话
    UILabel *textLab = [[UILabel alloc] initWithFrame:CGRectMake(userName.x - 50, userName.max_Y, userName.w + 100, 25)];
    textLab.font = [UIFont systemFontOfSize:13];
    textLab.textAlignment = NSTextAlignmentCenter;
    textLab.textColor = [UIColor lightGrayColor];
    textLab.text = [NSString stringWithFormat:@"%@ 大象顺义园所",info[@"telephone"]];
    [headView addSubview:textLab];
    
    return headView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//退出登陆
- (void)logOutAction {
    //标记登陆
    [[SavaData shareInstance] savaDataInteger:1 KeyString:@"finishGuide"];
    
    NSInteger present = [[SavaData shareInstance] printDataInteger:@"login_present"];
    if (present == 1) {
        //表示刚登陆过
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }else{
        //退出登陆代理
        [[AppDelegate getAppDelegate] showLoginVC];
    }
    
    
    //清除用户信息
    [SavaData writeDicToFile:@{} FileName:User_File];
    
    
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            ForgetPwViewController *forgetPwVC = [[ForgetPwViewController alloc] initWithNibName:@"ForgetPwViewController" bundle:nil];
            [self.navigationController pushViewController:forgetPwVC animated:YES];
        }
            break;
        case 1:
        {
            [self.view showHUDActivityView:@"正在清除缓存目录..." shade:NO];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.view removeHUDActivity];
                [self.view showHUDTitleView:@"清除完毕" image:nil];
            });
        }
            break;
        case 2:
        {
            AboutViewController *aboutVC = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
            [self.navigationController pushViewController:aboutVC animated:YES];
        }
            break;
        case 3:
        {
             [[[UIAlertView alloc] initWithTitle:nil message:@"确定退出登录吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] show];
        }
            break;
            
        default:
            break;
    }
    
   
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex) {
        [self logOutAction];
    }
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
