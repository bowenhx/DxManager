//
//  DrugManageTableViewCell.m
//  DxManager
//
//  Created by ligb on 16/10/19.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "DrugManageTableViewCell.h"
#import "AppDefine.h"
#import "FMAudioPlay.h"

@interface DrugManageTableViewCell ()
@property (nonatomic,strong) MPMoviePlayerViewController *moviePlayer;//视频播放控制器
@property (nonatomic , strong)NSURL *videoURL;
@end

@implementation DrugManageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.itemViewBg.layer.borderWidth = .5;
    self.itemViewBg.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.itemViewBg.layer.cornerRadius = 7;
}
/**
 *  创建媒体播放控制器
 *
 *  @return 媒体播放控制器
 */
- (MPMoviePlayerViewController *)moviePlayer{
    if (!_moviePlayer) {
        _moviePlayer=[[MPMoviePlayerViewController alloc] initWithContentURL:self.videoURL];
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
- (void)setSearchInfo:(NSDictionary *)searchInfo{
    _searchInfo = searchInfo;

    //要名
    self.labDrugName.text = searchInfo[@"title"];
    
    //时间
    self.labTime.text = searchInfo[@"drugs_date"];//[NSString getDateStringWithString:info[@"add_time"]];
    
    //数量
    self.labNum.text = searchInfo[@"drugs_quantum"];
    
    //用药时间
    self.labDrugTime.text = searchInfo[@"drugs_time"];
    
    //送药人
    self.labPerson1.text = searchInfo[@"drugs_sender"];
    
    //责任人
    self.labPerson2.text = searchInfo[@"drugs_manager"];
    
    //病因
    self.labPathogeny.text = searchInfo[@"drugs_reason"];
    
    self.videoURL = [NSString getPathByAppendString:self.searchInfo[@"file_path"]];
    NSString *path = self.searchInfo[@"file_path"];
    @WeakObj(self);
    [FMAudioPlay videoPlayerURL:path block:^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (image) {
                selfWeak.imgVideo.image = image;
            }
        });
    }];
    
}

- (void)setInfo:(NSDictionary *)info{
    _info = info;
    //要名
    self.labDrugName.text = info[@"title"];
    
    //时间
    self.labTime.text = info[@"fields"][@"drugs_date"];//[NSString getDateStringWithString:info[@"add_time"]];
    
    //数量
    self.labNum.text = info[@"fields"][@"drugs_quantum"];
    
    //用药时间
    self.labDrugTime.text = info[@"fields"][@"drugs_time"];
    
    //送药人
    self.labPerson1.text = info[@"fields"][@"drugs_sender"];
    
    //责任人
    self.labPerson2.text = info[@"fields"][@"drugs_manager"];
    
    //病因
    self.labPathogeny.text = info[@"fields"][@"drugs_reason"];
    
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
