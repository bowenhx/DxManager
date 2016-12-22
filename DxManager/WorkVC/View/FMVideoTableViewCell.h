//
//  FMVideoTableViewCell.h
//  DxManager
//
//  Created by Stray on 16/10/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PraiseItemView.h"

@interface FMVideoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headView;

@property (weak, nonatomic) IBOutlet UILabel *labName;

@property (weak, nonatomic) IBOutlet UILabel *labTime;

@property (weak, nonatomic) IBOutlet UILabel *labBrowse;

@property (weak, nonatomic) IBOutlet UIImageView *imgVideo;

@property (weak, nonatomic) IBOutlet UIButton *btnPlay;

@property (weak, nonatomic) IBOutlet UILabel *labContent;

@property (weak, nonatomic) IBOutlet PraiseItemView *moreViewBg;

@property (weak, nonatomic) IBOutlet UIButton *btnDZ;

@property (weak, nonatomic) IBOutlet UILabel *labNumDZ;

@property (weak, nonatomic) IBOutlet UILabel *labLineBg;


@property (nonatomic , strong) UIViewController *viewController;
@property (nonatomic, copy) NSDictionary *info;



@end
