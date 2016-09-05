//
//  MBProgressHUD+Add.m
//  FindLoveMobile
//
//  Created by Guibin on 14-8-28.
//  Copyright (c) 2014年 com.mobile-kingdom.bkapps All rights reserved.
//
#define MBTAGE_MARK  102411

#import "MBProgressHUD+Add.h"
#import "NSString+UIColor.h"

@implementation UIView (MbProgressAdd)

#pragma mark 显示信息
- (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    if (text.length >11) {
        hud.detailsLabelText = text;
    }else{
        hud.labelText = text;
    }
    
    hud.tag = MBTAGE_MARK;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    hud.alpha = .8;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1];
}

#pragma mark 显示错误信息
- (void)showError:(NSString *)error{
    [self show:error icon:@"error.png" view:nil];
}

- (void)showSuccess:(NSString *)success{
    [self show:success icon:@"success.png" view:nil];
}

#pragma mark 显示一些信息
- (void)showHUDActivityView:(NSString *)message shade:(BOOL)shade{

    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.labelText = message;
    //hud.tag = MBTAGE_MARK;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙层效果
    hud.dimBackground = shade;
    hud.alpha = .6;
    //[hud hide:YES afterDelay:3];
}
/**
 *  隐藏加载类型的HUD
 *
 *  @param view
 */
- (void)removeHUDActivity
{
    for (UIView *hudView in self.subviews) {
        if ([hudView isKindOfClass:[MBProgressHUD class]]) {
            [hudView removeFromSuperview];
        }
    }
}
/**
 *  视图添加文字提示信息
 *
 */
- (void)showHUDTitleView:(NSString*)sting image:(UIImage *)image
{
    [self removeHUDActivity];
    if ([@"" isStringBlank:sting]) {
        return;
    }
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self];
    //HUD.tag = MBTAGE_MARK;
    HUD.mode = MBProgressHUDModeText;
    HUD.alpha = .6;
    if (image) {
         HUD.customView = [[UIImageView alloc] initWithImage:image];
    }

    [self addSubview:HUD];

    
    if (sting.length >11) {
        HUD.detailsLabelText = sting;
        [HUD show:YES];
        [HUD hide:YES afterDelay:2.f];
    }else{
        HUD.labelText = sting;
        [HUD show:YES];
        [HUD hide:YES afterDelay:1.f];
    }
    
    
}


@end
