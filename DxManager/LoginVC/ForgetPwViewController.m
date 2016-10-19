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
    
    _textFieldPhone.text = @"15806381115";
}
-(BOOL)isMobileNumber:(NSString *)mobileNum{
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[01678]|8[0-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:mobileNum];
}

//获取验证码
- (IBAction)getVerifyCodeAction:(id)sender {
    if (![self isMobileNumber:_textFieldPhone.text]) {
        [self.view showHUDTitleView:@"请输入正确的手机号" image:nil];
        return;
    }
    
    [[ANet share] post:BASE_URL params:@{@"action":@"sendgetPasswordSMG",@"mobile":_textFieldPhone.text} completion:^(BNetData *model, NSString *netErr) {
        //保存用户信息
        if (model.status == 0) {
            //请求成功
           _textFieldCode.text = @"0323";
        }
        
        [self.view showHUDTitleView:model.message image:nil];
    }];
    
}
//确认修改
- (IBAction)affirmChangeAction:(id)sender {
    if ([@"" isStringBlank:_textFieldCode.text]) {
        [self.view showHUDTitleView:@"验证码不能为空" image:nil];
        return;
    }
    
    if ([@"" isStringBlank:_textFieldNewPw.text]) {
        [self.view showHUDTitleView:@"密码不能为空" image:nil];
        return;
    }
    
    if (![_textFieldNewPw.text isEqualToString:_textFieldNewPw2.text]) {
        [self.view showHUDTitleView:@"两次输入的密码不一致，请重新输入" image:nil];
        return;
    }
     [self.view showHUDActivityView:@"正在加载" shade:NO];
    
    [[ANet share] post:BASE_URL params:@{@"action":@"getPassword",@"getPassCode":_textFieldCode.text,@"mobile":_textFieldPhone.text,@"Newpassword":_textFieldNewPw2.text} completion:^(BNetData *model, NSString *netErr) {
        [self.view removeHUDActivity];
        //保存用户信息
        if (model.status == 0) {
            //请求成功
            [self performSelector:@selector(backLogin) withObject:nil afterDelay:.8];
        }
        
        [self.view showHUDTitleView:model.message image:nil];
   
    }];

    

}


- (void)backLogin{
    [self.navigationController popViewControllerAnimated:YES];
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
