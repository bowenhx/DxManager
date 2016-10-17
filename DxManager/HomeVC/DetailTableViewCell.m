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
    self.labVerify.textColor = @"ff0000".color;
    self.labVerify.layer.borderWidth = 1;
    self.labVerify.layer.borderColor = @"ff0000".color.CGColor;
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
    
    //0已审核 1未审核 2审核不通过
    NSInteger value = [info[@"status"] integerValue];
    if (value == 0) {
        self.labVerify.text = @"已审核";
    }else if (value == 1){
        self.labVerify.text = @"未审核";
    }else if (value == 3){
        self.labVerify.text = @"审核不通过";
    }
    
    
    //title
    self.labTitle.text = info[@"title"];
    
    //描述
    self.labDetial.text = info[@"zhaiyao"];
    
    //计算图片height
    self.labDetailHeight.constant = [ItemVIewsHeight loadTextContents:info[@"zhaiyao"]];
}

@end
