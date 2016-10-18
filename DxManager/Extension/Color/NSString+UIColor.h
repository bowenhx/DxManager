//
//  NSString+UIColor.h
//  BKMobile
//
//  Created by Guibin on 15/1/23.
//  Copyright (c) 2015年 com.mobile-kingdom.bkapps All rights reserved.
//
//根地址
#define BASE_IMG_URL  @"http://dx.sitemn.com"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 用于扩展NSString,转换UIColor
@interface NSString (UIColor)

// 获取由当前的NSString转换来的UIColor
- (UIColor*)color;

/**
 *  判断字符串是否为空
 */
- (BOOL)isStringBlank:(NSString *)string;

- (NSString *)bString;
/**
 *  判断字符串中有多少个中文字符
 *
 *  @return 个数
 */
- (NSInteger)stringRangeCHNum;

+ (NSString *)getDateStringWithString:(NSString *)string;

+ (NSURL *)getPathByAppendString:(NSString *)string;

@end

@interface NSObject (string)

- (NSString *)objString;


@end