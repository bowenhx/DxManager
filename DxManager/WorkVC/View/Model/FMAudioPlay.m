//
//  FMAudioPlay.m
//  DxTeacher
//
//  Created by Stray on 16/11/29.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import "FMAudioPlay.h"
#import "AppDefine.h"

@implementation FMAudioPlay

+ (FMAudioPlay *)share{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancelAudioPlay) name:@"audioPlayCenter" object:nil];
    }
    return self;
}
- (instancetype)initWithAudioURL:(NSString *)url{
    self = [super init];
    if (self) {
        [FMAudioPlay audioPlayerURL:url Block:^(NSData *data) {
            if (data) {
                NSError *error;
                //初始化播放器，注意这里的Url参数只能时文件路径，不支持HTTP Url
                _audioPlayer= [[AVAudioPlayer alloc] initWithData:data error:&error];
                //设置播放器属性
                _audioPlayer.numberOfLoops = 0;//设置为0不循环
                [_audioPlayer prepareToPlay];//加载音频文件到缓存
                
            }
        }];
    }
    return self;
}

- (void)loadPlayerDataBlock:(void (^)(AVAudioPlayer *play))play{
    
    [FMAudioPlay audioPlayerURL:self.playURL Block:^(NSData *data) {
        if (data) {
            NSError *error;
            //初始化播放器，注意这里的Url参数只能时文件路径，不支持HTTP Url
            _audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:&error];
            //设置播放器属性
            _audioPlayer.numberOfLoops = 0;//设置为0不循环
            [_audioPlayer prepareToPlay];//加载音频文件到缓存
            play (_audioPlayer);
        }
    }];
}

+ (void)audioPlayerURL:(NSString *)vudioURL Block:(void (^)(NSData *data))block{
    
    NSString *paths = [[vudioURL componentsSeparatedByString:@"/"] lastObject];
    
    NSData *data = [NSData dataWithContentsOfFile:[NSHomeDirectory() stringByAppendingPathComponent:paths]];
    
    if (data) {
        block (data);
        return;
    }
    
    NSURL *url = [NSString getPathByAppendString:vudioURL];
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error= %@",error);
        }else{
           
            if ([data writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:paths] atomically:YES]) {
                NSLog(@"音频文件保存成功");
            }else{
                NSLog(@"音频文件保存失败");
            }

            block (data);
        }
    }] resume];
}

- (void)cancelAudioPlay{
    if (self.audioPlayer) {
        [self.audioPlayer pause];
        self.audioPlayer = nil;
    }
}


+ (void)videoPlayerURL:(NSString *)videoURL block:(void (^)(UIImage *image))block{
    NSURL *url = [NSString getPathByAppendString:videoURL];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        AVURLAsset *asset1 = [[AVURLAsset alloc] initWithURL:url options:nil];
        AVAssetImageGenerator *generate1 = [[AVAssetImageGenerator alloc] initWithAsset:asset1];
        generate1.appliesPreferredTrackTransform = YES;
        NSError *err = NULL;
        CMTime time = CMTimeMake(1, 2);
        CGImageRef oneRef = [generate1 copyCGImageAtTime:time actualTime:NULL error:&err];
        UIImage *image = [[UIImage alloc] initWithCGImage:oneRef];
        block ( image );
    });
    
   
}


@end
