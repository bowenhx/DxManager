//
//  UIView+MJEX.h
//  EduKingdom
//
//  Created by ligb on 16/7/1.
//  Copyright © 2016年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@interface UIView (Ex_Tension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;

@property (assign, nonatomic, readonly) CGFloat max_X;
@property (assign, nonatomic, readonly) CGFloat max_Y;
@property (assign, nonatomic, readonly) CGFloat mid_X;
@property (assign, nonatomic, readonly) CGFloat mid_Y;
@property (assign, nonatomic, readonly) CGFloat min_X;
@property (assign, nonatomic, readonly) CGFloat min_Y;
@property (assign, nonatomic, readonly) CGFloat max_W;
@property (assign, nonatomic, readonly) CGFloat max_H;
@property (assign, nonatomic, readonly) CGFloat screen_W;
@property (assign, nonatomic, readonly) CGFloat screen_H;
@property (assign, nonatomic, readonly) CGSize  screen_size;

@end

@interface UIImage (Ex_frame)
@property (nonatomic, assign, readonly) CGFloat w;
@property (nonatomic, assign, readonly) CGFloat h;
@end

@interface UIScrollView (EX_EndRefresh)
- (void)endRefreshing;
@end

@interface UIViewController (EX_Screen)
@property (assign, nonatomic, readonly) CGFloat screen_W;
@property (assign, nonatomic, readonly) CGFloat screen_H;
@property (assign, nonatomic, readonly) CGSize  screen_size;

@end

