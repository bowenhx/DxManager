//
//  WorkViewController.m
//  DxManager
//
//  Created by ligb on 16/9/5.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#define SPACE 20  //图片间隔20

#import "WorkViewController.h"
#import "ItemViewBtn.h"
#import "CheckManageViewController.h"
#import "AppDefine.h"
#import "ClassesViewController.h"
#import "FMViewController.h"
#import "ReportViewController.h"

@interface WorkViewController ()

@end

@implementation WorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"大象顺义园所-工作";
    
   
}

- (void)loadNewView{
    
    NSArray *images = @[
                        @[@"vi_jztxl",@"通讯录"],
                        @[@"vi_kqg",@"考勤管理"],
                        @[@"vi_bjqgl",@"班级圈管理"],
                        @[@"vi_dxfm",@"大象FM"],
                        @[@"vi_spjkgl",@"视频监控管理"],
                        @[@"vi_yytgl",@"用药条管理"],
                        @[@"vi_jxjh",@"教学计划"],
                        @[@"vi_ystz",@"园所通知"],
                        @[@"vi_hdts",@"互动投诉"],
                        @[@"vi_tcwj",@"调查问卷"]
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelectIndex:(UIButton *)btn{
    NSLog(@"btn.tag = %ld",btn.tag);
    
    switch (btn.tag) {
        case 0:
        {//通讯录
            
        }
            break;
        case 1:
        {//考勤管理
            CheckManageViewController *checkVC = [[CheckManageViewController alloc] initWithNibName:@"CheckManageViewController" bundle:nil];
            [self.navigationController pushViewController:checkVC animated:YES];
        }
            break;
        case 2:
        {//班级圈管理
            ClassesViewController *classesVC = [[ClassesViewController alloc] initWithNibName:@"ClassesViewController" bundle:nil];
            classesVC.navigationItem.title = @"班级圈管理";
            classesVC.index = 52;
            [self.navigationController pushViewController:classesVC animated:YES];
        }
            break;
        case 3:
        {//大象FM
            FMViewController *fmVC = [[FMViewController alloc] initWithNibName:@"FMViewController" bundle:nil];
            
            [self.navigationController pushViewController:fmVC animated:YES];
        }
            break;
        case 4:
        {//视频监控管理
            
        }
            break;
        case 5:
        {//用药条管理
            
        }
            break;
        case 6:
        {//教学计划
            ClassesViewController *classesVC = [[ClassesViewController alloc] initWithNibName:@"ClassesViewController" bundle:nil];
            classesVC.index = 64;
            classesVC.navigationItem.title = @"教学计划";
            [self.navigationController pushViewController:classesVC animated:YES];
        }
            break;
        case 7:
        {//园所通知
            ClassesViewController *classesVC = [[ClassesViewController alloc] initWithNibName:@"ClassesViewController" bundle:nil];
            classesVC.index = 52;
            classesVC.navigationItem.title = @"园所通知";
            [self.navigationController pushViewController:classesVC animated:YES];
        }
            break;
        case 8:
        {//互动投诉
            ReportViewController *reportVC = [[ReportViewController alloc] initWithNibName:@"ReportViewController" bundle:nil];
            [self.navigationController pushViewController:reportVC animated:YES];
        }
            break;
        case 9:
        {//调查问卷
            
        }
            break;
            
        default:
            break;
    }
    
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
