//
//  ItemVIewsHeight.h
//  DxManager
//
//  Created by ligb on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ItemVIewsHeight : NSObject


+ (CGFloat)loadItmesCounts:(NSInteger)count;

+ (CGFloat)loadTextContents:(NSString *)str;

+ (CGFloat)loadTextContentsMaxWidth:(CGFloat)width string:(NSString *)str;

@end
