//
//  BNetworkConfig.m
//  BKMobile
//
//  Created by Guibin on 14/2/9.
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
    }
    return self;
}


@end
