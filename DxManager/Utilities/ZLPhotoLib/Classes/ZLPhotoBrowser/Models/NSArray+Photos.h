//
//  NSArray+Photos.h
//  BKMobile
//
//  Created by ligb on 16/6/20.
//  Copyright © 2016年 com.mobile-kingdom.bkapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLPhotoPickerBrowserPhoto.h"

@interface NSArray (EX_Photos)

+ (NSArray <ZLPhotoPickerBrowserPhoto *> *)setPhotoPickerPhotos:(NSArray *)photos urlKey:(NSString *)key;

@end
