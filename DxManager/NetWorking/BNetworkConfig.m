//
//  BNetworkConfig.m
//  BKMobile
//
//  Created by Guibin on 15/2/9.
//  Copyright (c) 2015年 com.mobile-kingdom.bkapps All rights reserved.
//

#import "BNetworkConfig.h"
#import "AppDefine.h"

@implementation BNetworkConfig

+ (BNetworkConfig *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        _argumentsDic = [NSDictionary dictionary];
        //获取表情数据
        [self getSmileyFile];
    }
    return self;
}

- (void)getSmileyFile{
    
    NSArray *smileyData = [SavaData parseArrFromFile:SmileyKey];
    if (smileyData.count) {
        DLog(@"已存在表情库");
    }else{
        [[ANet share] get:BAPI_Smiley completion:^(BNetData *model, NSString *netErr) {
            if (model.status ==1) {
                
                NSArray *bdata = model.data;
                //保存图片数组方便后面
                [SavaData writeArrToFile:bdata FileName:SmileyKey];
                //[self cacheDownloadSmiley:data];
            }
        }];
     }
}

@end
