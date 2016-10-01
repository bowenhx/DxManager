//
//  TrendsTableViewCell.m
//  DxManager
//
//  Created by ligb on 16/9/7.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "TrendsTableViewCell.h"
#import "AppDefine.h"

@implementation TrendsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.labLineBg.backgroundColor = [UIColor colorGray];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setInfo:(NSDictionary *)info{
    
}

@end
