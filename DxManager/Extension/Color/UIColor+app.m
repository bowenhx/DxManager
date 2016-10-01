//
//  UIColor+app.m
//  BKMobile
//
//  Created by Guibin on 15/1/23.
//  Copyright (c) 2015年 com.mobile-kingdom.bkapps All rights reserved.
//

#import "UIColor+app.h"

@implementation UIColor (AppUIColor)

+ (UIColor *)colorAppBg
{
    return @"#49b7da".color;
}

+ (UIColor *)colorTabBar{
    return @"#f9f9f9".color;
}

+ (UIColor *)colorBlue{
    return @"#1489b0".color;
}

+ (UIColor *)colorRed{
    return @"#db73b4".color;
}

+ (UIColor *)colorBlack{
    return @"#555555".color;
}

+ (UIColor *)colorGray{
    return @"#cccccc".color;
}

+ (UIColor *)colorCellGreenBg{
    return @"#E1F2E2".color;
}
+ (UIColor *)collorGold{
    return @"dfc303".color;
}

+ (UIColor *)colorViewBg
{
    return @"#f0eff5".color;
}

+ (UIColor *)colorCellLineBg
{
    return RGB(242, 241, 243);
}
+ (UIColor *)colorMemberFBg{
    return @"#f0c9ca".color;
}
+ (UIColor *)motifSpaceBg
{
    return @"#FE7668".color;
}
+ (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() / (CGFloat)RAND_MAX ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() / (CGFloat)RAND_MAX); // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() / (CGFloat)RAND_MAX ); //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end

@implementation UIImage (BImage_Color)

/**
 *  根据颜色和尺寸返回一个image
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    @autoreleasepool {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context,color.CGColor);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
}


@end

