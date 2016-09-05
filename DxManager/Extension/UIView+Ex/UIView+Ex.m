//
//  UIView+MJEX.m
//  EduKingdom
//
//  Created by ligb on 16/7/1.
//  Copyright © 2016年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "UIView+Ex.h"


@implementation UIView (Ex_Tension)

- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)x{
    return self.frame.origin.x;
}
- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setW:(CGFloat)w{
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}
- (CGFloat)w{
    return self.frame.size.width;
}

- (void)setH:(CGFloat)h{
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}
- (CGFloat)h{
    return self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)centerY{
    return self.center.y;
}

- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)size{
    return self.frame.size;
}

- (CGFloat)max_X{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)max_Y{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)mid_X{
    return CGRectGetMidX(self.frame);
}

- (CGFloat)mid_Y{
    return CGRectGetMidY(self.frame);
}

- (CGFloat)min_X{
    return CGRectGetMinX(self.frame);
}

- (CGFloat)min_Y{
    return CGRectGetMinY(self.frame);
}

- (CGFloat)max_W{
    return CGRectGetWidth(self.frame);
}

- (CGFloat)max_H{
    return CGRectGetHeight(self.frame);
}

- (CGFloat)screen_W{
    return [UIScreen mainScreen].bounds.size.width;
}

- (CGFloat)screen_H{
    return [UIScreen mainScreen].bounds.size.height;
}

- (CGSize)screen_size{
    return [UIScreen mainScreen].bounds.size;
}
@end

@implementation UIImage (Ex_frame)

- (CGFloat)w{
    return self.size.width;
}
- (CGFloat)h{
    return self.size.height;
}
@end


@implementation UIScrollView (EX_EndRefresh)

- (void)endRefreshing{
    if (self.mj_header.isRefreshing) {
        [self.mj_header endRefreshing];
    }else if (self.mj_footer.isRefreshing){
        [self.mj_footer endRefreshing];
    }
}

@end


@implementation UIViewController (EX_Screen)

- (CGFloat)screen_W{
    return [UIScreen mainScreen].bounds.size.width;
}

- (CGFloat)screen_H{
    return [UIScreen mainScreen].bounds.size.height;
}

- (CGSize)screen_size{
    return [UIScreen mainScreen].bounds.size;
}

@end
