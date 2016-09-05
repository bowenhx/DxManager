//
//  LoginViewController.m
//  DxManager
//
//  Created by Stray on 16/9/4.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDefine.h"
#import "ForgetPwViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
{
    __weak IBOutlet UITextField *_phoneNumTextField;
    
    __weak IBOutlet UITextField *_passwordTextField;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登陆";
    
    UIImage *image = [[UIImage imageNamed:@"导航栏"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    //设置导航文字颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
   
    
    for (UIView *view in self.view.subviews) {
        view.layer.borderWidth = 1;
    }
    
    [[SavaData shareInstance] savaDataInteger:1 KeyString:@"finishGuide"];
   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.hidesBackButton = YES;
}
-(BOOL)isMobileNumber:(NSString *)mobileNum{
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[01678]|8[0-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:mobileNum];
}
- (IBAction)loginAction:(UIButton *)sender {
    if (![self isMobileNumber:_phoneNumTextField.text]) {
        [self.view showHUDTitleView:@"请输入正确的手机号" image:nil];
        return;
    }
    
    if ([@"" isStringBlank:_phoneNumTextField.text]) {
        [self.view showHUDTitleView:@"密码不能为空" image:nil];
        return;
    }
    
    [self.view showHUDActivityView:@"正在登錄..." shade:YES];
    
    //模拟登陆，后面需要与接口对接
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view removeHUDActivity];
        
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        [self presentViewController:[mainStoryboard instantiateInitialViewController] animated:YES completion:^{
             [[SavaData shareInstance] savaDataInteger:2 KeyString:@"finishGuide"];
        }];
        
    });
    
}

- (IBAction)forgetPasswordAction:(id)sender {
    ForgetPwViewController *forgetPwVC = [[ForgetPwViewController alloc] initWithNibName:@"ForgetPwViewController" bundle:nil];
    [self.navigationController pushViewController:forgetPwVC animated:YES];
}


#pragma mark UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ( self.view.y == 64 ) {
        [UIView animateWithDuration:.38f animations:^{
            CGRect rect = self.view.frame;
            rect.origin.y -= 120;
            self.view.frame = rect;
        }];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _phoneNumTextField) {
        [_passwordTextField becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
        [self changeViewSize];
        [self loginAction:nil];
    }
    return YES;
}
- (void)changeViewSize{
    if (self.view.y != 64) {
        [UIView animateWithDuration:.38f animations:^{
            CGRect rect = self.view.frame;
            rect.origin.y += 120;
            self.view.frame = rect;
        }];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([_phoneNumTextField isFirstResponder]) {
        [_phoneNumTextField resignFirstResponder];
    }else if ([_passwordTextField isFirstResponder]){
        [_passwordTextField resignFirstResponder];
       
    }
    
    [self changeViewSize];
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
