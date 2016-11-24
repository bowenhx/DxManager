//
//  VideoImage.m
//  DxManager
//
//  Created by ligb on 16/11/24.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "VideoImage.h"
@interface VideoImage()
@property (nonatomic , strong)AVURLAsset *asset;
@property (nonatomic , strong)AVAssetImageGenerator *generator;
@end;
@implementation VideoImage

+ (VideoImage *)share{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


- (void)getVideoImageForURL:(NSURL *)url block:(void(^)(UIImage *image))block{
    if (url) {
        NSURL *videoURL = nil;
        NSString *string = [NSString stringWithFormat:@"%@",url];
        if ([string hasSuffix:@".mp4"] || [string hasPrefix:@".mov"]) {
            if ([url isKindOfClass:[NSURL class]]) {
                videoURL = url;
            }else if ([url isKindOfClass:[NSString class]]){
                videoURL = [NSURL URLWithString:(NSString *)url];
            }
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                AVURLAsset *asset1 = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
                AVAssetImageGenerator *generate1 = [[AVAssetImageGenerator alloc] initWithAsset:asset1];
                generate1.appliesPreferredTrackTransform = YES;
                NSError *err = NULL;
                CMTime time = CMTimeMake(1, 2);
                CGImageRef oneRef = [generate1 copyCGImageAtTime:time actualTime:NULL error:&err];
                UIImage *image = [[UIImage alloc] initWithCGImage:oneRef];
                block ( image );
            });

        }else{
             block ( nil );
        }
    }else{
       block ( nil );
    }
    
}

@end
