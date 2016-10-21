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
    
    CGFloat         _viewY;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewY = self.view.y;
    self.title = @"登录";
    self.view.backgroundColor = [UIColor clearColor];
    
    UIImage *image = [[UIImage imageNamed:@"dte_nav_icon"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    //设置导航文字颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
   
    _phoneNumTextField.layer.borderWidth = .5;
    _passwordTextField.layer.borderWidth = .5;
    _phoneNumTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _passwordTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _phoneNumTextField.layer.cornerRadius = 5;
    _passwordTextField.layer.cornerRadius = 5;
    
    UIButton *btn = [self.view viewWithTag:10];
    btn.backgroundColor = [UIColor colorAppBg];
    btn.layer.cornerRadius = 5;
    [[SavaData shareInstance] savaDataInteger:1 KeyString:@"finishGuide"];
   
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.hidesBackButton = YES;
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
//    [self changeViewSize];
    
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
    
    /**
     登陆接口地址
     http://dx.sitemn.com/Ser/Managers.ashx?action=doLogin&username=manager&password=admin888
     */
    
    [self.view showHUDActivityView:@"正在登录..." shade:YES];
//    
//    [[ANet share] get:@"?action=doLogin&username=15806381115&password=admin888" completion:^(BNetData *model, NSString *netErr) {
//         [self.view removeHUDActivity];
//    }];

    [[ANet share] post:BASE_URL params:@{@"action":@"doLogin",@"username":_phoneNumTextField.text,@"password":_passwordTextField.text} completion:^(BNetData *model, NSString *netErr) {
         [self.view removeHUDActivity];
        //保存用户信息
        if (model.status == 0) {
            //请求成功
            NSDictionary *info = model.data;
            [SavaData writeDicToFile:info FileName:User_File];
            
            //跳转登陆页面
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            [self presentViewController:[mainStoryboard instantiateInitialViewController] animated:YES completion:^{
                [[SavaData shareInstance] savaDataInteger:2 KeyString:@"finishGuide"];
                _passwordTextField.text = @"";
                _phoneNumTextField.text = @"";
                
            }];

            
        }
        
    }];
    
//    //模拟登陆，后面需要与接口对接
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.view removeHUDActivity];
//        
//
//    });
    
}

- (IBAction)forgetPasswordAction:(id)sender {
    ForgetPwViewController *forgetPwVC = [[ForgetPwViewController alloc] initWithNibName:@"ForgetPwViewController" bundle:nil];
    [self.navigationController pushViewController:forgetPwVC animated:YES];
}


#pragma mark UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ( self.view.y == _viewY ) {
        [UIView animateWithDuration:.3f animations:^{
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
    if (self.view.y != _viewY) {
        [UIView animateWithDuration:.3f animations:^{
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
