//
//  FMAudioTableViewCell.m
//  DxManager
//
//  Created by Stray on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "FMAudioTableViewCell.h"
#import "AppDefine.h"
@implementation FMAudioTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.labLineBg.backgroundColor = [UIColor colorGray];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
