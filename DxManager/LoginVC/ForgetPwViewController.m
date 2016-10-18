//
//  ForgetPwViewController.m
//  DxManager
//
//  Created by ligb on 16/9/5.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "ForgetPwViewController.h"
#import "AppDefine.h"

@interface ForgetPwViewController ()
{
    __weak IBOutlet UITextField *_textFieldPhone;
    __weak IBOutlet UITextField *_textFieldCode;
    
    __weak IBOutlet UITextField *_textFieldNewPw;
    __weak IBOutlet UITextField *_textFieldNewPw2;
    
    
    __weak IBOutlet UIButton *btnVerify;
    
    __weak IBOutlet UIButton *btnConfirm;
}
@end

@implementation ForgetPwViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    
 
    btnVerify.layer.borderWidth = .5;
    btnVerify.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btnVerify.layer.cornerRadius = 3;
    
    btnConfirm.backgroundColor = [UIColor colorAppBg];
    btnConfirm.layer.cornerRadius = 3;
    
}
//获取验证码
- (IBAction)getVerifyCodeAction:(id)sender {
    
}
//确认修改
- (IBAction)affirmChangeAction:(id)sender {
    
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
