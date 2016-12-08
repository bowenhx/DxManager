//
//  FMAudioPlay.h
//  DxTeacher
//
//  Created by Stray on 16/11/29.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import "BRuntimeObj.h"

@interface FMAudioPlay : NSObject

+ (FMAudioPlay *)share;

- (instancetype)initWithAudioURL:(NSString *)url;

@property (nonatomic , copy) NSString *playURL;

@property (nonatomic,strong) AVAudioPlayer *audioPlayer;//播放器

- (void)loadPlayerDataBlock:(void (^)(AVAudioPlayer *play))play;


+ (void)audioPlayerURL:(NSString *)vudioURL Block:(void (^)(NSData *data))block;

+ (void)videoPlayerURL:(NSString *)videoURL block:(void (^)(UIImage *image))block;


@end
