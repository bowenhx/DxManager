//
//  NSWebImg+NSString.m
//  DxManager
//
//  Created by Stray on 16/10/1.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "UIImageView+NSString.h"
#import "UIImageView+WebCache.h"
//图片 根地址
#define BASE_IMG_URL  @"http://dx.sitemn.com/upload/201609/29/201609291440212547.png"

@implementation UIImageView (Image_URL)

- (void)img_setImageWithURL:(NSString *)string placeholderImage:(UIImage *)img{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BASE_IMG_URL,string]];
    [self sd_setImageWithURL:url placeholderImage:img];
}
@end
