//
//  TrendsTableViewCell.m
//  DxManager
//
//  Created by ligb on 16/9/7.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "TrendsTableViewCell.h"
#import "AppDefine.h"
#import "ItemVIewsHeight.h"

@implementation TrendsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.headImg.layer.borderWidth = 1;
//    self.headImg.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.headImg.layer.cornerRadius = 5;
//    self.headImg.layer.cornerRadius = 35;
    
//    self.imagesView.layer.borderWidth = 1;
    
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
    
    //0已审核 1未审核 2审核不通过
    NSInteger value = [info[@"status"] integerValue];
    if (value == 0) {
        self.labCheck.text = @"已审核";
    }else if (value == 1){
        self.labCheck.text = @"未审核";
    }else if (value == 3){
        self.labCheck.text = @"审核不通过";
    }
    
    
    //title
    self.labTitle.text = info[@"title"];
    
    //描述
    self.labDescription.text = info[@"zhaiyao"];
    
    NSArray *items = info[@"albums"];
    self.imagesView.imgItems = items;
    
    //计算图片height
    self.imagesHeight.constant = [ItemVIewsHeight loadItmesCounts:items.count];
}

@end
