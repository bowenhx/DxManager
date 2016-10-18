//
//  UploadingFormData.h
//  DxManager
//
//  Created by ligb on 16/10/18.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLPhotoPickerBrowserPhoto.h"

@interface NSArray (UploadArr_EX)

+ (NSArray <ZLPhotoPickerBrowserPhoto *> *)setPhotoPickerPhotos:(NSArray *)photos urlKey:(NSString *)key;

+ (NSArray *)uploadingImageFiles:(NSArray *)files;

@end

