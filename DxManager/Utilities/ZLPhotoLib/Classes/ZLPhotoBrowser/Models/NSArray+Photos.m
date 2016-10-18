//
//  NSArray+Photos.m
//  BKMobile
//
//  Created by ligb on 16/6/20.
//  Copyright © 2016年 com.mobile-kingdom.bkapps. All rights reserved.
//

#import "NSArray+Photos.h"

@implementation NSArray (EX_Photos)

+ (NSArray <ZLPhotoPickerBrowserPhoto *> *)setPhotoPickerPhotos:(NSArray *)photos urlKey:(NSString *)key{
    if (photos.count == 0) return nil;
    
    NSMutableArray *data = [NSMutableArray array];
    [photos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
            photo.photoURL = [NSURL URLWithString:obj[key]];
            [data addObject:photo];
        }else if ([obj isKindOfClass:[NSString class]]) {
            ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
            photo.photoURL = [NSURL URLWithString:obj];
            [data addObject:photo];
        }
    }];
    return data;
}


@end
