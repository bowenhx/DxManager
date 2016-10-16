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
        iView.layer.borderWidth = 1;
        iView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        iView.layer.cornerRadius = 6;
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
        {
            
        }
            break;
        case 1:
        {
            CheckManageViewController *checkVC = [[CheckManageViewController alloc] initWithNibName:@"CheckManageViewController" bundle:nil];
            [self.navigationController pushViewController:checkVC animated:YES];
        }
            break;
        case 2:
        {
            UIImage *image = [UIImage imageNamed:@"det_vi_dl"];
            [[ANet share] upload:@"http://dx.sitemn.com/ser/Managers.ashx" params:@{@"action":@"saveFile"} image:image precent:^(float precent) {
                
            } completion:^(BNetData *model, NSString *netErr) {
                
            }];
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
        case 6:
        {
            
        }
            break;
        case 7:
        {
            
        }
            break;
        case 8:
        {
            
        }
            break;
        case 9:
        {
            
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
