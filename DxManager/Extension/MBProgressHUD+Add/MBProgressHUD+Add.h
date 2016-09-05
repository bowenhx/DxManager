//
//  MBProgressHUD+Add.h
//  FindLoveMobile
//
//  Created by Guibin on 14-8-28.
//  Copyright (c) 2014年 com.mobile-kingdom.bkapps All rights reserved.
//

#import "MBProgressHUD.h"

@interface UIView (MbProgressAdd)
- (void)showError:(NSString *)error;
- (void)showSuccess:(NSString *)success;

/**
 *  显示菊花类型
 *
 */
- (void)showHUDActivityView:(NSString *)message shade:(BOOL)shade;
/**
 *  隐藏加载类型的HUD
 *
 *  @param view
 */
- (void)removeHUDActivity;
/**
 *  视图添加文字提示信息
 *
 */
- (void)showHUDTitleView:(NSString*)sting image:(UIImage*)image;
@end
