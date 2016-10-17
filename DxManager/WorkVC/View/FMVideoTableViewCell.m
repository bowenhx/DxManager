//
//  FMTableViewCell.m
//  DxManager
//
//  Created by Stray on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "FMVideoTableViewCell.h"
#import "AppDefine.h"

@implementation FMVideoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.labLineBg.backgroundColor = [UIColor colorGray];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setInfo:(NSDictionary *)info{
    _info = info;
    [self.headView img_setImageWithURL:info[@"img_url"] placeholderImage:nil];
    
    self.labName.text = info[@"fields"][@"author"];
    
    //时间
    self.labTime.text = [NSString getDateStringWithString:info[@"add_time"]];
    
    self.labContent.text = info[@"title"];
    
}


- (IBAction)playVideoAction:(UIButton *)sender {
    
    
}

@end
