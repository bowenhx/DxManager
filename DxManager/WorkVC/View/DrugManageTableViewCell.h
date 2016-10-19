//
//  DrugManageTableViewCell.h
//  DxManager
//
//  Created by ligb on 16/10/19.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrugManageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *itemViewBg;

@property (weak, nonatomic) IBOutlet UILabel *labDrugName;

@property (weak, nonatomic) IBOutlet UILabel *labTime;

@property (weak, nonatomic) IBOutlet UILabel *labNum;

@property (weak, nonatomic) IBOutlet UILabel *labDrugTime;

@property (weak, nonatomic) IBOutlet UILabel *labPerson1;

@property (weak, nonatomic) IBOutlet UILabel *labPerson2;

@property (weak, nonatomic) IBOutlet UILabel *labPathogeny;

@property (weak, nonatomic) IBOutlet UIImageView *imgVideo;

@property (weak, nonatomic) IBOutlet UIButton *btnPlay;






@end
