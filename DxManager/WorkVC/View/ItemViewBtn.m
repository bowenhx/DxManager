//
//  ItemViewBtn.m
//  DxManager
//
//  Created by ligb on 16/9/19.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "ItemViewBtn.h"
#import "UIView+Ex.h"
@implementation ItemViewBtn

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setItemImgs:(NSString *)itemImgs{
    _itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _itemBtn.frame = CGRectMake(0, 0, self.w, self.h-30);
    [_itemBtn setImage:[UIImage imageNamed:itemImgs] forState:0];
    [self addSubview:_itemBtn];
}

- (void)setTitles:(NSString *)titles{
    UILabel *labTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, self.h-30, self.w, 20)];
    labTitle.text = titles;
    labTitle.font = [UIFont systemFontOfSize:13];
    labTitle.textAlignment = NSTextAlignmentCenter;
    labTitle.textColor = [UIColor darkGrayColor];
    [self addSubview:labTitle];
    
}

@end
