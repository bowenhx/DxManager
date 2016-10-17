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
    _itemBtn.frame = self.bounds;
    [_itemBtn setImage:[UIImage imageNamed:itemImgs] forState:0];
    _itemBtn.imageEdgeInsets = UIEdgeInsetsMake(-15, 0, 15, 0);
    _itemBtn.layer.borderWidth = 1;
    _itemBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _itemBtn.layer.cornerRadius = 6;
    
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
