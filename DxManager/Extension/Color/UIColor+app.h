//
//  UIColor+app.h
//  BKMobile
//
//  Created by Guibin on 15/1/23.
//  Copyright (c) 2015年 com.mobile-kingdom.bkapps All rights reserved.
//
/**
 *  这里设置app 所有UI 渲染颜色变化
 */

#import <UIKit/UIKit.h>
#import "NSString+UIColor.h"
#define RGB(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]

@interface UIColor (AppUIColor)

//app 全局主色调，包括导航背景 （浅蓝）
+ (UIColor *)colorAppBg;

//底部tabbar 背景
+ (UIColor *)colorTabBar;

//文字颜色--- > 类别颜色 <----(浅蓝)
+ (UIColor *)colorBlue;

//文字颜色--- > 数字颜色颜色 < （淡红）
+ (UIColor *)colorRed;

//文字颜色--- > 内容文字颜色 < 黑
+ (UIColor *)colorBlack;

//cell 中间线条颜色 （灰色）
+ (UIColor *)colorGray;

//设置view 背景及tabView 的背景颜色
+ (UIColor *)colorViewBg;

//设置view 區分cell的淺綠色 背景颜色
+ (UIColor *)colorCellGreenBg;

//文字颜色--- > 金色
+ (UIColor *)collorGold;

//设置cell中间的线的颜色
+ (UIColor *)colorCellLineBg;

// 设置帖子中楼层的背景颜色
+ (UIColor *)colorMemberFBg;


+ (UIColor *)motifSpaceBg;

//取随机色
+ (UIColor *)randomColor;


@end

@interface UIImage (BImage_Color)

/**
 *  根据颜色和尺寸返回一个image
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
