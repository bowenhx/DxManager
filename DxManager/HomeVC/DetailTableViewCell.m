//
//  DetailTableViewCell.m
//  DxManager
//
//  Created by ligb on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "AppDefine.h"
#import "ItemVIewsHeight.h"

@implementation DetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setInfo:(NSDictionary *)info{
    //头像
    [self.icon img_setImageWithURL:info[@"img_url"] placeholderImage:nil];
    
    //用户
    self.labName.text = info[@"fields"][@"author"];
    
    //时间
    self.labTime.text = [NSString getDateStringWithString:info[@"add_time"]];
    
    //班级
    self.labClasses.text = info[@"fields"][@"source"];
    
    //0表示已审核，其他都是未审核
    self.labVerify.text = [info[@"status"] integerValue] ? @"未审核" : @"已审核";
    
    //title
    self.labTitle.text = info[@"title"];
    
    //描述
    self.labDetial.text = info[@"zhaiyao"];
    self.labDetial.layer.borderWidth = 1;
    //计算图片height
    self.labDetailHeight.constant = [ItemVIewsHeight loadTextContents:info[@"zhaiyao"]];
}

@end
