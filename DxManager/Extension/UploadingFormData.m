//
//  UploadingFormData.m
//  DxManager
//
//  Created by ligb on 16/10/18.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "UploadingFormData.h"
#import "NSString+UIColor.h"

@implementation NSArray (UploadArr_EX)

+ (NSArray <ZLPhotoPickerBrowserPhoto *> *)setPhotoPickerPhotos:(NSArray *)photos urlKey:(NSString *)key{
    if (photos.count == 0) return nil;
    
    NSMutableArray *data = [NSMutableArray array];
    [photos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
            photo.photoURL = [NSString getPathByAppendString:obj[key]];
            [data addObject:photo];
        }else if ([obj isKindOfClass:[NSString class]]) {
            ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
            photo.photoURL = [NSURL URLWithString:obj];
            [data addObject:photo];
        }
    }];
    return data;
}

+ (NSArray *)uploadingImageFiles:(NSArray *)files
{
    NSMutableArray *imageArr = [NSMutableArray arrayWithCapacity:files.count];
    
    [files enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage *image = nil;
        if ([obj isKindOfClass:[ZLPhotoPickerBrowserPhoto class]]) {
            ZLPhotoPickerBrowserPhoto *photo = (ZLPhotoPickerBrowserPhoto *)obj;
            ZLPhotoAssets *asset = photo.asset;
            if (asset && [asset isKindOfClass:[ZLPhotoAssets class]]) {
                image = asset.originImage;
            }else {
                image = photo.photoImage;
            }
            
            if (image) {
                NSString *name = [NSString stringWithFormat:@"file%lu",(unsigned long)++idx];
                [imageArr addObject:@[name , image]];
            }
        }
    }];
    return imageArr;
}


@end

