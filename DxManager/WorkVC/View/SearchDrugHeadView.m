//
//  SearchDrugHeadView.m
//  DxManager
//
//  Created by ligb on 16/10/20.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "SearchDrugHeadView.h"
#import "AppDefine.h"

@interface SearchDrugHeadView ()


@end

@implementation SearchDrugHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addViews];
    }
    return self;
}

- (void)addViews{
    
    UILabel *labClasses = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 45, 20)];
    labClasses.text = @"班级：";
    labClasses.font = [UIFont systemFontOfSize:14];
    labClasses.textColor = [UIColor darkGrayColor];
//    labClasses.layer.borderWidth = 1;
    [self addSubview:labClasses];
    
    UILabel *labPeriod = [[UILabel alloc] initWithFrame:CGRectMake(30, 65, 45, 20)];
    labPeriod.text = @"周期：";
    labPeriod.font = [UIFont systemFontOfSize:14];
    labPeriod.textColor = [UIColor darkGrayColor];
//    labPeriod.layer.borderWidth = 1;
    [self addSubview:labPeriod];
    
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(75, 13, self.screen_W - 110, 35)];
    _textField.font = [UIFont systemFontOfSize:16];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
//    _textField.layer.borderWidth = 1;
//    _textField.layer.cornerRadius = 5;
    _textField.placeholder = @"搜索班级或人名";
    [self addSubview:_textField];
    
    
    _btnStart = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnStart.frame = CGRectMake(_textField.x, 58, (_textField.w - 20)/2, 35);
    _btnStart.titleLabel.font = [UIFont systemFontOfSize:16];
    [_btnStart setTitleColor:[UIColor lightGrayColor] forState:0];
    _btnStart.layer.borderWidth = 1;
    [_btnStart setTitle:@"2016-10-01" forState:0];
    _btnStart.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _btnStart.layer.cornerRadius = 5;
    _btnStart.tag = 100;
    [self addSubview:_btnStart];
    
    _btnEnd = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnEnd.frame = CGRectMake(_btnStart.max_X+20, 58, _btnStart.w, 35);
    _btnEnd.titleLabel.font = [UIFont systemFontOfSize:16];
    [_btnEnd setTitleColor:[UIColor lightGrayColor] forState:0];
    _btnEnd.layer.borderWidth = 1;
    [_btnEnd setTitle:@"2016-10-15" forState:0];
    _btnEnd.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _btnEnd.layer.cornerRadius = 5;
    _btnEnd.tag = 101;
    [self addSubview:_btnEnd];
    
    UILabel *labZhi = [[UILabel alloc] initWithFrame:CGRectMake(_btnStart.max_X, labPeriod.y, 20, 20)];
    labZhi.text = @"至";
    labZhi.textColor = [UIColor darkGrayColor];
    labZhi.font = [UIFont systemFontOfSize:14];
    labZhi.textAlignment = NSTextAlignmentCenter;
    [self addSubview:labZhi];
    
    
    UIButton *searchBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(_textField.x, labZhi.max_Y + 20, _textField.w, 35);
    [searchBtn setTitle:@"搜索" forState:0];
    searchBtn.backgroundColor = [UIColor colorAppBg];
    searchBtn.layer.cornerRadius = 5;
    searchBtn.tag = 102;
    [self addSubview:searchBtn];
    
    
    [_btnStart addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [_btnEnd   addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [formatter stringFromDate:[NSDate date]];
    [_btnEnd setTitle:strDate forState:0];
    
}
- (void)action:(UIButton *)btn{
    if ([_textField isFirstResponder]) {
        [_textField resignFirstResponder];
    }
    
    if (_selectActionType) {
        _selectActionType (btn);
    }
}

@end
