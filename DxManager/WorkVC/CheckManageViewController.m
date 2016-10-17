//
//  CheckManageViewController.m
//  DxManager
//
//  Created by ligb on 16/9/19.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "CheckManageViewController.h"
#import "CheckTableViewCell.h"

@interface CheckManageViewController ()
{
    
    __weak IBOutlet UISegmentedControl *_segmentedControl;
    
    __weak IBOutlet UITableView *_tableVeiw;
    
    
    IBOutlet UIView *_headView;
    
    __weak IBOutlet UILabel *_labDate;
    
    __weak IBOutlet UIView *_roundBgView;
    
    
}
@end

@implementation CheckManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"考勤管理";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
}

- (void)loadNewView{
//    _tableVeiw.layer.borderWidth = 1;
//    _tableVeiw.layer.borderColor = [UIColor redColor].CGColor;
    
    
    _roundBgView.layer.cornerRadius = 75;
    
    [_headView setW:self.screen_W];
    
//    _headView.layer.borderWidth = 2;
//    _headView.layer.borderColor = [UIColor greenColor].CGColor;
    _tableVeiw.tableHeaderView = _headView;
}

#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *xibName = @"CheckTableViewCell";
    CheckTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
    }
    
    return cell;
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
