//
//  SearchDrugHeadView.h
//  DxManager
//
//  Created by ligb on 16/10/20.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
//用药条搜索管理view
#import <UIKit/UIKit.h>

@interface SearchDrugHeadView : UIView

@property (nonatomic , strong) UITextField *textField;

@property (nonatomic , strong) UIButton *btnStart;

@property (nonatomic , strong) UIButton *btnEnd;

@property (nonatomic , copy) void (^selectActionType)(UIButton *btn);

@end
