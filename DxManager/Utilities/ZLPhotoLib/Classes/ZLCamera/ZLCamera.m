//
//  ZLCamera.m
//  ZLAssetsPickerDemo
//
//  Created by 张磊 on 15-1-23.
//  Copyright (c) 2015年 com.zixue101.www. All rights reserved.
//

#import "ZLCamera.h"
#import "SavaData.h"

@implementation ZLCamera

- (UIImage *)photoImage{
    if ([self.imagePath hasPrefix:@"http://"]) {
        return self.thumbImage;
    }
    UIImage *img =  [UIImage imageWithContentsOfFile:self.imagePath];
    if (!img) {
        NSString *path = [SavaData getImagePath:self.imagePath];
        img = [UIImage imageWithContentsOfFile:path];
    }
    return img;

}

@end
