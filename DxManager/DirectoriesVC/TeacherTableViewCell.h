//
//  TeacherTableViewCell.h
//  DxManager
//
//  Created by ligb on 16/10/8.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeacherTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *job;
@property (weak, nonatomic) IBOutlet UIButton *phone;

@property (nonatomic , strong) NSDictionary *info;
@end
