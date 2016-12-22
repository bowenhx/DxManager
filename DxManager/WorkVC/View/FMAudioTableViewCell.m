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
#import "FMAudioPlay.h"

@interface FMAudioTableViewCell ()

@end

@implementation FMAudioTableViewCell

- (void)dealloc{
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.labLineBg.backgroundColor = [UIColor colorGray];
    
    self.btnPlay.backgroundColor = [UIColor colorAppBg];
    self.btnPlay.layer.cornerRadius = 3;
    
    
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
   
    self.btnDZ.selected = [info[@"is_dianzan"] boolValue];
    
    NSArray *itemDZ =  info[@"article_zan"];
    if ([itemDZ isKindOfClass:[NSArray class]]) {
        self.moreViewBg.items = itemDZ;
        self.labNumDZ.text = [NSString stringWithFormat:@"%ld",(long)itemDZ.count];
    }

}

- (IBAction)playAudioAction:(UIButton *)sender {
    [sender setTitle:@"正在载入..." forState:UIControlStateNormal];
    NSString *string = self.info[@"attach"][0][@"file_path"];
    
    FMAudioPlay *audioPlay = [FMAudioPlay share];
    //播放器已有
    if (audioPlay.audioPlayer) {
        if ([audioPlay.playURL isEqualToString:string]) {
            if ([audioPlay.audioPlayer isPlaying]) {
                [audioPlay.audioPlayer pause];
                [sender setTitle:@"点击播放" forState:UIControlStateNormal];
            }else{
                [audioPlay.audioPlayer play];
                [sender setTitle:@"点击暂停" forState:UIControlStateNormal];
            }
            return;
        }else{
            audioPlay.audioPlayer = nil;
            UIButton *tempBtn = [BRuntimeObj getTempObj];
            [tempBtn setTitle:@"点击播放" forState:UIControlStateNormal];
            
        }
    }
    
    audioPlay.playURL = string;
    
    //初始化AVAudioPlayer播放器，并开始播放
    [audioPlay loadPlayerDataBlock:^(AVAudioPlayer *play) {
        if (play) {
            [play play];
            [BRuntimeObj tempSaveObj:sender];
            dispatch_async(dispatch_get_main_queue(), ^{
                [sender setTitle:@"点击暂停" forState:UIControlStateNormal];
            });
        }
    }];
    

    
    
}


@end
