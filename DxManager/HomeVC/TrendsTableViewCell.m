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
    self.headImg.layer.borderWidth = 1;
//    self.headImg.layer.cornerRadius = 35;
    
    self.labLineBg.backgroundColor = [UIColor colorGray];
    self.labCheck.textColor = @"ff0000".color;
    self.labCheck.layer.borderWidth = 1;
    self.labCheck.layer.borderColor = @"ff0000".color.CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setInfo:(NSDictionary *)info{
    //头像
    [self.headImg img_setImageWithURL:info[@"img_url"] placeholderImage:nil];
    
    //用户
    self.labName.text = info[@"fields"][@"author"];
    
    //时间
    self.labTime.text = [NSString getDateStringWithString:info[@"add_time"]];
   
    //班级
    self.labClass.text = info[@"fields"][@"source"];
    
    //0表示已审核，其他都是未审核
    self.labCheck.text = [info[@"status"] integerValue] ? @"未审核" : @"已审核";
    
    //描述
    self.labDescription.text = info[@"zhaiyao"];
    
    
    
}

@end
