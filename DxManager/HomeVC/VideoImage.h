//
//  VideoImage.h
//  DxManager
//
//  Created by ligb on 16/11/24.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VideoImage : NSObject
+ (VideoImage *)share;

- (void)getVideoImageForURL:(NSURL *)url block:(void(^)(UIImage *image))block;

@end
