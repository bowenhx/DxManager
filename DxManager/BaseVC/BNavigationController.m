//
//  BNavigationController.m
//  BKMobile
//
//  Created by ligb on 15/2/4.
//  Copyright (c) 2015年 com.mobile-kingdom.bkapps All rights reserved.
//

#import "BNavigationController.h"
#import "UIColor+app.h"

@interface BNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation BNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条背景
    //self.navigationController.navigationBar.barTintColor = [UIColor colorAppBg];
    UIImage *image = [[UIImage imageNamed:@"dte_nav_icon"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    
    
    //设置导航文字颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    self.navigationController.delegate = self;
    
    __weak typeof (self)weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    if (self.viewControllers.count >0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

#pragma mark - NSNotification Mehtod
- (void)openThreadViewNotification:(NSNotification *)notification{
    NSString *tid = notification.object;
    if (tid) {
//        [InVDetailViewController pushDetailVCWithTid:tid pid:0 withFromViewController:self.visibleViewController];
    }
    
}

//- (void)cleanUserID
//{
//
//}
@end
