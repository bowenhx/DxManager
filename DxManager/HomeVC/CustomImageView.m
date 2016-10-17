//
//  CustomImageView.m
//  DxManager
//
//  Created by ligb on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#define SPACE 5  //图片间隔5

#import "CustomImageView.h"
#import "AppDefine.h"

@implementation CustomImageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setImgItems:(NSArray *)imgItems{
    float width = self.screen_W - 86 - 8;
    float btn_wh = (width - SPACE * 4) / 3;
    
    CGFloat height = 0;
    for (int i= 0; i<imgItems.count; i++) {
        float addBtnX = SPACE + (SPACE + btn_wh) * (i%3);
        float addBtnY = 2 + (SPACE + btn_wh) * (i/3);
        
        UIImageView *iView = [[UIImageView alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh)];
        [iView img_setImageWithURL:imgItems[i][@"original_path"] placeholderImage:nil];
//        iView.layer.borderWidth = 1;
        
        [self addSubview:iView];
        height = iView.max_H;
    }
    

}
@end
