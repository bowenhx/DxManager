//
//  FMTableViewCell.m
//  DxManager
//
//  Created by Stray on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import "FMVideoTableViewCell.h"
#import "AppDefine.h"
#import "FMAudioPlay.h"

@interface FMVideoTableViewCell ()

@property (nonatomic,strong) MPMoviePlayerViewController *moviePlayer;//视频播放控制器
@property (nonatomic , strong) NSURL *videoURL;
@end

@implementation FMVideoTableViewCell

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.labLineBg.backgroundColor = [UIColor colorGray];
}
/**
 *  创建媒体播放控制器
 *
 *  @return 媒体播放控制器
 */
- (MPMoviePlayerViewController *)moviePlayer{
    if (!_moviePlayer) {
        NSURL *url = [NSString getPathByAppendString:self.info[@"attach"][0][@"file_path"]];
        _moviePlayer=[[MPMoviePlayerViewController alloc] initWithContentURL:url];
        _moviePlayer.view.frame = self.viewController.view.bounds;
        _moviePlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _moviePlayer.moviePlayer.shouldAutoplay = NO;
        [self.viewController presentViewController:_moviePlayer animated:YES completion:^{
            
        }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                selector:@selector(movieFinishedCallback:)
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:_moviePlayer.moviePlayer];
    }
    return _moviePlayer;
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
    
    NSArray *attach = self.info[@"attach"];

    
    if ([attach isKindOfClass:[NSArray class]] && attach.count) {
        NSString *path = attach[0][@"file_path"];
        @WeakObj(self);
        [FMAudioPlay videoPlayerURL:path block:^(UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (image) {
                    self.imgVideo.hidden = NO;
                    self.btnPlay.hidden = NO;
                    selfWeak.imgVideo.image = image;
                }
            });
        }];
    }else{
        self.imgVideo.hidden = YES;
        self.btnPlay.hidden = YES;
    }
    
}


- (IBAction)playVideoAction:(UIButton *)sender {
    //播放
    [self.moviePlayer.moviePlayer play];
    
}


-(void)movieFinishedCallback:(NSNotification*)notify{
    // 视频播放完或者在presentMoviePlayerViewControllerAnimated下的Done按钮被点击响应的通知。
    MPMoviePlayerController* theMovie = [notify object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                   name:MPMoviePlayerPlaybackDidFinishNotification
                                                 object:theMovie];
    [self.viewController dismissMoviePlayerViewControllerAnimated];
}
@end
