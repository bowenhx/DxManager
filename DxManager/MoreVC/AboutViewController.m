//
//  AboutViewController.m
//  DxManager
//
//  Created by Stray on 16/10/21.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于萌玛稚童";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    self.textView.layer.borderWidth = 1;
//    self.textView.layer.borderColor = [UIColor redColor].CGColor;
}
- (void)loadNewData{
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    
    [[ANet share] post:BASE_URL params:@{@"action":@"getNewsContent",@"cid":@"about"} completion:^(BNetData *model, NSString *netErr) {
        [self.view removeHUDActivity];
        
        NSLog(@"data = %@",model.data);
        if (model.status == 0) {
            
            self.textView.text = model.data[@"content"];
        }else{
            [self.view showHUDTitleView:model.message image:nil];
        }
        
    }];

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
