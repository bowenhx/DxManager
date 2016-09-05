//
//  CustomBarButtonItem.m
//  EduKingdom
//
//  Created by ligb on 16/7/7.
//  Copyright © 2016年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "CustomBarButtonItem.h"

@implementation CustomBarButtonItem

+ (NSArray <UIBarButtonItem *>*)rightItemAddButton:(NSArray *)imgs{
    
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:imgs.count];
    for (int i = 0; i < imgs.count; i++) {
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:imgs[i]];
        item.frame = CGRectMake(0, 0, image.size.width , image.size.height);
        // 这里需要注意：由于是想让图片右移，所以left需要设置为正，right需要设置为负。正在是相反的。
        [item setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        [item setImage:imgs[i] forState:UIControlStateNormal];
        [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *itemMore = [[UIBarButtonItem alloc] initWithCustomView:item];
        
        [items addObject:itemMore];
    }
    
    return items;
    
    /**
    //更多按钮
    UIButton *buttonMore = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imageMore = [UIImage imageNamed:@"def_btn_More_unpressed"];
    buttonMore.frame = CGRectMake(-10, 0, imageMore.size.width , imageMore.size.height);
    // 这里需要注意：由于是想让图片右移，所以left需要设置为正，right需要设置为负。正在是相反的。
    [buttonMore setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    [buttonMore setImage:imageMore forState:UIControlStateNormal];
    [buttonMore addTarget:self action:@selector(rightPopViewAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemMore = [[UIBarButtonItem alloc] initWithCustomView:buttonMore];
    
    //回复按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"def_btn_reply_unpressed"];
    button.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(replyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemReply = [[UIBarButtonItem alloc] initWithCustomView:button];
    */
    
    
}
- (void)itemAction:(UIButton *)btn{
    NSLog(@"btn.tag = %d",btn.tag);
}
@end
