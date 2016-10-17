//
//  DirectorViewController.m
//  DxManager
//
//  Created by ligb on 16/9/5.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#define SPACE 20  //图片间隔20


#import "DirectorViewController.h"
#import "ItemViewBtn.h"
#import "TeacherViewController.h"
#import "GenearchViewController.h"

@interface DirectorViewController ()

@end

@implementation DirectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"通讯录";
}


- (void)loadNewView{
    NSArray *images = @[
                        @[@"vi_jztxl",@"家长通讯录"],
                        @[@"vi_ystxl",@"园所通讯录"]
                       ];
    
    float btn_wh = (self.screen_W - SPACE * 4) / 3;
    
    
    for (int i= 0; i<images.count; i++) {
        float addBtnX = SPACE + (SPACE + btn_wh) * (i%3);
        float addBtnY = 84 + (SPACE + btn_wh) * (i/3);
        
        ItemViewBtn *iView = [[ItemViewBtn alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh)];
        iView.itemImgs = images[i][0];
        iView.titles = images[i][1];
        [self.view addSubview:iView];
        iView.itemBtn.tag = i;
        [iView.itemBtn addTarget:self action:@selector(didSelectIndex:) forControlEvents:UIControlEventTouchUpInside];
    }

}
- (void)didSelectIndex:(UIButton *)btn{
    if (btn.tag == 0) {
        //家长通讯录
        GenearchViewController *genearchVC = [[GenearchViewController alloc] initWithNibName:@"GenearchViewController" bundle:nil];
        [self.navigationController pushViewController:genearchVC animated:YES];
    }else{
        //园所通讯录
        TeacherViewController *teacherVC = [[TeacherViewController alloc] initWithNibName:@"TeacherViewController" bundle:nil];
        [self.navigationController pushViewController:teacherVC animated:YES];
    }
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
