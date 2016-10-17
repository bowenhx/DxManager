//
//  ItemVIewsHeight.m
//  DxManager
//
//  Created by ligb on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#define SPACE 5  //图片间隔5
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

#import "ItemVIewsHeight.h"


@implementation ItemVIewsHeight

+ (CGFloat)loadItmesCounts:(NSInteger)count{
    float width = SCREEN_WIDTH - 86 - 8;
    float btn_wh = (width - SPACE * 4) / 3;
    
    CGFloat height = 0;
    for (int i= 0; i<count; i++) {
        float addY = 2 + (SPACE + btn_wh) * (i/3);
        height = addY;
    }
    
    return height + btn_wh +5;
}

+ (CGFloat)loadTextContents:(NSString *)str{
    float width = SCREEN_WIDTH - 86 - 8;
     CGRect rect = [str boundingRectWithSize:CGSizeMake(width , 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
    return rect.size.height+10;
}

@end
