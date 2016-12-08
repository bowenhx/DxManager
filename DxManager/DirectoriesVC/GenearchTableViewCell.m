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
    
//    self.icon.layer.borderWidth = 1;
//    self.icon.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setInfo:(NSDictionary *)info{
    _info = info;
    [self.icon img_setImageWithURL:info[@"avatar"] placeholderImage:nil];
    
    self.name.text = info[@"childrenname"];
    NSArray *family = info[@"family"];
    if (family.count) {
        self.name2.text = info[@"family"][0][@"familyname"];
        if (family.count > 1) {
            self.name3.text = info[@"family"][1][@"familyname"];
        }else{
            self.name3.text = @"";
        }
    }else{
        self.name2.text = @"";
        self.name3.text = @"";
    }

}

- (IBAction)playTelPhoneAction:(UIButton *)sender {
    NSURL *phoneURL = nil;
    if (sender.tag == 100) {
        NSArray *family = self.info[@"family"];
        if (family.count) {
            NSString *phoneNum = family[0][@"familytel"];
            if (phoneNum.length>2) {
                phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phoneNum]];
            }else{
                [self showHUDTitleView:@"没有电话可供拨打" image:nil];
                return;
            }
            
        }else{
            [self showHUDTitleView:@"没有电话可供拨打" image:nil];
            return;
        }
        
    }else{
        NSArray *family = self.info[@"family"];
        if (family.count>1) {
            NSString *phoneNum = family[1][@"familytel"];
            if (phoneNum.length>2) {
                phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phoneNum]];
            }else{
                [self showHUDTitleView:@"没有电话可供拨打" image:nil];
                return;
            }
        }else{
            [self showHUDTitleView:@"没有电话可供拨打" image:nil];
            return;
        }
    }
   
    [[UIApplication sharedApplication] openURL:phoneURL];
    
    
   
}

@end
