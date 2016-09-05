//
//  BNetData.h
//  BKMobile
//
//  Created by ligb on 16/5/20.
//  Copyright © 2016年 com.mobile-kingdom.bkapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANet.h"
#import "EKURL.h"


@interface BNetData : NSObject

//message 表示后台message字段
@property (nonatomic , copy) NSString       *message;

@property (nonatomic , strong) id           data;

@property (nonatomic , assign) NSInteger    status;

@end
