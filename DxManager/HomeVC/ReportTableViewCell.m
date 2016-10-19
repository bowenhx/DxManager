//
//  ReportTableViewCell.m
//  DxManager
//
//  Created by ligb on 16/10/19.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "ReportTableViewCell.h"
#import "AppDefine.h"
#import "ItemVIewsHeight.h"

@implementation ReportTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.labLineBg.backgroundColor = [UIColor colorGray];

    [self.btnCheck setTitle:@"回复" forState:0];
    [self.btnCheck setTitleColor:[UIColor colorAppBg] forState:0];
    self.btnCheck.layer.borderWidth = 1;
    self.btnCheck.layer.borderColor = [UIColor colorAppBg].CGColor;
    self.btnCheck.layer.cornerRadius = 3;
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
    
    
    //title
    self.labTitle.text = info[@"title"];
    
    //描述
    self.labDescription.text = info[@"zhaiyao"];
    
    NSArray *items = info[@"albums"];
    self.imagesView.imgItems = items;
    
    //计算图片height
    self.imagesHeight.constant = [ItemVIewsHeight loadItmesCounts:items.count];
    
    NSArray *comments = info[@"comment"];
    self.commentView.inputID = [info[@"id"] integerValue];
    [self.commentView.dataSource setArray:comments];
    [self.commentView loadData];
    self.commentHight.constant = comments.count * 25;
}

@end
