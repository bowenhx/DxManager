//
//  BTabBarController.m
//  BKMobile
//
//  Created by ligb on 15/2/4.
//  Copyright (c) 2015年 com.mobile-kingdom.bkapps All rights reserved.
//

#import "BTabBarController.h"
#import "BNavigationController.h"
#import "LoginViewController.h"
#import "UIColor+app.h"


@interface BTabBarController ()

@end

@implementation BTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tabBar的半透明阴影色效果，不让他显示
    self.tabBar.translucent = NO;
    //設置tabBar 背景
    self.tabBar.barTintColor = [UIColor colorTabBar];
    
    [self setSelectedIndex:0];
    self.delegate = self;
    
    [self setTabBarImage]; //设置图片
    
}

//设置tabbar上的按钮图片
-(void)setTabBarImage{
   NSArray *imgs = @[@"dte_btn_dt_unpressed",
                     @"dte_btn_gz_unpressed",
                     @"dte_btn_txl_unpressed",
                     @"dte_btn_gd_unpressed"];
    
    NSArray *selectImgs = @[@"dte_btn_dt_pressed",
                            @"dte_btn_gz_pressed",
                            @"dte_btn_txl_pressed",
                            @"dte_btn_gd_pressed"];
    
    for (int i= 0; i<self.tabBar.items.count; i++) {
        UITabBarItem *item = self.tabBar.items[i];
        item.image = [[UIImage imageNamed:imgs[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:selectImgs[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
}

- (void)notificationForTabbarChangeSelectIndex:(NSNotification *)notification{
    NSInteger nowIndex = [notification.object integerValue];
    dispatch_time_t waitTime = dispatch_time(DISPATCH_TIME_NOW, 0.0 * NSEC_PER_SEC);
    dispatch_after(waitTime, dispatch_get_main_queue(), ^(void){
        self.selectedIndex = nowIndex;
    });
}

#pragma mark - UITabBarDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0){
    return YES;
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
 
    
}




@end
