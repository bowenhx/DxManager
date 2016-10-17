//
//  TeacherTableViewCell.m
//  DxManager
//
//  Created by ligb on 16/10/8.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "TeacherTableViewCell.h"
#import "AppDefine.h"

@implementation TeacherTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setInfo:(NSDictionary *)info{
    _info = info;
    [self.icon img_setImageWithURL:info[@"avatar"] placeholderImage:nil];
    
    self.name.text = info[@"teachername"];
    self.job.text = info[@"teachertel"];
   
}
- (IBAction)playTelPhoneAction:(UIButton *)sender {
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",self.info[@"teachertel"]]];
    [[UIApplication sharedApplication] openURL:phoneURL];
}

@end
