//
//  DrugFormDataTableViewCell.h
//  DxManager
//
//  Created by Stray on 16/10/20.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrugFormDataTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labData;

@property (weak, nonatomic) IBOutlet UILabel *labDrugName;

@property (weak, nonatomic) IBOutlet UILabel *labDrugNum;

@property (weak, nonatomic) IBOutlet UILabel *labPerson;

@property (nonatomic , copy) NSDictionary *info;

@end
