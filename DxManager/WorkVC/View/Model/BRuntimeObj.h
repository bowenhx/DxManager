//
//  BRuntimeObj.h
//  BKMobile
//
//  Created by Guibin on 15/5/27.
//  Copyright (c) 2015年 com.mobile-kingdom.bkapps All rights reserved.
//
/**
 *   用来处理对象 的延时作用
 */
#import <Foundation/Foundation.h>

@interface BRuntimeObj : NSObject

+ (void)tempSaveObj:(id)obj;

+ (id)getTempObj;

@end
