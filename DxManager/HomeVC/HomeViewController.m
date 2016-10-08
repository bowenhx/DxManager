//
//  HomeViewController.m
//  DxManager
//
//  Created by ligb on 16/9/5.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomItemView.h"
#import "HomeCustomTableView.h"
#import "AppDefine.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet CustomItemView *customView;

@property (nonatomic , strong) NSMutableArray *itemViews;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"大象顺义园所首页";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (void)loadNewView{
    //初始化页面view
    NSMutableArray *views = [[NSMutableArray alloc] initWithCapacity:4];
    for (int i =0; i<5; i++) {
        HomeCustomTableView *view = [[HomeCustomTableView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, self.screen_H-49-64)];
        [views addObject:view];
    }
    
    //item 页面布局
    [_customView addItemView:views title:@[@"通  知",
                                           @"精彩瞬间",
                                           @"每日食谱",
                                           @"课程计划",
                                           @"园所安全"] height: self.screen_H-49-64];
    
    //默认加载首页通知数据
    HomeCustomTableView *iView = views[0];
    [iView loadNewData:52];
    
    //item 变化数据加载处理
    _customView.itemsEcentAction = ^(NSInteger index){
        NSLog(@"index = %ld",(long)index);
        
        HomeCustomTableView *iView = views[index];
        if (index == 0) {
            [iView loadNewData:52];
        }else{
            [iView loadNewData:index + 61];
        }
        
        
        
    };
    
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