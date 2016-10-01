//
//  GuideViewController.m
//  DxManager
//
//  Created by ligb on 16/9/5.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "GuideViewController.h"
#import "AppDefine.h"
#import "LoginViewController.h"

@interface GuideViewController ()<UIScrollViewDelegate>
{
    UIScrollView    *_scrollView;
    UIPageControl   *_pageControl;
}
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self addScrollView];
}
- (void)addScrollView{
    _scrollView= [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.contentSize = CGSizeMake(self.screen_W*3, self.view.h);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.bounces = YES;
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, self.screen_H-45, self.screen_W-200, 30)];
    _pageControl.numberOfPages = 3;
    
    for (int i =0; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.screen_W*i, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
        imageView.userInteractionEnabled = YES;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"vi_yd_%d",i+1]];
        if (i==2) {
            [imageView addSubview:[self buttonAccessRootViewPage]];
        }
        [_scrollView addSubview:imageView];
    }
    
    [self.view addSubview:_scrollView];
    [self.view addSubview:_pageControl];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (UIButton *)buttonAccessRootViewPage{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(80, self.screen_H-100, self.screen_W-160, 40);
    [button setTitle:@"进入" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:0];
    button.backgroundColor = [UIColor colorBlue];
    button.layer.cornerRadius = 3;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [button addTarget:self action:@selector(accessRootViewAction) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x / self.screen_W;
    _pageControl.currentPage = page;
}

- (void)accessRootViewAction
{
    //进入登陆页面
    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:loginVC animated:YES];
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
