//
//  DrugFormDataTableViewCell.m
//  DxManager
//
//  Created by Stray on 16/10/20.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "DrugFormDataTableViewCell.h"

@implementation DrugFormDataTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setInfo:(NSDictionary *)info{
    self.labData.text = info[@"drugs_date"];
    self.labDrugName.text = info[@"title"];
    self.labDrugNum.text = info[@"drugs_quantum"];
    self.labPerson.text = info[@"drugs_sender"];
}


@end
