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

@interface DrugManageTableViewCell ()
@property (nonatomic,strong) MPMoviePlayerViewController *moviePlayer;//视频播放控制器

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
        NSURL *url = [NSString getPathByAppendString:self.info[@"file_path"]];
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
    //要名
    self.labDrugName.text = info[@"title"];
    
    //时间
    self.labTime.text = info[@"drugs_date"];//[NSString getDateStringWithString:info[@"add_time"]];
    
    //数量
    self.labNum.text = info[@"drugs_quantum"];
    
    //用药时间
    self.labDrugTime.text = info[@"drugs_time"];
    
    //送药人
    self.labPerson1.text = info[@"drugs_sender"];
    
    //责任人
    self.labPerson2.text = info[@"drugs_manager"];
    
    //病因
    self.labPathogeny.text = info[@"drugs_reason"];
    
    AVURLAsset *asset1 = [[AVURLAsset alloc] initWithURL:[NSString getPathByAppendString:self.info[@"file_path"]] options:nil];
    AVAssetImageGenerator *generate1 = [[AVAssetImageGenerator alloc] initWithAsset:asset1];
    generate1.appliesPreferredTrackTransform = YES;
    NSError *err = NULL;
    CMTime time = CMTimeMake(1, 2);
    CGImageRef oneRef = [generate1 copyCGImageAtTime:time actualTime:NULL error:&err];
    UIImage *one = [[UIImage alloc] initWithCGImage:oneRef];
    self.imgVideo.image = one;

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
