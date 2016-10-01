//
//  CheckTableViewCell.m
//  DxManager
//
//  Created by ligb on 16/9/21.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "CheckTableViewCell.h"
#import "UIColor+app.h"

@implementation CheckTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    self.classesName.layer.borderWidth = .5;
    self.classesName.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.peopleNum1.textColor = [UIColor colorRed];
    self.peopleNum2.textColor = [UIColor colorRed];
    self.peopleNum3.textColor = [UIColor colorRed];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
