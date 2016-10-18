//
//  FMAudioTableViewCell.m
//  DxManager
//
//  Created by Stray on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "FMAudioTableViewCell.h"
#import "AppDefine.h"

@interface FMAudioTableViewCell ()
@property (nonatomic,strong) AVAudioPlayer *audioPlayer;//播放器

@end

@implementation FMAudioTableViewCell

- (void)dealloc{
   
    [self removeAudioPlayer];
}
- (void)removeAudioPlayer{
    if ([self.audioPlayer isPlaying]) {
        [self.audioPlayer pause];
        _audioPlayer = nil;
    }

}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.labLineBg.backgroundColor = [UIColor colorGray];
    
    self.btnPlay.backgroundColor = [UIColor colorAppBg];
    self.btnPlay.layer.cornerRadius = 3;
    
    
}
/**
 *  创建播放器
 *
 *  @return 音频播放器
 */
- (AVAudioPlayer *)audioPlayer{
    if (!_audioPlayer) {
        NSURL *url = [NSString getPathByAppendString:self.info[@"attach"][0][@"file_path"]];
        NSError *error=nil;
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        //初始化播放器，注意这里的Url参数只能时文件路径，不支持HTTP Url
        _audioPlayer=[[AVAudioPlayer alloc] initWithData:data error:&error];
        //设置播放器属性
        _audioPlayer.numberOfLoops=0;//设置为0不循环
//        _audioPlayer.delegate = self;
        [_audioPlayer prepareToPlay];//加载音频文件到缓存
        if(error){
            NSLog(@"初始化播放器过程发生错误,错误信息:%@",error.localizedDescription);
            return nil;
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeAudioPlayer) name:@"audioPlayCenter" object:nil];
        
    }
    return _audioPlayer;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setInfo:(NSDictionary *)info{
    _info = info;
    [self.headView img_setImageWithURL:info[@"img_url"] placeholderImage:nil];
    
    self.labName.text = info[@"fields"][@"author"];
    
    //时间
    self.labTime.text = [NSString getDateStringWithString:info[@"add_time"]];
    
    //播放次数
    self.labBrowse.text = [NSString stringWithFormat:@"已浏览%@次",info[@"click"]];
    
    self.labContent.text = info[@"title"];
    
}

- (IBAction)playAudioAction:(UIButton *)sender {
    //播放
    if ([self.audioPlayer isPlaying]) {
        [self.audioPlayer pause];
        [self.btnPlay setTitle:@"点击播放" forState:0];
    }else{
         [self.audioPlayer play];
        [self.btnPlay setTitle:@"点击暂停" forState:0];
    }
    
    
}


@end
