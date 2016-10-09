//
//  GenearchTableViewCell.h
//  DxManager
//
//  Created by ligb on 16/10/9.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GenearchTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *name2;

@property (weak, nonatomic) IBOutlet UILabel *name3;

@property (weak, nonatomic) IBOutlet UIButton *phone1;
@property (weak, nonatomic) IBOutlet UIButton *phone2;

@property (nonatomic , strong) NSDictionary *info;

@end
