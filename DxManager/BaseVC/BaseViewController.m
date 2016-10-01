//
//  BaseViewController.m
//  EduKingdom
//
//  Created by ligb on 16/7/1.
//  Copyright © 2016年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)loadNavBar{
    
   
    //当不是首个控制器时显示返回按钮
    NSInteger count = self.navigationController.viewControllers.count;
    if ( count >1 ) {
        [self backBtn];
    }
    
}

//初始化view
- (void)loadNewView{
    
}

//初始化数据
- (void)loadNewData{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置导航条
    [self loadNavBar];
    
    //初始化view
    [self loadNewView];
    
    //初始化数据
    [self loadNewData];
    
}
- (UILabel *)navTitleLab{
    if (nil == _navTitleLab) {
        _navTitleLab = [[UILabel alloc] initWithFrame: CGRectMake(80, 20, 160, 24)];
        _navTitleLab.backgroundColor = [UIColor yellowColor];
        _navTitleLab.font = [UIFont boldSystemFontOfSize:22];
        _navTitleLab.textColor = [UIColor whiteColor];
        _navTitleLab.textAlignment = NSTextAlignmentCenter;
        self.navigationItem.titleView = _navTitleLab;
    }
    return _navTitleLab;
    
}
- (UIButton *)backBtn{
    if (nil == _backBtn) {
        //返回按钮
        UIImage *backImage = [UIImage imageNamed:@"dte_vi_Bitmap"];
        _backBtn = [UIButton buttonWithType: UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(0, 0, backImage.size.width, backImage.size.height);
        [_backBtn setImage: backImage forState: UIControlStateNormal];
        [_backBtn addTarget: self action: @selector(tapBackBtn) forControlEvents: UIControlEventTouchUpInside];
        UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView: _backBtn];
        left.style = UIBarButtonItemStylePlain;
        self.navigationItem.leftBarButtonItem = left;
    }
    return _backBtn;
}
- (UIButton *)rightBtn{
    if (nil == _rightBtn) {
        //右按钮
        _rightBtn = [UIButton buttonWithType: UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(0, 0, 60, 30);
        _rightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_rightBtn addTarget: self action: @selector(tapRightBtn) forControlEvents: UIControlEventTouchUpInside];
        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView: _rightBtn];
        right.style = UIBarButtonItemStylePlain;
        self.navigationItem.rightBarButtonItem = right;
    }
    return _rightBtn;
}

- (NSMutableArray *)dataSource{
    if (nil == _dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _dataSource;
}

- (void)tapBackBtn{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)tapRightBtn{
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
