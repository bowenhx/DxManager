//
//  TrendsTableViewCell.h
//  DxManager
//
//  Created by ligb on 16/9/7.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrendsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImg;

@property (weak, nonatomic) IBOutlet UILabel *labName;

@property (weak, nonatomic) IBOutlet UILabel *labTime;

@property (weak, nonatomic) IBOutlet UILabel *labClass;

@property (weak, nonatomic) IBOutlet UILabel *labCheck;

@property (weak, nonatomic) IBOutlet UILabel *labDescription;

@property (weak, nonatomic) IBOutlet UILabel *labLineBg;


@property (nonatomic , strong) NSDictionary *info;

@end
