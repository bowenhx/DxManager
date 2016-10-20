//
//  DrugFormDataViewController.m
//  DxManager
//
//  Created by Stray on 16/10/20.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "DrugFormDataViewController.h"
#import "DrugFormDataTableViewCell.h"

@interface DrugFormDataViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DrugFormDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"生成班级用药报告";
    
    
}
- (void)loadNewData{
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getDrugReport"} completion:^(BNetData *model, NSString *netErr) {
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
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *itemArray = self.dataSource[section][@"durgs"];
    return itemArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *xibName = @"DrugFormDataTableViewCell";
    DrugFormDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSArray *itemArray = self.dataSource[indexPath.section][@"durgs"];
    cell.info = itemArray[indexPath.row];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, 60)];
    UILabel *labText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, 25)];
    labText.font = [UIFont systemFontOfSize:14];
    labText.backgroundColor = [UIColor colorCellLineBg];
    labText.text = [NSString stringWithFormat:@"     %@",self.dataSource[section][@"gradename"]];
    
    [headView addSubview:labText];
    
    float itemW = self.screen_W / 4;
    
    NSArray *itemTitle = @[@"时间",@"药品名称",@"数量",@"送药人"];
    
    for (int i = 0; i<itemTitle.count; i++) {
        UILabel *labItem = [[UILabel alloc] initWithFrame:CGRectMake(i*itemW, 34, itemW, 20)];
        labItem.textAlignment = NSTextAlignmentCenter;
        if (i > 2) {
            labItem.textAlignment = NSTextAlignmentRight;
            if (i == 2) {
                 [labItem setX:labItem.x+20];
            }else if (i == 3) {
                 [labItem setX:labItem.x-10];
            }
           
        }
        labItem.font = [UIFont systemFontOfSize:14];
        labItem.textColor = [UIColor colorAppBg];
        labItem.text = itemTitle[i];
        [headView addSubview:labItem];
        
    }
    
    UILabel *labLine = [[UILabel alloc] initWithFrame:CGRectMake(10, headView.h - 1, self.screen_W-20, 1)];
    labLine.backgroundColor = [UIColor colorAppBg];
    labLine.text = @"";
    [headView addSubview:labLine];
    
    return headView;
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
