//
//  BaseViewController.h
//  EduKingdom
//
//  Created by ligb on 16/7/1.
//  Copyright © 2016年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+app.h"
#import "AppDefine.h"
#import "NSArray+Util.h"
#import <WebKit/WebKit.h>
#import "UIView+Ex.h"

@interface BaseViewController : UIViewController

@property (nonatomic , strong) UILabel *navTitleLab;

@property (nonatomic , strong) UIButton *backBtn;

@property (nonatomic , strong) UIButton *rightBtn;

//初始化view
- (void)loadNewView;

//初始化数据
- (void)loadNewData;

//导航左边按钮点击事件
- (void)tapBackBtn;

//导航右边按钮点击事件
- (void)tapRightBtn;
@end
