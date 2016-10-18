//
//  NSWebImg+NSString.m
//  DxManager
//
//  Created by Stray on 16/10/1.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "UIImageView+NSString.h"
#import "UIImageView+WebCache.h"
#import "NSString+UIColor.h"

@implementation UIImageView (Image_URL)

- (void)img_setImageWithURL:(NSString *)string placeholderImage:(UIImage *)img{
    NSURL *url = [NSString getPathByAppendString:string];
    [self sd_setImageWithURL:url placeholderImage:img];
}

@end
