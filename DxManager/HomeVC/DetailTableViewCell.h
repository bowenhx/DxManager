//
//  DetailTableViewCell.h
//  DxManager
//
//  Created by ligb on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *labName;

@property (weak, nonatomic) IBOutlet UILabel *labTime;

@property (weak, nonatomic) IBOutlet UILabel *labClasses;

@property (weak, nonatomic) IBOutlet UILabel *labTitle;

@property (weak, nonatomic) IBOutlet UILabel *labVerify;

@property (weak, nonatomic) IBOutlet UILabel *labDetial;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labDetailHeight;

@property (nonatomic , strong) NSDictionary *info;

@end
