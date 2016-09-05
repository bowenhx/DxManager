//
//  UIImage+UIImageExt.h
//  Sphygmometer
//
//  Created byGuibin on 14-7-19.
//  Copyright (c) 2014年 com.mobile-kingdom.bkapps All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(UIImageExt)
/**
 *  图片按比例缩放
 *
 */
- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize;
/**
 *  调整图片像素
 *
 */
- (UIImage *)scalingImageByRatio;
/**
 *  调整图片方向
 *
 */
- (UIImage *)fixOrientation;
/**
 *  根据宽度来重新绘制图片
 *
 */
- (UIImage *)compressedImage:(float)width;
/**
 *  设置压缩率来压缩图片
 *
 */
- (NSData *)compressedData;
- (NSData *)compressedData:(CGFloat)compressionQuality;
- (CGFloat)compressionQuality;

/**
 *  设定frame来裁剪图片
 */
- (UIImage *)croppedImage:(CGRect)bounds;
- (UIImage *)getImageFromImage;

- (UIImage *)normalizedImage;

@end
