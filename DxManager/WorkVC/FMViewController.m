//
//  FMViewController.m
//  DxManager
//
//  Created by ligb on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "FMViewController.h"
#import "AppDefine.h"
#import "FMAudioTableViewCell.h"
#import "FMVideoTableViewCell.h"

@interface FMViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FMViewController
- (void)dealloc{
    NSLog(@"remove self");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"大象FM";
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"audioPlayCenter" object:nil];
}
- (void)loadNewView{
//    self.tableView.layer.borderWidth = 1;
//    self.tableView.layer.borderColor = [UIColor redColor].CGColor;
}
- (void)loadNewData{
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getNewsList",@"aid":@(67)} completion:^(BNetData *model, NSString *netErr) {
        [self.view removeHUDActivity];
        
        NSLog(@"data = %@",model.data);
        if (model.status == 0) {
            //请求成功
            [self.dataSource setArray:model.data];
            [_tableView reloadData];
        }else{
            [self.view showHUDTitleView:model.message image:nil];
        }
        
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *fmType = self.dataSource[indexPath.row][@"fields"][@"fm_type"];
    if ([fmType isEqualToString:@"视频"]) {
        static NSString *xibName = @"FMVideoTableViewCell";
        
        FMVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.viewController = self;
        cell.info = self.dataSource[indexPath.row];
        cell.btnDZ.tag = indexPath.row;
        [cell.btnDZ addTarget:self action:@selector(didSelectDianZan:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else{
        static NSString *xibName = @"FMAudioTableViewCell";
        
        FMAudioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.info = self.dataSource[indexPath.row];
        cell.btnDZ.tag = indexPath.row;
        [cell.btnDZ addTarget:self action:@selector(didSelectDianZan:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *fmType = self.dataSource[indexPath.row][@"fields"][@"fm_type"];
    if ([fmType isEqualToString:@"视频"]) {
        return 225;
    }else
        return 170;
}
- (void)didSelectDianZan:(UIButton *)btn{
    NSDictionary *info = [SavaData parseDicFromFile:User_File];
    NSDictionary *dict = nil;
    if (btn.selected) {
        dict = @{@"action":@"doFavorite",
                 @"uid":info[@"id"],
                 @"cid":self.dataSource[btn.tag][@"id"],
                 @"type":@(3),
                 @"fid":self.dataSource[btn.tag][@"id"],
                 };
    }else{
        dict = @{@"action":@"doFavorite",
                @"uid":info[@"id"],
                @"cid":self.dataSource[btn.tag][@"id"],
                @"type":@(3)
               };
    }
    
  
    
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:dict completion:^(BNetData *model, NSString *netErr) {
        [self.view removeHUDActivity];
        NSLog(@"data = %@",model.data);
        
        if (netErr) {
            [self.view showHUDTitleView:netErr image:nil];
        }else if (model.status == 0) {
            [self.view showSuccess:model.message];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self loadNewData];
            });

        }else{
            [self.view showHUDTitleView:model.message image:nil];
        }
        
    }];
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
