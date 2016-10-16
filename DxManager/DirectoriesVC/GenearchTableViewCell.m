//
//  GenearchTableViewCell.m
//  DxManager
//
//  Created by ligb on 16/10/9.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "GenearchTableViewCell.h"
#import "AppDefine.h"

@implementation GenearchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.icon.layer.borderWidth = 1;
    self.icon.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setInfo:(NSDictionary *)info{
    [self.icon img_setImageWithURL:info[@"avatar"] placeholderImage:nil];
    
    self.name.text = info[@"childrenname"];
    self.name2.text = info[@"family"][0][@"familyname"];
    self.name3.text = info[@"family"][1][@"familyname"];
}
@end
