//
//  PraiseItemView.m
//  DxTeacher
//
//  Created by ligb on 16/11/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#define SPACE 5 //图片间隔20
#define PRAISE_W 30
#import "PraiseItemView.h"
#import "AppDefine.h"

@implementation PraiseItemView

- (void)setItems:(NSArray *)items{
    for (int i= 0; i<items.count; i++) {
        float addBtnX = SPACE + (SPACE + PRAISE_W) * (i%5);
        float addBtnY = 5 + (SPACE + PRAISE_W) * (i/5);
         UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, PRAISE_W, PRAISE_W)];
        [imageView img_setImageWithURL:items[i][@"img_url"] placeholderImage:nil];
        //imageView.layer.borderWidth = 1;
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 15;
        [self addSubview:imageView];
    }
}

@end
