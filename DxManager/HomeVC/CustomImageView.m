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
#import "ZLPhotoPickerBrowserViewController.h"
#import "UploadingFormData.h"

@interface CustomImageView ()<ZLPhotoPickerBrowserViewControllerDelegate>

@end

@implementation CustomImageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setImgItems:(NSArray *)imgItems{
    _imgItems = imgItems;
    float width = self.screen_W - 86 - 8;
    float btn_wh = (width - SPACE * 4) / 3;
    
    CGFloat height = 0;
    for (int i= 0; i<imgItems.count; i++) {
        float addBtnX = SPACE + (SPACE + btn_wh) * (i%3);
        float addBtnY = 2 + (SPACE + btn_wh) * (i/3);
        
        UIImageView *iView = [[UIImageView alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh)];
        iView.backgroundColor = [UIColor whiteColor];
        [iView img_setImageWithURL:imgItems[i][@"thumb_path"] placeholderImage:nil];
        [self addSubview:iView];
       
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh);
        btn.tag = i;
        [btn addTarget:self action:@selector(selectImageViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
         height = iView.max_H;
    }
    

}
- (void)selectImageViewAction:(UIButton *)btn{
    // 图片游览器
    ZLPhotoPickerBrowserViewController *pickerBrowser = [[ZLPhotoPickerBrowserViewController alloc] init];
    // 淡入淡出效果
    pickerBrowser.status = UIViewAnimationAnimationStatusFade;
    // 数据源/delegate
    pickerBrowser.editing = YES;
    pickerBrowser.editText = @"保存";
    pickerBrowser.photos = [NSArray setPhotoPickerPhotos:self.imgItems urlKey:@"original_path"];
    // 能够删除
    pickerBrowser.delegate = self;
    // 当前选中的值
    pickerBrowser.currentIndex = btn.tag;
    // 展示控制器
    [pickerBrowser showPickerVc:self.viewController];

}
@end
